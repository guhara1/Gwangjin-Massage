param(
  [string]$SiteHost = "gwangjin-massage.pages.dev",
  [string]$BaseUrl = "https://gwangjin-massage.pages.dev",
  [string]$Key = "8b6f9d2a4f6a4a9ca710d98f5e21c7be",
  [string]$SitemapPath = "",
  [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
if (-not $SitemapPath) {
  $SitemapPath = Join-Path $Root "sitemap.xml"
}

if (-not (Test-Path -LiteralPath $SitemapPath)) {
  throw "Sitemap not found: $SitemapPath"
}

[xml]$sitemap = Get-Content -LiteralPath $SitemapPath -Raw -Encoding UTF8
$urls = @($sitemap.urlset.url | ForEach-Object { $_.loc } | Where-Object { $_ -like "$BaseUrl*" } | Sort-Object -Unique)
if ($urls.Count -eq 0) {
  throw "No URLs found in sitemap for $BaseUrl"
}

$body = @{
  host = $SiteHost
  key = $Key
  keyLocation = "$BaseUrl/$Key.txt"
  urlList = $urls
} | ConvertTo-Json -Depth 4

$endpoints = @(
  "https://api.indexnow.org/indexnow",
  "https://searchadvisor.naver.com/indexnow"
)

Write-Host "IndexNow key: $Key"
Write-Host "Key location: $BaseUrl/$Key.txt"
Write-Host "URL count: $($urls.Count)"

foreach ($endpoint in $endpoints) {
  if ($DryRun) {
    Write-Host "[DryRun] POST $endpoint"
    continue
  }

  try {
    $response = Invoke-WebRequest -Uri $endpoint -Method Post -ContentType "application/json; charset=utf-8" -Body $body -UseBasicParsing
    Write-Host "$endpoint => HTTP $($response.StatusCode)"
  } catch {
    $status = $null
    if ($_.Exception.Response) {
      $status = [int]$_.Exception.Response.StatusCode
    }
    $statusText = if ($status) { " with HTTP $status" } else { "" }
    Write-Warning "$endpoint failed${statusText}: $($_.Exception.Message)"
  }
}
