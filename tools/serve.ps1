param(
  [int]$Port = 4173,
  [string]$Root = (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path))
)

$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://127.0.0.1:$Port/")
$listener.Start()
Write-Host "Serving $Root at http://127.0.0.1:$Port/"

$types = @{
  ".html" = "text/html; charset=utf-8"
  ".css" = "text/css; charset=utf-8"
  ".js" = "application/javascript; charset=utf-8"
  ".json" = "application/json; charset=utf-8"
  ".xml" = "application/xml; charset=utf-8"
  ".txt" = "text/plain; charset=utf-8"
  ".svg" = "image/svg+xml"
  ".webmanifest" = "application/manifest+json; charset=utf-8"
}

while ($listener.IsListening) {
  $context = $listener.GetContext()
  try {
    $path = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart("/"))
    if ([string]::IsNullOrWhiteSpace($path)) { $path = "index.html" }
    $full = Join-Path $Root $path
    if (Test-Path -LiteralPath $full -PathType Container) {
      $full = Join-Path $full "index.html"
    }
    if (!(Test-Path -LiteralPath $full -PathType Leaf)) {
      $context.Response.StatusCode = 404
      $bytes = [System.Text.Encoding]::UTF8.GetBytes("Not found")
    } else {
      $ext = [System.IO.Path]::GetExtension($full)
      $context.Response.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
      $bytes = [System.IO.File]::ReadAllBytes($full)
    }
    $context.Response.ContentLength64 = $bytes.Length
    $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } catch {
    $context.Response.StatusCode = 500
  } finally {
    $context.Response.OutputStream.Close()
  }
}
