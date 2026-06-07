Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Pages = @()

function PageText([string]$Html) {
  $main = [regex]::Replace($Html, '(?s)<style.*?</style>|<script.*?</script>|<header.*?</header>|<footer.*?</footer>', '')
  $txt = [System.Net.WebUtility]::HtmlDecode(([regex]::Replace($main, '<[^>]+>', ' ')))
  return [regex]::Replace($txt, '\s+', ' ').Trim()
}

Get-ChildItem -LiteralPath $Root -Recurse -Filter index.html |
  Where-Object { $_.FullName -notlike '*\work\*' } |
  ForEach-Object {
    $html = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
    $rel = $_.FullName.Substring($Root.Length + 1).Replace('\', '/')
    $Pages += [pscustomobject]@{
      Path = $rel
      Chars = (PageText $html).Length
      Title = ([regex]::Match($html, '<title>(.*?)</title>').Groups[1].Value)
      Desc = ([regex]::Match($html, '<meta name="description" content="(.*?)"').Groups[1].Value)
      Text = PageText $html
      Header = ([regex]::Match($html, '(?s)<header>.*?</header>').Value)
    }
  }

function Shingles($s) {
  $w = $s -split '\s+'
  $set = @{}
  for ($i = 0; $i -le $w.Count - 4; $i++) {
    $set[($w[$i..($i + 3)] -join ' ')] = 1
  }
  return $set
}

$badLen = @($Pages | Where-Object { $_.Chars -lt 2000 -or $_.Chars -gt 2500 })
$longDesc = @($Pages | Where-Object { $_.Desc.Length -gt 80 })
$dupeTitles = @($Pages | Group-Object Title | Where-Object { $_.Count -gt 1 })
$dupeDesc = @($Pages | Group-Object Desc | Where-Object { $_.Count -gt 1 })
$badMenu = @($Pages | Where-Object {
  $_.Header -match '건대입구역 출장마사지|군자역 출장마사지|구의역 출장마사지|강변역 출장마사지|중곡동 출장마사지|구의동 출장마사지|자양동 출장마사지|화양동 출장마사지'
})
$region = @($Pages | Where-Object {
  $_.Path -like 'gwangjin-gu/*/index.html' -and
  $_.Path -notlike 'gwangjin-gu/stations/*' -and
  $_.Path -ne 'gwangjin-gu/index.html' -and
  $_.Path -ne 'gwangjin-gu/area/index.html'
})

$maxSim = 0
$pair = ''
$sets = @{}
foreach ($p in $region) { $sets[$p.Path] = Shingles $p.Text }
for ($i = 0; $i -lt $region.Count; $i++) {
  for ($j = $i + 1; $j -lt $region.Count; $j++) {
    $a = $sets[$region[$i].Path]
    $b = $sets[$region[$j].Path]
    $inter = 0
    foreach ($k in $a.Keys) {
      if ($b.ContainsKey($k)) { $inter++ }
    }
    $union = ($a.Keys + $b.Keys | Sort-Object -Unique).Count
    if ($union -gt 0) {
      $sim = [math]::Round($inter / $union, 3)
      if ($sim -gt $maxSim) {
        $maxSim = $sim
        $pair = "$($region[$i].Path) <> $($region[$j].Path)"
      }
    }
  }
}

[pscustomobject]@{
  Pages = $Pages.Count
  MinChars = ($Pages | Measure-Object Chars -Minimum).Minimum
  MaxChars = ($Pages | Measure-Object Chars -Maximum).Maximum
  LengthBad = $badLen.Count
  DescriptionsOver80 = $longDesc.Count
  DuplicateTitles = $dupeTitles.Count
  DuplicateDescriptions = $dupeDesc.Count
  BadMenuFiles = $badMenu.Count
  RegionPages = $region.Count
  MaxRegionSimilarity = $maxSim
  MostSimilarPair = $pair
}

if ($badLen.Count -or $longDesc.Count -or $dupeTitles.Count -or $dupeDesc.Count -or $badMenu.Count) {
  exit 1
}

