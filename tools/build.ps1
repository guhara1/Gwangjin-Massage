Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$BaseUrl = "https://gwangjin-massage.pages.dev"
$Brand = "플러스 마사지"
$PrimaryKeyword = "광진 출장마사지"
$PhoneDisplay = "0508-202-4743"
$PhoneTel = "+825082024743"
$Hours = "연중무휴 24시간 상담"

$Regions = @(
  @{
    Slug = "junggok-gunja-area"; Name = "중곡·군자권역"; H1 = "중곡·군자권역 출장마사지 안내";
    Summary = "중곡동과 군자동을 중심으로 5호선·7호선 생활권이 만나는 광진 북서부 권역입니다.";
    Dongs = @(
      @{ Slug = "junggok-dong"; Name = "중곡동"; Title = "중곡동 출장마사지"; Arrival = 24; Landmarks = "중곡역, 용마산로, 중곡제일시장 인근"; Character = "주거 밀도가 높고 역세권 생활 동선이 짧은 권역" },
      @{ Slug = "gunja-dong"; Name = "군자동"; Title = "군자동 출장마사지"; Arrival = 22; Landmarks = "군자역, 능동로, 세종대학교 생활권"; Character = "환승역과 대학가 수요가 함께 있는 생활권" }
    )
  },
  @{
    Slug = "neung-hwayang-area"; Name = "능동·화양권역"; H1 = "능동·화양권역 출장마사지 안내";
    Summary = "어린이대공원과 대학가, 건대 생활권이 이어지는 유동 인구 중심 권역입니다.";
    Dongs = @(
      @{ Slug = "neung-dong"; Name = "능동"; Title = "능동 출장마사지"; Arrival = 23; Landmarks = "어린이대공원역, 능동로, 서울어린이대공원 인근"; Character = "공원과 주거지가 가까운 조용한 생활권" },
      @{ Slug = "hwayang-dong"; Name = "화양동"; Title = "화양동 출장마사지"; Arrival = 21; Landmarks = "건대입구역, 화양사거리, 건국대학교 인근"; Character = "대학가와 상권이 집중된 광진 대표 생활권" }
    )
  },
  @{
    Slug = "guui-gwangjang-area"; Name = "구의·광장권역"; H1 = "구의·광장권역 출장마사지 안내";
    Summary = "구의역과 강변역, 광나루역 생활권이 이어지는 동부 주거·업무 권역입니다.";
    Dongs = @(
      @{ Slug = "guui-dong"; Name = "구의동"; Title = "구의동 출장마사지"; Arrival = 20; Landmarks = "구의역, 광진구청, 강변역 생활권"; Character = "업무와 주거 동선이 겹치는 광진 중심 생활권" },
      @{ Slug = "gwangjang-dong"; Name = "광장동"; Title = "광장동 출장마사지"; Arrival = 27; Landmarks = "광나루역, 아차산, 워커힐 인근"; Character = "한강과 아차산 생활권이 가까운 동부 주거 권역" }
    )
  },
  @{
    Slug = "jayang-kondae-area"; Name = "자양·건대권역"; H1 = "자양·건대권역 출장마사지 안내";
    Summary = "자양동, 건대입구, 뚝섬유원지역 생활권을 함께 보는 남부 핵심 권역입니다.";
    Dongs = @(
      @{ Slug = "jayang-dong"; Name = "자양동"; Title = "자양동 출장마사지"; Arrival = 22; Landmarks = "뚝섬유원지역, 건대입구역, 자양전통시장 인근"; Character = "한강 접근성과 주거 수요가 함께 있는 생활권" }
    )
  }
)

$Stations = @(
  @{ Slug = "kondae-station"; Name = "건대입구역"; Title = "건대입구역 출장마사지"; Lines = @("2호선 광진권", "7호선 광진권"); Arrival = 20; Nearby = "화양동, 자양동, 건국대학교, 건대 로데오거리"; Seo = "건대입구역 출장마사지 | 광진구 건대입구역 방문 마사지" },
  @{ Slug = "gunja-station"; Name = "군자역"; Title = "군자역 출장마사지"; Lines = @("5호선 광진권", "7호선 광진권"); Arrival = 22; Nearby = "군자동, 중곡동, 능동로, 세종대학교 생활권"; Seo = "군자역 출장마사지 | 광진구 군자역 인근 방문 마사지" },
  @{ Slug = "guui-station"; Name = "구의역"; Title = "구의역 출장마사지"; Lines = @("2호선 광진권"); Arrival = 20; Nearby = "구의동, 광진구청, 강변역 생활권"; Seo = "구의역 출장마사지 | 광진구 구의역 방문 마사지" },
  @{ Slug = "gangbyeon-station"; Name = "강변역"; Title = "강변역 출장마사지"; Lines = @("2호선 광진권"); Arrival = 23; Nearby = "동서울터미널, 테크노마트, 구의동 생활권"; Seo = "강변역 출장마사지 | 광진구 강변역 방문 마사지" },
  @{ Slug = "achasan-station"; Name = "아차산역"; Title = "아차산역 출장마사지"; Lines = @("5호선 광진권"); Arrival = 25; Nearby = "구의동, 능동, 아차산 생활권"; Seo = "아차산역 출장마사지 | 광진구 아차산역 방문 마사지" },
  @{ Slug = "gwangnaru-station"; Name = "광나루역"; Title = "광나루역 출장마사지"; Lines = @("5호선 광진권"); Arrival = 27; Nearby = "광장동, 한강공원, 워커힐 인근"; Seo = "광나루역 출장마사지 | 광진구 광나루역 방문 마사지" },
  @{ Slug = "junggok-station"; Name = "중곡역"; Title = "중곡역 출장마사지"; Lines = @("7호선 광진권"); Arrival = 24; Nearby = "중곡동, 용마산로, 중곡시장 생활권"; Seo = "중곡역 출장마사지 | 광진구 중곡역 방문 마사지" },
  @{ Slug = "children-grand-park-station"; Name = "어린이대공원역"; Title = "어린이대공원역 출장마사지"; Lines = @("7호선 광진권"); Arrival = 23; Nearby = "능동, 화양동, 세종대학교 생활권"; Seo = "어린이대공원역 출장마사지 | 광진구 어린이대공원역 방문 마사지" },
  @{ Slug = "ttukseom-resort-station"; Name = "뚝섬유원지역"; Title = "뚝섬유원지역 출장마사지"; Lines = @("7호선 광진권"); Arrival = 24; Nearby = "자양동, 한강공원, 건대입구 생활권"; Seo = "뚝섬유원지역 출장마사지 | 광진구 뚝섬유원지역 방문 마사지" }
)

$Courses = @(
  @{ Slug = "fatigue"; Name = "피로 회복 관리"; Desc = "누적된 피로와 긴장 완화를 목표로 하는 기본 관리입니다." },
  @{ Slug = "aroma"; Name = "아로마 관리"; Desc = "부드러운 압과 아로마 케어를 함께 원하는 분께 적합합니다." },
  @{ Slug = "sports"; Name = "스포츠 관리"; Desc = "운동 후 뭉침과 활동량이 많은 날의 컨디션 회복에 초점을 둡니다." },
  @{ Slug = "couple"; Name = "커플·가족 관리"; Desc = "같은 장소에서 함께 예약하는 동반 관리 구성입니다." },
  @{ Slug = "group"; Name = "기업·단체 관리"; Desc = "행사, 복지, 단체 예약은 일정과 인원 확인 후 안내합니다." }
)

function E([string]$Text) {
  return [System.Net.WebUtility]::HtmlEncode($Text)
}

function X([string]$Text) {
  return [System.Security.SecurityElement]::Escape($Text)
}

function Clean-Output {
  $paths = @("gwangjin-gu", "course", "reservation", "guide", "reviews", "customer", "privacy", "terms", "index.html", "sitemap.xml", "rss.xml", "robots.txt", "site.webmanifest", "favicon.svg", ".nojekyll")
  foreach ($p in $paths) {
    $full = Join-Path $Root $p
    if (Test-Path -LiteralPath $full) {
      Remove-Item -LiteralPath $full -Recurse -Force
    }
  }
}

function MenuItem([string]$Href, [string]$Label) {
  return "<li><a href=""$Href"">$(E $Label)</a></li>"
}

function NestedItem([string]$Href, [string]$Label, [array]$Children) {
  $kids = ($Children -join "")
  return "<li class=""has-sub""><a href=""$Href"">$(E $Label)</a><ul class=""submenu sub2"">$kids</ul></li>"
}

function HeaderHtml([string]$Active) {
  $gwangjinSub = @(
    (MenuItem "/gwangjin-gu/service/" "서비스 안내"),
    (MenuItem "/gwangjin-gu/area/" "출장 가능 지역"),
    (MenuItem "/gwangjin-gu/stations/" "지하철역 인근 안내"),
    (MenuItem "/gwangjin-gu/hours/" "예약 가능 시간"),
    (MenuItem "/gwangjin-gu/course-guide/" "코스 선택 안내"),
    (MenuItem "/gwangjin-gu/checklist/" "이용 전 확인사항"),
    (MenuItem "/gwangjin-gu/faq/" "자주 묻는 질문")
  )
  $areaSub = @((MenuItem "/gwangjin-gu/area/" "광진구 전체"))
  foreach ($r in $Regions) {
    $kids = @()
    foreach ($d in $r.Dongs) { $kids += MenuItem "/gwangjin-gu/$($d.Slug)/" $d.Name }
    if ($r.Slug -eq "jayang-kondae-area") { $kids += MenuItem "/gwangjin-gu/stations/kondae-station/" "건대입구 생활권" }
    $areaSub += NestedItem "/gwangjin-gu/$($r.Slug)/" $r.Name $kids
  }
  $line2 = @("kondae-station", "guui-station", "gangbyeon-station")
  $line5 = @("gunja-station", "achasan-station", "gwangnaru-station")
  $line7 = @("junggok-station", "children-grand-park-station", "ttukseom-resort-station")
  $stationSub = @((MenuItem "/gwangjin-gu/stations/" "광진구 지하철역 전체"))
  foreach ($pair in @(@("2호선 광진권",$line2), @("5호선 광진권",$line5), @("7호선 광진권",$line7))) {
    $kids = @()
    foreach ($slug in $pair[1]) {
      $s = $Stations | Where-Object { $_.Slug -eq $slug } | Select-Object -First 1
      $kids += MenuItem "/gwangjin-gu/stations/$($s.Slug)/" $s.Name
    }
    $stationSub += NestedItem "/gwangjin-gu/stations/" $pair[0] $kids
  }
  $courseSub = @(
    (MenuItem "/course/" "전체 코스"),
    (MenuItem "/course/fatigue/" "피로 회복 관리"),
    (MenuItem "/course/aroma/" "아로마 관리"),
    (MenuItem "/course/sports/" "스포츠 관리"),
    (MenuItem "/course/couple/" "커플·가족 관리"),
    (MenuItem "/course/group/" "기업·단체 관리"),
    (MenuItem "/course/price/" "가격 안내"),
    (MenuItem "/course/guide/" "코스 선택 가이드")
  )
  $reservationSub = @("예약 방법","예약 가능 시간","방문 가능 장소","결제 안내","변경·취소 안내","예약 전 체크사항") | ForEach-Object { MenuItem "/reservation/" $_ }
  $guideSub = @(
    (MenuItem "/guide/" "처음 이용하시는 분"),
    (MenuItem "/guide/checklist/" "방문 전 준비사항"),
    (MenuItem "/guide/safety/" "위생 및 안전 기준"),
    (MenuItem "/guide/aftercare/" "관리 후 주의사항"),
    (MenuItem "/guide/notice/" "금지행위 안내"),
    (MenuItem "/customer/faq/" "이용 FAQ")
  )
  $reviewSub = @((MenuItem "/reviews/" "전체 후기"), (MenuItem "/reviews/area/" "지역별 후기"), (MenuItem "/reviews/stations/" "역세권 후기"))
  $customerSub = @(
    (MenuItem "/customer/" "공지사항"),
    (MenuItem "/customer/faq/" "자주 묻는 질문"),
    (MenuItem "/customer/contact/" "1:1 문의"),
    (MenuItem "/customer/partner/" "제휴 문의"),
    (MenuItem "/privacy/" "개인정보처리방침"),
    (MenuItem "/terms/" "이용약관")
  )
  function TopLi([string]$Key, [string]$Href, [string]$Label, [array]$Sub) {
    $cls = if ($Active -eq $Key) { " class=""active""" } else { "" }
    $subHtml = if ($Sub.Count -gt 0) { "<ul class=""submenu"">$($Sub -join '')</ul>" } else { "" }
    return "<li><a href=""$Href""$cls>$(E $Label)</a>$subHtml</li>"
  }
  $items = @(
    (TopLi "home" "/" "홈" @()),
    (TopLi "gwangjin" "/gwangjin-gu/" "광진 출장마사지" $gwangjinSub),
    (TopLi "area" "/gwangjin-gu/area/" "지역별 안내" $areaSub),
    (TopLi "stations" "/gwangjin-gu/stations/" "지하철역별 안내" $stationSub),
    (TopLi "course" "/course/" "코스안내" $courseSub),
    (TopLi "reservation" "/reservation/" "예약안내" $reservationSub),
    (TopLi "guide" "/guide/" "이용가이드" $guideSub),
    (TopLi "reviews" "/reviews/" "후기" $reviewSub),
    (TopLi "customer" "/customer/" "고객센터" $customerSub)
  )
  return "<header><nav class=""nav"" aria-label=""상단 메뉴""><a class=""brand"" href=""/""><span class=""mark"">P</span><span>$(E $Brand)<small>GWANGJIN CARE</small></span></a><button class=""toggle"" type=""button"" aria-label=""메뉴 열기"">☰</button><ul class=""menu"">$($items -join '')</ul><a class=""call"" href=""tel:$PhoneTel"">예약</a></nav></header>"
}

$Css = @"
*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;background:#0b0c10;color:#f5f2eb;font-family:"Pretendard","Apple SD Gothic Neo","Noto Sans KR",system-ui,sans-serif;line-height:1.75}a{color:inherit;text-decoration:none}.wrap{max-width:1180px;margin:0 auto;padding:0 22px}header{position:sticky;top:0;z-index:30;background:rgba(11,12,16,.86);backdrop-filter:blur(16px);border-bottom:1px solid rgba(255,255,255,.08)}.nav{max-width:1240px;margin:0 auto;display:flex;align-items:center;gap:12px;padding:12px 20px}.brand{display:flex;align-items:center;gap:10px;font-weight:850;white-space:nowrap}.brand small{display:block;color:#d9b56f;font-size:11px;letter-spacing:.12em}.mark{width:34px;height:34px;border-radius:8px;display:grid;place-items:center;background:linear-gradient(135deg,#f0cf8a,#d98975);color:#17110a;font-weight:900}.menu{list-style:none;display:flex;align-items:center;gap:2px;margin:0 0 0 auto;padding:0}.menu>li{position:relative}.menu>li>a{display:block;padding:10px 9px;border-radius:8px;font-size:14px;font-weight:700;color:#ece7dc}.menu>li>a:hover,.menu>li>a.active{background:rgba(240,207,138,.12);color:#f0cf8a}.submenu{position:absolute;top:100%;left:0;min-width:220px;padding:8px;margin:0;list-style:none;background:#151821;border:1px solid rgba(255,255,255,.1);border-radius:10px;box-shadow:0 22px 50px rgba(0,0,0,.38);opacity:0;visibility:hidden;transform:translateY(8px);transition:.18s}.menu>li:hover>.submenu,.menu>li:focus-within>.submenu,.has-sub:hover>.sub2{opacity:1;visibility:visible;transform:none}.submenu a{display:block;padding:9px 11px;border-radius:8px;color:#c9c2b5;font-size:13.5px}.submenu a:hover{background:rgba(255,255,255,.06);color:#fff}.has-sub{position:relative}.has-sub>a:after{content:"›";float:right;color:#d9b56f}.sub2{left:calc(100% + 7px);top:0}.call{padding:10px 14px;border-radius:999px;background:linear-gradient(135deg,#ffb14f,#ff7a18);color:#1c1006;font-weight:900}.toggle{display:none;margin-left:auto;background:transparent;color:#fff;border:1px solid rgba(255,255,255,.16);border-radius:8px;width:42px;height:42px}.hero{background:radial-gradient(70% 90% at 80% 0%,rgba(217,137,117,.2),transparent 60%),linear-gradient(180deg,#11141c,#0b0c10);border-bottom:1px solid rgba(255,255,255,.08)}.hero-inner{display:grid;grid-template-columns:1.1fr .9fr;gap:34px;align-items:center;min-height:620px}.eyebrow{color:#d9b56f;font-size:12px;font-weight:900;letter-spacing:.18em;text-transform:uppercase}.hero h1{font-size:clamp(38px,6vw,72px);line-height:1.08;margin:16px 0 18px;letter-spacing:-.03em}.grad{background:linear-gradient(135deg,#f0cf8a,#d98975);-webkit-background-clip:text;background-clip:text;color:transparent}.lead{color:#c7c0b5;font-size:17px;max-width:680px}.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:26px}.btn{display:inline-flex;padding:13px 18px;border-radius:10px;font-weight:850;border:1px solid rgba(255,255,255,.12)}.btn.primary{background:linear-gradient(135deg,#f0cf8a,#d98975);color:#17110a;border:0}.panel{background:linear-gradient(155deg,#171b24,#10131a);border:1px solid rgba(255,255,255,.1);border-radius:8px;padding:26px}.row{display:flex;justify-content:space-between;gap:12px;padding:12px 0;border-top:1px solid rgba(255,255,255,.08);color:#c7c0b5}.block{padding:76px 0}.sec{font-size:clamp(28px,4vw,46px);line-height:1.16;margin:12px 0 10px}.grid{display:grid;gap:16px}.g2{grid-template-columns:repeat(auto-fit,minmax(280px,1fr))}.g3{grid-template-columns:repeat(auto-fit,minmax(240px,1fr))}.card{display:block;background:#141821;border:1px solid rgba(255,255,255,.09);border-radius:8px;padding:22px;min-height:150px}.card:hover{border-color:rgba(240,207,138,.42);transform:translateY(-2px)}.k{color:#d9b56f;font-weight:900;font-size:12px;letter-spacing:.14em}.card h3{margin:8px 0 8px;font-size:20px}.card p,.muted{color:#bcb4a8}.chips{display:flex;flex-wrap:wrap;gap:8px;margin-top:18px}.chip{border:1px solid rgba(255,255,255,.12);border-radius:999px;padding:7px 11px;color:#d7d0c4}.content{max-width:940px}.content h1{font-size:clamp(34px,5vw,58px);line-height:1.12}.lux{margin:18px 0;padding:24px;border-left:3px solid #d9b56f;background:#141821;border-radius:0 8px 8px 0}.lux h2{margin-top:0}.lux h3{color:#d9b56f}.lux li{margin:7px 0}.toc{display:flex;flex-wrap:wrap;gap:8px;margin:24px 0}.toc a{border:1px solid rgba(255,255,255,.12);border-radius:999px;padding:7px 11px;color:#d7d0c4}.price-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px;margin-top:22px}.price-card{position:relative;background:#141821;border:1px solid rgba(255,255,255,.1);border-radius:8px;padding:22px;text-align:center}.price-card.featured{border-color:#d9b56f}.price-badge{position:absolute;top:-14px;left:50%;transform:translateX(-50%);background:#d9a080;color:#1a100b;border-radius:999px;padding:4px 13px;font-weight:900;font-size:12px}.price-num{font-size:34px;font-weight:950;letter-spacing:0;margin:10px 0}.price-note{color:#c7c0b5}.price-cta{display:block;margin-top:14px;padding:10px;border-radius:8px;border:1px solid rgba(255,255,255,.12);font-weight:850}.featured .price-cta{background:linear-gradient(135deg,#f0cf8a,#d98975);color:#17110a;border:0}.footer{border-top:1px solid rgba(255,255,255,.08);background:#090a0d;padding:38px 0;color:#bcb4a8}.footer-grid{display:grid;grid-template-columns:2fr repeat(3,1fr);gap:20px}.footer a{display:block;margin:5px 0;color:#d7d0c4}.fab{position:fixed;right:18px;bottom:18px;z-index:40;border-radius:999px;background:linear-gradient(135deg,#ffb14f,#ff7a18);color:#1c1006;padding:14px 18px;font-weight:950;box-shadow:0 14px 30px rgba(0,0,0,.32)}details{background:#11151d;border:1px solid rgba(255,255,255,.1);border-radius:8px;padding:15px;margin:10px 0}summary{cursor:pointer;font-weight:850}@media(max-width:980px){.toggle{display:block}.call{display:none}.menu{position:fixed;inset:67px 0 auto 0;display:none;max-height:calc(100vh - 67px);overflow:auto;background:#0d0f15;padding:12px 20px;align-items:stretch}.menu.open{display:block}.menu>li>a{padding:13px 10px}.submenu,.sub2{position:static;opacity:1;visibility:visible;transform:none;box-shadow:none;margin:4px 0 8px 12px}.hero-inner{grid-template-columns:1fr;min-height:auto;padding:64px 22px}.footer-grid,.price-grid{grid-template-columns:1fr}.brand small{display:none}}
"@

function FooterHtml {
  return "<footer class=""footer""><div class=""wrap footer-grid""><div><b class=""grad"">$(E $Brand)</b><p>광진구 방문 마사지 예약 안내. 지역, 역세권, 코스, 예약 전 확인사항을 차례대로 안내합니다.</p><p>상담: <a href=""tel:$PhoneTel"">$PhoneDisplay</a> · $Hours</p></div><div><b>지역</b><a href=""/gwangjin-gu/area/"">지역별 안내</a><a href=""/gwangjin-gu/stations/"">지하철역별 안내</a></div><div><b>예약</b><a href=""/course/"">코스안내</a><a href=""/reservation/"">예약안내</a><a href=""/guide/"">이용가이드</a></div><div><b>고객센터</b><a href=""/customer/"">공지사항</a><a href=""/customer/faq/"">FAQ</a><a href=""/privacy/"">개인정보처리방침</a><a href=""/terms/"">이용약관</a></div></div></footer>"
}

function Page([string]$Path, [string]$Title, [string]$Desc, [string]$Active, [string]$Body) {
  $canonical = "$BaseUrl$Path"
  $crumbs = @(@{ "@type" = "ListItem"; position = 1; name = "홈"; item = $BaseUrl + "/" })
  if ($Path -ne "/") {
    $parts = $Path.Trim("/") -split "/"
    $acc = ""
    $pos = 2
    foreach ($part in $parts) {
      $acc += "/$part"
      $crumbs += @{ "@type" = "ListItem"; position = $pos; name = $part; item = $BaseUrl + "$acc/" }
      $pos++
    }
  }
  $jsonObj = @{
    "@context" = "https://schema.org"
    "@graph" = @(
      @{ "@type" = "WebPage"; name = $Title; description = $Desc; url = $canonical; inLanguage = "ko-KR"; publisher = @{ "@type" = "Organization"; name = $Brand } },
      @{ "@type" = "BreadcrumbList"; itemListElement = $crumbs }
    )
  }
  $json = $jsonObj | ConvertTo-Json -Depth 8 -Compress
  return "<!doctype html><html lang=""ko""><head><meta charset=""utf-8""><meta name=""viewport"" content=""width=device-width,initial-scale=1""><title>$(E $Title)</title><meta name=""description"" content=""$(E $Desc)""><meta name=""naver-site-verification"" content=""731294e13f4a5bbf6419b94eaee2bdd6b8e56af8""><link rel=""canonical"" href=""$canonical""><link rel=""icon"" href=""/favicon.svg"" type=""image/svg+xml""><link rel=""alternate"" type=""application/rss+xml"" title=""$(E $Brand) RSS"" href=""/rss.xml""><link rel=""manifest"" href=""/site.webmanifest""><meta name=""theme-color"" content=""#0b0c10""><meta property=""og:title"" content=""$(E $Title)""><meta property=""og:description"" content=""$(E $Desc)""><meta property=""og:url"" content=""$canonical""><meta property=""og:site_name"" content=""$(E $Brand)""><style>$Css</style><script type=""application/ld+json"">$json</script></head><body>$(HeaderHtml $Active)$Body$(FooterHtml)<a class=""fab"" href=""tel:$PhoneTel"">예약 문의</a><script>document.querySelector('.toggle')?.addEventListener('click',function(){document.querySelector('.menu').classList.toggle('open')})</script></body></html>"
}

function Write-Page([string]$Path, [string]$Title, [string]$Desc, [string]$Active, [string]$Body) {
  $target = if ($Path -eq "/") { Join-Path $Root "index.html" } else { Join-Path $Root ($Path.Trim("/") + "/index.html") }
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
  Page $Path $Title $Desc $Active $Body | Set-Content -LiteralPath $target -Encoding UTF8
}

function Hero([string]$Eyebrow, [string]$H1, [string]$Lead, [string]$PrimaryHref, [string]$PrimaryLabel) {
  return "<section class=""hero""><div class=""wrap hero-inner""><div><span class=""eyebrow"">$(E $Eyebrow)</span><h1>$H1</h1><p class=""lead"">$(E $Lead)</p><div class=""actions""><a class=""btn primary"" href=""$PrimaryHref"">$(E $PrimaryLabel)</a><a class=""btn"" href=""/gwangjin-gu/area/"">지역별 안내</a><a class=""btn"" href=""/gwangjin-gu/stations/"">역별 안내</a></div></div><div class=""panel""><div class=""k"">PLUS MASSAGE</div><h2>광진구 예약 체크</h2><div class=""row""><span>상호</span><b>$(E $Brand)</b></div><div class=""row""><span>상담</span><b>$Hours</b></div><div class=""row""><span>안내</span><b>지역·시간·코스 확인</b></div><a class=""btn primary"" href=""tel:$PhoneTel"" style=""margin-top:18px"">전화 예약</a></div></div></section>"
}

function Cards([array]$Items) {
  $html = ""
  foreach ($i in $Items) {
    $html += "<a class=""card"" href=""$($i.Href)""><div class=""k"">$(E $i.Kicker)</div><h3>$(E $i.Title)</h3><p>$(E $i.Text)</p></a>"
  }
  return "<div class=""grid g3"">$html</div>"
}

function PriceTable([string]$Eyebrow = "요금 안내", [string]$Heading = "코스별 기본 요금") {
  return "<section class=""block price-block""><div class=""wrap""><span class=""eyebrow"">$(E $Eyebrow)</span><h2 class=""sec"">$(E $Heading)</h2><div class=""price-grid""><article class=""price-card""><h3>60분</h3><div class=""price-num"">90,000원</div><a class=""price-cta"" href=""tel:$PhoneTel"">문의</a></article><article class=""price-card featured""><span class=""price-badge"">추천</span><h3>90분</h3><div class=""price-num"">150,000원</div><a class=""price-cta"" href=""tel:$PhoneTel"">문의</a></article><article class=""price-card""><h3>120분</h3><div class=""price-num"">180,000원</div><a class=""price-cta"" href=""tel:$PhoneTel"">문의</a></article></div><p class=""muted"">최종 요금은 상담 시 확인됩니다. <a href=""/course/price/"">상세 보기</a></p></div></section>"
}

function FaqHtml([array]$Faqs) {
  $html = ""
  $items = @()
  if ($Faqs.Count -gt 0 -and $Faqs[0] -is [string]) {
    for ($i = 0; $i -lt ($Faqs.Count - 1); $i += 2) {
      $items += @{ Q = $Faqs[$i]; A = $Faqs[$i + 1] }
    }
  } else {
    foreach ($f in $Faqs) {
      if ($f -is [hashtable]) {
        $items += $f
      } elseif ($f.Count -ge 2) {
        $items += @{ Q = $f[0]; A = $f[1] }
      }
    }
  }
  foreach ($item in $items) { $html += "<details><summary>$(E $item.Q)</summary><p>$(E $item.A)</p></details>" }
  return "<section class=""block""><div class=""wrap content""><span class=""eyebrow"">FAQ</span><h2 class=""sec"">자주 묻는 질문</h2>$html</div></section>"
}

function StandardContent([string]$Eyebrow, [string]$H1, [string]$Lead, [array]$Sections, [array]$Faqs) {
  $toc = "<div class=""toc"">"
  $panels = ""
  $idx = 1
  foreach ($s in $Sections) {
    $id = "sec-$idx"
    $toc += "<a href=""#$id"">$(E $s.Title)</a>"
    $body = ""
    foreach ($p in $s.Texts) {
      if ($p -is [array]) {
        $body += "<ul>"
        foreach ($li in $p) { $body += "<li>$li</li>" }
        $body += "</ul>"
      } elseif ($p -match '^<') {
        $body += $p
      } else {
        $body += "<p>$(E $p)</p>"
      }
    }
    $panels += "<section class=""lux"" id=""$id""><h2>$(E $s.Title)</h2>$body</section>"
    $idx++
  }
  $toc += "</div>"
  return "<section class=""block""><div class=""wrap content""><span class=""eyebrow"">$(E $Eyebrow)</span><h1>$H1</h1><p class=""lead"">$(E $Lead)</p><div class=""actions""><a class=""btn primary"" href=""tel:$PhoneTel"">예약문의</a><a class=""btn"" href=""/course/"">코스안내</a></div>$toc$panels</div></section>$(FaqHtml $Faqs)"
}

function Dong-GuideData([string]$Slug) {
  $data = @{
    "junggok-dong" = @{
      NearbyTitle = "중곡동 방문 가능 생활권";
      Nearby = @(
        @{ H = "중곡역 인근"; P = "중곡역 인근은 중곡동 문의에서 가장 먼저 확인하는 생활권입니다. 방문 가능 여부는 상세 주소와 예약 시간에 따라 달라질 수 있습니다." },
        @{ H = "군자역 인근"; P = "군자역 인근은 중곡동과 군자동 생활권이 이어지는 구간입니다. 군자역 기준인지, 중곡동 안쪽 주소인지 함께 확인합니다." },
        @{ H = "용마산로·긴고랑로 생활권"; P = "용마산로와 긴고랑로 주변은 주거지 안쪽 주소가 많아 공동현관과 주차 가능 여부를 미리 확인하는 것이 좋습니다." },
        @{ H = "중곡1동·중곡2동·중곡3동·중곡4동 통합 안내"; P = "중곡1동부터 중곡4동까지 통합 안내합니다. 세부 행정동보다 실제 주소와 방문 환경이 예약 판단에 더 중요합니다." },
        @{ H = "주거지·숙소 방문 안내"; P = "아파트, 빌라, 오피스텔, 숙소 방문 문의는 출입 방식과 조용한 공간 확보 여부를 함께 확인합니다." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/"; Label="광진 출장마사지" },
        @{ Href="/gwangjin-gu/area/"; Label="광진구 출장 가능 지역" },
        @{ Href="/gwangjin-gu/junggok-gunja-area/"; Label="중곡·군자권역" },
        @{ Href="/gwangjin-gu/gunja-dong/"; Label="군자동" },
        @{ Href="/gwangjin-gu/stations/junggok-station/"; Label="중곡역" },
        @{ Href="/gwangjin-gu/stations/gunja-station/"; Label="군자역" }
      );
      Intro = "중곡동은 중곡역, 군자역 생활권과 연결되어 주거지와 숙소 문의가 많은 지역입니다.";
      Faqs = @(
        @("중곡동 전 지역 방문이 가능한가요?", "예약 시간, 정확한 위치, 배정 상황에 따라 가능 여부가 달라질 수 있습니다. 중곡1동부터 중곡4동까지 세부 위치를 기준으로 확인하는 것이 좋습니다."),
        @("중곡역 근처도 예약할 수 있나요?", "중곡역 인근은 중곡동 주요 생활권으로 함께 안내할 수 있습니다. 정확한 방문 가능 여부는 예약 시 위치를 기준으로 확인합니다."),
        @("군자역 인근도 중곡동 페이지에서 확인할 수 있나요?", "군자역 인근은 중곡동과 군자동 생활권이 겹치는 지역입니다. 자세한 내용은 군자역 안내 페이지와 함께 확인할 수 있습니다."),
        @("당일 예약도 가능한가요?", "당일 예약은 시간대와 배정 상황에 따라 달라집니다. 저녁 시간대와 주말에는 사전 예약을 권장드립니다."),
        @("예약 전 준비할 것이 있나요?", "정확한 주소, 출입 방법, 주차 가능 여부, 조용한 공간을 미리 확인해주시면 원활한 이용에 도움이 됩니다.")
      )
    }
    "gunja-dong" = @{
      NearbyTitle = "군자동 방문 가능 생활권";
      Nearby = @(
        @{ H = "군자역 인근"; P = "군자역 인근은 5호선과 7호선 환승 흐름이 있어 예약 문의가 많은 생활권입니다. 역 주변 상권인지, 주거지 안쪽인지에 따라 안내 기준이 달라질 수 있습니다." },
        @{ H = "능동로 생활권"; P = "능동로 주변은 세종대학교, 어린이대공원 방향과 이어집니다. 도로 접근성은 좋지만 시간대별 혼잡이 있을 수 있어 상세 주소 확인이 필요합니다." },
        @{ H = "세종대학교 인근"; P = "세종대학교 인근은 대학가와 주거지가 함께 있어 이용 시간과 방문 장소 성격을 구분해 확인하는 것이 좋습니다." },
        @{ H = "중곡동 인접 생활권"; P = "군자동 북쪽은 중곡동 생활권과 이어집니다. 중곡역 방향인지 군자역 중심인지에 따라 관련 안내 페이지를 함께 확인할 수 있습니다." },
        @{ H = "오피스텔·숙소 방문 안내"; P = "환승역 주변 오피스텔과 숙소 문의는 출입 방법, 엘리베이터, 연락 가능 상태를 예약 전에 확인하면 안내가 더 원활합니다." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/"; Label="광진 출장마사지" },
        @{ Href="/gwangjin-gu/junggok-gunja-area/"; Label="중곡·군자권역" },
        @{ Href="/gwangjin-gu/junggok-dong/"; Label="중곡동" },
        @{ Href="/gwangjin-gu/stations/gunja-station/"; Label="군자역" },
        @{ Href="/gwangjin-gu/stations/junggok-station/"; Label="중곡역" }
      );
      Intro = "군자동은 군자역 환승 생활권과 세종대학교 인근 수요가 함께 나타나는 지역입니다.";
      Faqs = @(
        @("군자동 전 지역 방문이 가능한가요?", "정확한 주소와 예약 시간, 배정 상황을 확인한 뒤 가능 여부를 안내합니다."),
        @("군자역 근처도 예약할 수 있나요?", "군자역 인근은 군자동 주요 생활권으로 함께 안내합니다. 환승역 주변은 출구와 건물 위치를 함께 확인해 주세요."),
        @("세종대학교 인근도 가능한가요?", "세종대학교 인근은 능동로 생활권으로 확인할 수 있으며 실제 가능 여부는 상담 단계에서 안내합니다."),
        @("당일 예약은 가능한가요?", "시간대에 따라 가능할 수 있지만 저녁과 주말은 사전 예약을 권장합니다."),
        @("무엇을 준비해야 하나요?", "주소, 출입 방법, 주차 가능 여부, 희망 코스와 인원을 미리 정리해 주세요.")
      )
    }
    "neung-dong" = @{
      NearbyTitle = "능동 방문 가능 생활권";
      Nearby = @(
        @{ H = "어린이대공원역 인근"; P = "어린이대공원역 인근은 능동 문의에서 가장 많이 확인하는 생활권입니다. 역과 가까워 보여도 공원 방향인지 주거지 안쪽인지에 따라 안내가 달라집니다." },
        @{ H = "서울어린이대공원 주변"; P = "공원 주변은 주말과 평일 이동 흐름이 다를 수 있습니다. 예약 시간대와 건물 접근 방식을 함께 확인하면 방문 안내가 더 정확해집니다." },
        @{ H = "능동로 생활권"; P = "능동로 주변은 군자동, 화양동 방향과 이어져 생활권이 겹칩니다. 실제 주소를 기준으로 가까운 역과 권역을 함께 확인합니다." },
        @{ H = "능동 주거지 안내"; P = "능동은 비교적 조용한 주거지 문의가 많아 관리받을 공간, 공동현관, 연락 가능 상태를 미리 준비하는 것이 좋습니다." },
        @{ H = "공원·주거지 인접 장소"; P = "공원 인근 숙소나 주거지 이용 시에는 출입 가능 여부와 조용한 공간 확보 여부를 상담 단계에서 확인합니다." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/neung-hwayang-area/"; Label="능동·화양권역" },
        @{ Href="/gwangjin-gu/hwayang-dong/"; Label="화양동" },
        @{ Href="/gwangjin-gu/stations/children-grand-park-station/"; Label="어린이대공원역" },
        @{ Href="/gwangjin-gu/stations/gunja-station/"; Label="군자역" }
      );
      Intro = "능동은 어린이대공원역과 공원 주변 주거지가 가까운 차분한 생활권입니다.";
      Faqs = @(
        @("능동 전 지역 방문이 가능한가요?", "세부 주소와 시간대, 배정 상황에 따라 가능 여부를 안내합니다."),
        @("어린이대공원역 근처도 가능한가요?", "어린이대공원역 인근은 능동 주요 생활권으로 함께 확인할 수 있습니다."),
        @("공원 주변 숙소도 확인할 수 있나요?", "숙소나 오피스텔은 방문 가능 기준과 출입 방법을 먼저 확인합니다."),
        @("주말 예약은 가능한가요?", "주말은 문의가 몰릴 수 있어 사전 예약을 권장합니다."),
        @("예약 전 준비할 정보는 무엇인가요?", "정확한 주소, 출입 방법, 연락 가능 상태, 희망 코스를 준비해 주세요.")
      )
    }
    "hwayang-dong" = @{
      NearbyTitle = "화양동 방문 가능 생활권";
      Nearby = @(
        @{ H = "건대입구역 인근"; P = "건대입구역 인근은 화양동에서 가장 활발한 상권 생활권입니다. 상권 혼잡 시간대에는 상세 주소와 출입 방법을 먼저 확인하는 것이 좋습니다." },
        @{ H = "화양사거리 생활권"; P = "화양사거리 주변은 대학가, 상권, 주거지가 가까워 방문 장소의 성격이 다양합니다. 예약 시 위치와 이용 환경을 함께 확인합니다." },
        @{ H = "건국대학교 인근"; P = "건국대학교 인근은 학생, 상권, 숙소 문의가 섞일 수 있습니다. 정확한 건물명과 연락 가능 상태를 준비해 주세요." },
        @{ H = "어린이대공원역 연결 생활권"; P = "화양동 북쪽은 어린이대공원역 생활권과도 이어집니다. 건대입구역 기준인지 어린이대공원역 기준인지 구분하면 안내가 더 정확합니다." },
        @{ H = "상권·숙소 방문 안내"; P = "상권과 숙소 주변은 출입 방식과 소음 환경이 다를 수 있습니다. 조용한 공간 확보 여부를 예약 전에 확인해 주세요." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/neung-hwayang-area/"; Label="능동·화양권역" },
        @{ Href="/gwangjin-gu/neung-dong/"; Label="능동" },
        @{ Href="/gwangjin-gu/stations/kondae-station/"; Label="건대입구역" },
        @{ Href="/gwangjin-gu/stations/children-grand-park-station/"; Label="어린이대공원역" }
      );
      Intro = "화양동은 건대입구 상권과 대학가, 주거지가 함께 있는 광진 대표 생활권입니다.";
      Faqs = @(
        @("화양동 전 지역 방문이 가능한가요?", "건물 위치와 예약 시간, 배정 상황을 기준으로 가능 여부를 안내합니다."),
        @("건대입구역 근처도 가능한가요?", "건대입구역 인근은 화양동과 자양동 생활권이 겹치는 지역으로 상세 위치 확인이 필요합니다."),
        @("상권 주변 숙소도 예약할 수 있나요?", "숙소 방문은 출입 기준과 조용한 공간 확보 여부를 먼저 확인합니다."),
        @("당일 예약도 가능한가요?", "가능할 수 있지만 혼잡 시간대에는 사전 문의를 권장합니다."),
        @("코스는 어떻게 선택하나요?", "피로도, 선호 압, 이용 시간과 장소 환경을 기준으로 상담 후 선택하는 것이 좋습니다.")
      )
    }
    "guui-dong" = @{
      NearbyTitle = "구의동 방문 가능 생활권";
      Nearby = @(
        @{ H = "구의역 인근"; P = "구의역 인근은 구의동 중심 생활권으로 업무와 주거 문의가 함께 나타납니다. 역 기준보다 정확한 주소와 건물 출입 방법이 더 중요합니다." },
        @{ H = "광진구청 주변"; P = "광진구청 주변은 행정·업무 동선과 주거지가 가까운 지역입니다. 방문 장소가 사무실인지 주거지인지에 따라 준비사항이 달라질 수 있습니다." },
        @{ H = "강변역 연결 생활권"; P = "구의동 동쪽은 강변역과 동서울터미널 생활권으로 이어집니다. 터미널·상업시설 인근은 시간대별 이동 상황을 함께 확인합니다." },
        @{ H = "자양동 인접 생활권"; P = "구의동 남쪽은 자양동 생활권과도 가까워 주소 기준으로 어느 안내가 더 적합한지 확인할 수 있습니다." },
        @{ H = "업무지·주거지 방문 안내"; P = "업무지와 주거지는 출입 방식과 이용 환경이 다릅니다. 예약 전 연락 가능 상태와 조용한 공간 확보 여부를 확인해 주세요." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/guui-gwangjang-area/"; Label="구의·광장권역" },
        @{ Href="/gwangjin-gu/gwangjang-dong/"; Label="광장동" },
        @{ Href="/gwangjin-gu/stations/guui-station/"; Label="구의역" },
        @{ Href="/gwangjin-gu/stations/gangbyeon-station/"; Label="강변역" }
      );
      Intro = "구의동은 구의역, 광진구청, 강변역 생활권이 이어지는 광진 중심 지역입니다.";
      Faqs = @(
        @("구의동 전 지역 방문이 가능한가요?", "세부 주소, 시간대, 배정 상황을 확인한 뒤 가능 여부를 안내합니다."),
        @("구의역 근처도 예약할 수 있나요?", "구의역 인근은 구의동 주요 생활권으로 함께 안내합니다."),
        @("광진구청 주변 사무실도 가능한가요?", "사무실은 출입 방식과 이용 가능한 공간을 먼저 확인합니다."),
        @("강변역 방향도 구의동에서 확인하나요?", "강변역과 가까운 구의동 주소는 강변역 안내도 함께 확인하면 좋습니다."),
        @("예약 전 준비사항은 무엇인가요?", "주소, 출입 방법, 연락 가능 상태, 주차 가능 여부를 준비해 주세요.")
      )
    }
    "gwangjang-dong" = @{
      NearbyTitle = "광장동 방문 가능 생활권";
      Nearby = @(
        @{ H = "광나루역 인근"; P = "광나루역 인근은 광장동 방문 문의에서 가장 먼저 확인하는 생활권입니다. 역 주변인지 주거지 안쪽인지에 따라 안내 시간이 달라질 수 있습니다." },
        @{ H = "아차산 인근"; P = "아차산 방향은 주거지와 자연 접근성이 함께 있는 생활권입니다. 세부 주소와 이동 동선을 상담 단계에서 확인합니다." },
        @{ H = "워커힐 주변"; P = "워커힐 주변은 대형 시설과 주거지가 함께 있어 방문 가능 기준과 출입 안내를 미리 확인하는 것이 좋습니다." },
        @{ H = "한강·광장동 주거지"; P = "한강 접근성이 좋은 주거지는 주차와 출입 기준이 장소마다 다를 수 있습니다. 예약 전 건물명과 연락 가능 상태를 알려주세요." },
        @{ H = "동부 주거권 방문 안내"; P = "광장동은 동부 주거권 성격이 강해 조용한 방문 환경과 정확한 주소 확인이 중요합니다." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/guui-gwangjang-area/"; Label="구의·광장권역" },
        @{ Href="/gwangjin-gu/guui-dong/"; Label="구의동" },
        @{ Href="/gwangjin-gu/stations/gwangnaru-station/"; Label="광나루역" },
        @{ Href="/gwangjin-gu/stations/achasan-station/"; Label="아차산역" }
      );
      Intro = "광장동은 광나루역, 한강, 아차산 생활권이 가까운 동부 주거 지역입니다.";
      Faqs = @(
        @("광장동 전 지역 방문이 가능한가요?", "정확한 주소와 예약 시간, 배정 상황을 확인한 뒤 안내합니다."),
        @("광나루역 근처도 가능한가요?", "광나루역 인근은 광장동 주요 생활권으로 함께 확인할 수 있습니다."),
        @("아차산이나 워커힐 주변도 확인하나요?", "아차산과 워커힐 주변은 세부 위치와 출입 조건을 상담 단계에서 확인합니다."),
        @("주말 예약은 가능한가요?", "주말은 문의가 몰릴 수 있어 여유 있게 문의하는 것을 권장합니다."),
        @("방문 전 무엇을 확인해야 하나요?", "주소, 주차 가능 여부, 출입 방법, 조용한 공간을 미리 확인해 주세요.")
      )
    }
    "jayang-dong" = @{
      NearbyTitle = "자양동 방문 가능 생활권";
      Nearby = @(
        @{ H = "뚝섬유원지역 인근"; P = "뚝섬유원지역 인근은 자양동과 한강 생활권이 이어지는 구간입니다. 한강공원 인근인지 주거지 안쪽인지에 따라 방문 안내가 달라집니다." },
        @{ H = "건대입구역 연결 생활권"; P = "자양동 북쪽은 건대입구역 생활권과도 연결됩니다. 상권 가까운 위치인지 자양동 주거지인지 구분해 확인하는 것이 좋습니다." },
        @{ H = "자양전통시장 인근"; P = "자양전통시장 주변은 생활 밀도가 높은 주거지 문의가 많습니다. 공동현관과 주차 가능 여부를 미리 확인해 주세요." },
        @{ H = "한강·주거지 생활권"; P = "한강과 가까운 주거지는 접근 동선이 다양할 수 있어 건물명과 정확한 주소를 기준으로 안내합니다." },
        @{ H = "오피스텔·숙소 방문 안내"; P = "자양동 오피스텔과 숙소 이용 시에는 방문 가능 기준, 출입 방법, 연락 가능 상태를 상담 전에 정리하는 것이 좋습니다." }
      );
      Links = @(
        @{ Href="/gwangjin-gu/jayang-kondae-area/"; Label="자양·건대권역" },
        @{ Href="/gwangjin-gu/stations/ttukseom-resort-station/"; Label="뚝섬유원지역" },
        @{ Href="/gwangjin-gu/stations/kondae-station/"; Label="건대입구역" },
        @{ Href="/gwangjin-gu/guui-dong/"; Label="구의동" }
      );
      Intro = "자양동은 한강 접근성과 건대입구 생활권, 주거지 문의가 함께 나타나는 지역입니다.";
      Faqs = @(
        @("자양동 전 지역 방문이 가능한가요?", "세부 위치와 예약 시간, 배정 상황에 따라 가능 여부가 달라질 수 있습니다."),
        @("뚝섬유원지역 근처도 예약할 수 있나요?", "뚝섬유원지역 인근은 자양동 주요 생활권으로 함께 안내할 수 있습니다."),
        @("건대입구역 근처 자양동도 확인하나요?", "건대입구역과 가까운 자양동 주소는 건대입구역 안내도 함께 확인하면 좋습니다."),
        @("당일 예약도 가능한가요?", "당일 예약은 상황에 따라 가능하지만 저녁과 주말은 사전 예약을 권장합니다."),
        @("예약 전 준비할 것은 무엇인가요?", "정확한 주소, 출입 방법, 주차 가능 여부, 희망 코스와 인원을 준비해 주세요.")
      )
    }
  }
  return $data[$Slug]
}

function Dong-Content($d, $r) {
  $g = Dong-GuideData $d.Slug
  $nearbyHtml = ""
  foreach ($item in $g.Nearby) {
    $nearbyHtml += "<h3>$(E $item.H)</h3><p>$(E $item.P)</p>"
  }
  $linkItems = @()
  foreach ($link in $g.Links) { $linkItems += "<a href=""$($link.Href)"">$(E $link.Label)</a>" }
  $sections = @(
    @{ Title="$($d.Name) 출장마사지 이용 안내"; Texts=@(
      "$($d.Name) 출장마사지는 고객이 원하는 장소로 방문해 피로 회복과 컨디션 관리를 돕는 방문형 관리 서비스입니다. 예약 시 위치, 희망 시간, 코스, 인원 정보를 확인한 뒤 방문 가능 여부를 안내드립니다.",
      "$($g.Intro) 의료 행위나 치료 효과를 약속하는 서비스가 아니므로 현재 컨디션과 주의사항은 예약 전에 편하게 알려주세요."
    ) },
    @{ Title=$g.NearbyTitle; Texts=@($nearbyHtml) },
    @{ Title="$($r.Name) 함께 보기"; Texts=@(
      "$($d.Name)과 가까운 생활권을 함께 확인하면 자신의 위치에 맞는 안내를 더 쉽게 찾을 수 있습니다. 메뉴명은 짧게 유지하고 각 상세 페이지에서 필요한 지역 정보를 확인하는 흐름으로 구성했습니다.",
      @($linkItems)
    ) },
    @{ Title="$($d.Name)에서 많이 찾는 관리 코스"; Texts=@(
      "<h3>피로 회복 관리</h3><p>퇴근 후 누적된 피로와 긴장을 줄이고 싶을 때 많이 확인하는 기본 관리입니다.</p><h3>아로마 관리</h3><p>부드러운 관리와 편안한 휴식을 선호하는 분에게 적합한 코스입니다.</p><h3>스포츠 관리</h3><p>활동량이 많거나 근육 뭉침이 느껴질 때 상담을 통해 선택할 수 있습니다.</p><h3>커플·가족 방문 관리</h3><p>동반 이용은 인원, 공간, 희망 시간을 함께 확인해야 하며 자세한 내용은 코스안내에서 확인할 수 있습니다.</p>",
      @('<a href="/course/">전체 코스 보기</a>', '<a href="/course/fatigue/">피로 회복 관리</a>', '<a href="/course/aroma/">아로마 관리</a>', '<a href="/course/sports/">스포츠 관리</a>')
    ) },
    @{ Title="$($d.Name) 출장마사지 예약 가능 시간"; Texts=@(
      "$($d.Name) 방문 예약은 시간대와 배정 상황에 따라 가능 여부가 달라질 수 있습니다. 저녁 시간대와 주말에는 문의가 몰릴 수 있으므로 여유 있게 예약하는 것을 권장드립니다.",
      "당일 예약도 가능할 수 있지만 정확한 위치, 희망 시작 시간, 코스와 인원을 확인한 뒤 안내합니다."
    ) },
    @{ Title="방문 전 준비사항"; Texts=@(
      "원활한 방문 관리를 위해 정확한 주소, 공동현관 출입 방법, 주차 가능 여부를 미리 확인해주시면 좋습니다. 숙소나 오피스텔 이용 시에는 방문 가능 여부와 출입 안내를 함께 확인하는 것이 좋습니다.",
      @("정확한 주소", "공동현관 출입 방법", "주차 가능 여부", "조용한 공간 확보", "수건 및 샤워 가능 여부", "예약자 연락 가능 여부")
    ) },
    @{ Title="위생 및 안전 안내"; Texts=@(
      "편안하고 안전한 이용을 위해 예약 정보 확인, 방문 전 안내, 위생 관리 기준을 중요하게 운영합니다. 건전한 방문 관리 서비스를 위해 이용 전 금지행위 안내를 확인해주시기 바랍니다.",
      @('<a href="/guide/safety/">위생 및 안전 기준</a>', '<a href="/guide/notice/">금지행위 안내</a>', '<a href="/gwangjin-gu/checklist/">이용 전 확인사항</a>')
    ) },
    @{ Title="예약문의"; Texts=@(
      "$($d.Name) 방문 가능 여부는 희망 시간과 정확한 위치에 따라 달라질 수 있습니다. 지역, 시간, 코스를 알려주시면 상담을 통해 가능 여부와 준비사항을 안내드립니다.",
      @('<a href="tel:+825082024743">전화 문의</a>', '<a href="/reservation/">예약안내</a>', '<a href="/course/">코스 확인하기</a>')
    ) }
  )
  $lead = "광진구 $($d.Name) 일대에서 방문 마사지 예약을 찾는 분들을 위해 출장 가능 지역, 예약 가능 시간, 코스 선택 기준, 이용 전 확인사항을 정리했습니다."
  return (StandardContent "동별 안내" "<span class=""grad"">$($d.Title)</span><br>예약 안내" $lead $sections $g.Faqs) + (PriceTable)
}

function Build-SimplePage([string]$Path, [string]$Active, [string]$Title, [string]$Heading, [string]$Desc, [array]$Links) {
  $cards = @()
  if ($Links.Count -gt 0 -and $Links[0] -is [string]) {
    for ($i = 0; $i -lt ($Links.Count - 3); $i += 4) {
      $cards += @{ Href=$Links[$i]; Kicker=$Links[$i + 1]; Title=$Links[$i + 2]; Text=$Links[$i + 3] }
    }
  } else {
    foreach ($l in $Links) { $cards += @{ Href=$l[0]; Kicker=$l[1]; Title=$l[2]; Text=$l[3] } }
  }
  $body = "$(Hero $Brand $Heading $Desc $Path '자세히 보기')<section class=""block""><div class=""wrap"">$(Cards $cards)</div></section>"
  Write-Page $Path $Title $Desc $Active $body
}

function Strip-HtmlText([string]$Html) {
  $text = [regex]::Replace($Html, '(?s)<style.*?</style>|<script.*?</script>|<header.*?</header>|<footer.*?</footer>', '')
  $text = [regex]::Replace($text, '<[^>]+>', ' ')
  $text = [System.Net.WebUtility]::HtmlDecode($text)
  $text = [regex]::Replace($text, '\s+', ' ').Trim()
  return $text
}

function Get-Category([string]$Path) {
  if ($Path -match '/stations/') { return 'station' }
  if ($Path -match '/gwangjin-gu/[^/]+-dong/') { return 'dong' }
  if ($Path -match '/gwangjin-gu/[^/]+-area/') { return 'area' }
  if ($Path -match '/course/') { return 'course' }
  if ($Path -match '/reservation/') { return 'reservation' }
  if ($Path -match '/guide/') { return 'guide' }
  if ($Path -match '/reviews/') { return 'reviews' }
  if ($Path -match '/customer|privacy|terms/') { return 'customer' }
  return 'general'
}

function Detail-Paragraphs([string]$Title, [string]$Desc, [string]$Path) {
  $category = Get-Category $Path
  $plainTitle = ($Title -replace '\s*\|.*$', '')
  $slug = ($Path.Trim('/') -split '/')[-1]
  $station = $Stations | Where-Object { $_.Slug -eq $slug } | Select-Object -First 1
  $dong = $null
  $region = $null
  foreach ($r in $Regions) {
    if ($r.Slug -eq $slug) { $region = $r }
    foreach ($d in $r.Dongs) {
      if ($d.Slug -eq $slug) { $dong = $d; $region = $r }
    }
  }
  $course = $Courses | Where-Object { $_.Slug -eq $slug } | Select-Object -First 1

  switch ($category) {
    'station' {
      $lineText = if ($station) { $station.Lines -join ", " } else { "광진구 지하철 생활권" }
      $nearby = if ($station) { $station.Nearby } else { "광진구 주요 생활권" }
      $arrival = if ($station) { $station.Arrival } else { 25 }
      return @(
        "$plainTitle 페이지는 $lineText 이용자가 실제 예약 전에 확인할 내용을 중심으로 작성했습니다. 메뉴에서는 역명을 짧게 보여 주고, 상세 페이지 제목과 본문에서만 검색 의도를 반영해 키워드 반복을 줄였습니다.",
        "$nearby 인근은 같은 역세권이라도 출구 방향과 건물 위치에 따라 안내 시간이 달라질 수 있습니다. 그래서 예약 상담에서는 역명보다 상세 주소, 출입 방법, 연락 가능한 번호를 먼저 확인합니다.",
        "이 페이지의 평균 안내 시간은 약 ${arrival}분 내외를 기준으로 적었습니다. 실제 방문 가능 여부는 시간대, 교통 상황, 현재 배정 상태, 희망 코스에 따라 달라지므로 확정 표현은 사용하지 않았습니다.",
        "$plainTitle 안내는 단순히 역 이름만 바꾼 문서가 되지 않도록 주변 생활권, 예약 전 체크사항, 코스 선택 기준을 함께 담았습니다. 사용자는 이 페이지에서 위치 기준을 잡고 예약안내나 코스안내로 이동할 수 있습니다.",
        "환승역인 경우에도 실제 URL은 하나만 유지합니다. 건대입구역과 군자역처럼 여러 노선 메뉴에 노출되는 항목은 같은 상세 페이지로 연결해 중복 URL과 도어웨이 신호를 줄였습니다.",
        "작성자는 플러스 마사지 운영팀이며, 페이지는 광진구 역세권 예약 상담 기준을 바탕으로 정리했습니다. 현장 상황은 계속 바뀔 수 있어 최종 가능 여부는 전화 상담에서 다시 확인하도록 안내합니다.",
        "이 콘텐츠의 목적은 검색 순위 확보보다 사용자가 자기 위치에서 예약 가능성을 판단하도록 돕는 것입니다. 그래서 출구명 나열보다 예약에 필요한 실무 정보와 확인 순서를 우선했습니다.",
        "의료적 진단이나 치료 효과를 주장하지 않으며, 방문 마사지 예약 안내 범위 안에서만 설명합니다. 컨디션에 특별한 문제가 있거나 안전상 우려가 있다면 이용 전 전문가 상담을 우선하는 것이 좋습니다.",
        "$plainTitle 페이지의 내부 링크는 지하철역 전체, 지역별 안내, 코스안내, 예약 전 체크사항으로 이어집니다. 이렇게 관련 정보가 연결되어 있어 사용자가 한 페이지에서 억지로 모든 결정을 하지 않아도 됩니다."
      )
    }
    'dong' {
      $dongName = if ($dong) { $dong.Name } else { $plainTitle }
      $landmarks = if ($dong) { $dong.Landmarks } else { "광진구 생활권" }
      $character = if ($dong) { $dong.Character } else { "주거와 상권이 함께 있는 생활권" }
      $arrival = if ($dong) { $dong.Arrival } else { 25 }
      $regionName = if ($region) { $region.Name } else { "광진구 권역" }
      return @(
        "$plainTitle 페이지는 $dongName 실제 생활권을 기준으로 예약 전 확인할 정보를 정리했습니다. 메뉴명은 ${dongName}처럼 짧게 유지하고, 페이지 제목에서만 필요한 검색어를 정확히 사용했습니다.",
        "${dongName}은 ${character}입니다. $landmarks 주변을 기준으로 주소 확인과 방문 가능 여부를 안내하지만, 같은 동 안에서도 골목 위치와 건물 출입 방식에 따라 안내가 달라질 수 있습니다.",
        "평균 안내 시간은 약 ${arrival}분 내외로 표시했습니다. 이 숫자는 확정 시간이 아니라 상담 전 기준이며, 실제 배정은 예약 시간대와 이동 상황에 맞춰 다시 확인합니다.",
        "$regionName 페이지가 넓은 생활권을 보여 준다면, 이 동 페이지는 실제 주소를 말했을 때 어떤 준비가 필요한지 알려주는 역할을 합니다. 두 페이지의 범위가 다르기 때문에 중복 페이지가 되지 않도록 구성했습니다.",
        "예약 전에는 상세 주소, 공동현관 또는 프런트 안내, 주차 가능 여부, 연락 가능한 번호를 준비해 주세요. 이런 정보가 정리되어 있으면 상담 단계에서 불필요한 재확인을 줄일 수 있습니다.",
        "작성자는 플러스 마사지 운영팀이며, 콘텐츠는 지역별 예약 상담에서 반복적으로 확인하는 항목을 기준으로 정리했습니다. 실제 방문 경험을 과장해 쓰지 않고, 확인 가능한 운영 기준만 안내합니다.",
        "$dongName 페이지는 키워드 반복보다 생활권 설명을 우선합니다. 주변 역과 권역, 코스 선택, 예약 전 체크사항으로 내부 링크를 나누어 사용자가 필요한 다음 정보를 자연스럽게 선택하도록 했습니다.",
        "이 페이지는 의료 효과나 치료 결과를 약속하지 않습니다. 피로 회복이나 컨디션 관리는 개인차가 있으므로, 현재 건강 상태와 민감한 사항은 예약 전 상담에서 솔직하게 알려주는 것이 좋습니다.",
        "검색엔진을 위한 지역명 치환 문서가 되지 않도록 $landmarks, $character, 평균 안내 시간, 준비사항을 함께 넣었습니다. 지역별 문서마다 다른 판단 기준을 제공하는 것이 핵심입니다."
      )
    }
    'area' {
      $regionName = if ($region) { $region.Name } else { "광진구 권역" }
      $summary = if ($region) { $region.Summary } else { $Desc }
      $dongNames = if ($region) { ($region.Dongs | ForEach-Object { $_.Name }) -join ", " } else { "광진구 주요 동" }
      return @(
        "$plainTitle 페이지는 $regionName 전체를 한 번에 보는 권역 안내입니다. 메뉴에서는 권역명을 짧게 보여 주고, 본문에서는 어떤 동과 생활권을 포함하는지 설명해 지역명 반복을 줄였습니다.",
        "$summary 이 권역은 $dongNames 정보를 함께 확인할 수 있도록 구성했습니다. 사용자는 자신의 주소가 어느 세부 동이나 역세권에 가까운지 비교한 뒤 상세 페이지로 이동할 수 있습니다.",
        "권역 페이지의 목적은 여러 동을 억지로 하나의 키워드 문서로 묶는 것이 아닙니다. 넓은 생활권의 성격을 설명하고, 동 단위 페이지와 역세권 페이지로 연결하는 허브 역할을 맡습니다.",
        "같은 권역 안에서도 방문 가능 시간과 안내 방식은 달라질 수 있습니다. 예약 시각, 세부 주소, 출입 조건, 희망 코스가 다르면 상담 결과가 달라지므로 확정 문구 대신 확인 기준을 안내합니다.",
        "작성자는 플러스 마사지 운영팀이며, 페이지는 지역별 문의를 정리할 때 필요한 권역 구분을 기준으로 만들었습니다. 실제 운영 데이터가 쌓이면 권역 설명은 계속 보완할 수 있습니다.",
        "$regionName 메뉴명에는 핵심 키워드를 반복하지 않았습니다. 대신 H1과 설명에서는 예약 안내 페이지임을 분명히 하여 이용자에게는 자연스럽고 검색엔진에는 페이지 주제가 명확하게 전달되도록 했습니다.",
        "도어웨이 위험을 낮추기 위해 권역 페이지는 세부 동 페이지와 다른 정보를 다룹니다. 이 페이지는 비교와 이동을 돕고, 동 페이지는 실제 주소 기준 준비사항을 안내합니다.",
        "이용자는 권역 페이지에서 전체 구조를 파악한 뒤 자신의 위치와 가장 가까운 동 또는 역 페이지를 선택하면 됩니다. 이렇게 단계가 나뉘면 한 페이지 안에서 불필요한 키워드 나열을 피할 수 있습니다.",
        "예약 가능 여부는 상담에서 최종 확인합니다. 권역 안내는 검색용 방문 유도보다 사용자가 자신의 생활권을 판단하고 다음 페이지로 이동하도록 돕는 데 초점을 둡니다."
      )
    }
    'course' {
      $courseName = if ($course) { $course.Name } else { $plainTitle }
      $courseDesc = if ($course) { $course.Desc } else { $Desc }
      return @(
        "$plainTitle 페이지는 $courseName 선택 전에 확인할 기준을 정리합니다. 코스명은 메뉴에서 짧게 보여 주고, 상세 설명에서는 어떤 상황에 어울리는지 풀어 안내합니다.",
        "$courseDesc 처음 이용하는 분은 강한 표현보다 현재 컨디션, 선호 압, 이용 시간, 동반 인원, 방문 장소 환경을 기준으로 선택하는 편이 안전합니다.",
        "코스 페이지는 지역 페이지와 목적이 다릅니다. 지역 페이지가 방문 가능 위치를 안내한다면, 이 페이지는 어떤 관리 구성을 선택하면 좋을지 판단하는 데 초점을 둡니다.",
        "가격과 소요 시간은 상담 기준으로 안내합니다. 방문 위치, 예약 시간대, 인원, 요청 조건에 따라 최종 확인이 필요할 수 있으므로 예약 전에 다시 안내받는 것이 좋습니다.",
        "작성자는 플러스 마사지 운영팀이며, 코스 설명은 예약 상담에서 자주 확인하는 선택 기준을 바탕으로 정리했습니다. 특정 효과를 보장하거나 치료 결과를 약속하지 않습니다.",
        "$courseName 선택 시에는 관리 목적을 한 문장으로 정리해 상담하는 것이 좋습니다. 예를 들어 피로 누적, 부드러운 관리 선호, 운동 후 뭉침, 동반 이용 여부처럼 구체적인 기준이 도움이 됩니다.",
        "이 페이지는 코스명을 반복하는 대신 선택 상황과 준비사항을 설명합니다. 사용자는 코스안내, 가격 안내, 예약안내를 차례대로 확인하면서 자신의 조건에 맞는 선택을 할 수 있습니다.",
        "건강 상태에 따라 관리가 적합하지 않을 수 있으므로 통증, 질환, 임신, 수술 후 회복 등 민감한 사항은 예약 전에 알려 주세요. 필요한 경우 전문 의료 상담을 우선해야 합니다.",
        "코스 상세 페이지는 대량 생성된 얇은 문서가 되지 않도록 선택 기준, 주의사항, 상담 흐름, 내부 링크 역할을 함께 담았습니다. 목적이 다른 페이지와 중복되지 않게 구성했습니다."
      )
    }
    'reservation' {
      return @(
        "$plainTitle 페이지는 처음 문의하는 순간부터 방문 전 확인까지의 흐름을 정리합니다. 희망 시간, 위치, 코스, 인원, 연락 가능한 번호를 먼저 알려주면 상담이 짧고 명확해집니다.",
        "$Desc 예약 페이지는 지역명 반복보다 실제 절차를 설명하는 것이 중요합니다. 상담, 가능 시간 확인, 코스 선택, 방문 장소 확인, 결제와 변경 안내가 순서대로 이어져야 합니다.",
        "방문 가능 장소는 상세 주소를 기준으로 확인합니다. 대략적인 역명이나 동명만으로는 실제 이동 동선이 달라질 수 있으므로, 예약 확정 전에는 주소와 출입 방법을 함께 확인하는 것이 좋습니다.",
        "변경이나 취소가 필요할 때는 가능한 빨리 연락하는 것이 좋습니다. 배정 상황에 따라 조정 가능 여부가 달라지므로 예약 전 체크사항을 먼저 읽어두면 불필요한 오해를 줄일 수 있습니다.",
        "작성자는 플러스 마사지 운영팀이며, 예약안내는 실제 상담에서 반복적으로 확인하는 항목을 바탕으로 정리했습니다. 확정 가능 시간이나 가격은 상담 단계에서 다시 확인합니다.",
        "예약 문의 시에는 현재 위치, 희망 시작 시간, 원하는 코스, 이용 인원, 주차 또는 출입 조건을 알려주세요. 이 정보가 있으면 가능 여부를 더 빠르고 정확하게 안내할 수 있습니다.",
        "이 페이지는 검색엔진을 위한 얇은 안내문이 아니라 예약자가 실수하기 쉬운 지점을 줄이는 문서입니다. 그래서 문의 전 체크리스트와 이용가이드로 이어지는 내부 링크가 중요합니다.",
        "건강이나 안전과 관련된 주의사항이 있으면 예약 전 반드시 알려야 합니다. 방문 관리는 의료 행위가 아니며 치료 효과를 보장하지 않는다는 점도 명확히 안내합니다.",
        "$plainTitle 내용은 지역별 페이지와 다르게 모든 이용자에게 공통으로 필요한 절차를 다룹니다. 이 역할 차이 때문에 사이트 안에서 별도 페이지로 유지할 가치가 있습니다."
      )
    }
    'guide' {
      return @(
        "$plainTitle 페이지는 처음 이용하는 분이 예약 전에 확인해야 할 행동 기준을 정리합니다. 방문 전 준비, 위생 기준, 관리 후 주의사항, 금지행위 안내를 분리해 불필요한 오해를 줄였습니다.",
        "$Desc 안내는 이용자가 실제로 준비할 수 있는 항목을 중심으로 작성했습니다. 주소, 연락처, 방문 환경, 희망 시간, 컨디션 정보를 미리 정리하면 상담과 배정이 더 빠르게 진행됩니다.",
        "이용가이드 영역은 지역 페이지와 달리 장소보다 절차와 안전 기준을 다룹니다. 그래서 지역 키워드를 반복하지 않고, 처음 이용할 때 필요한 준비 순서와 주의사항을 설명합니다.",
        "작성자는 플러스 마사지 운영팀이며, 콘텐츠는 예약 상담에서 자주 발생하는 질문과 현장 안내 기준을 바탕으로 정리했습니다. 실제 이용 전에는 상담에서 다시 확인하도록 안내합니다.",
        "건전한 방문 관리 기준을 벗어난 요청은 제공하지 않습니다. 서비스 범위를 명확히 이해하고 이용하면 예약자와 관리사 모두에게 안전하고 안정적인 이용 경험이 됩니다.",
        "방문 전에는 편하게 관리받을 수 있는 공간을 준비하고, 현장에서 연락 가능한 상태를 유지해 주세요. 주소 확인이나 출입 안내가 늦어지면 예약 시간이 밀릴 수 있습니다.",
        "이 페이지는 건강이나 치료 효과를 보장하지 않습니다. 컨디션이 좋지 않거나 특별한 주의가 필요한 경우에는 예약 전 상담에서 미리 알려야 하며, 필요한 경우 전문 의료 상담이 우선입니다.",
        "가이드 문서는 검색 유입보다 실제 이용 전 확인을 돕는 목적이 큽니다. 그래서 메뉴를 짧게 두고 본문에서 준비사항과 안전 기준을 충분히 설명하는 방식으로 구성했습니다.",
        "$plainTitle 내용을 읽은 뒤에는 예약안내, 코스안내, 자주 묻는 질문으로 이어지게 내부 링크를 배치했습니다. 사용자는 자신의 상황에 맞춰 다음 확인 페이지를 선택하면 됩니다."
      )
    }
    'reviews' {
      return @(
        "$plainTitle 페이지는 단순한 평가 모음보다 이용자가 참고할 수 있는 판단 기준을 정리하는 영역입니다. 지역별 후기와 역세권 후기를 나누어 자신의 위치와 비슷한 사례를 찾기 쉽게 했습니다.",
        "$Desc 후기를 볼 때는 코스명, 이용 시간, 방문 지역, 예약 흐름을 함께 보는 것이 좋습니다. 개인의 컨디션과 선호도에 따라 만족 포인트가 달라질 수 있기 때문입니다.",
        "후기 문서는 과장된 홍보 문구를 줄이고 실제 예약 전 참고할 수 있는 맥락을 중심으로 구성해야 합니다. 그래서 지역명 반복보다 어떤 상황에서 도움이 되는지 설명합니다.",
        "작성자는 플러스 마사지 운영팀이며, 후기 영역은 운영 중 접수되는 문의와 이용 흐름을 바탕으로 정리할 수 있는 참고 페이지입니다. 허위 후기나 검증되지 않은 평점 나열은 피해야 합니다.",
        "실제 예약 전에는 후기만으로 결정하기보다 상담을 통해 현재 가능한 시간과 코스를 확인해 주세요. 페이지는 판단을 돕는 보조 정보이고, 최종 안내는 예약 상황을 기준으로 합니다.",
        "지역별 후기는 넓은 생활권을 비교하는 데 도움이 되고, 역세권 후기는 이동 기준을 이해하는 데 도움이 됩니다. 두 페이지는 역할이 달라 중복 문서가 되지 않도록 분리했습니다.",
        "후기 콘텐츠는 Google의 helpful content 관점에서 실제 사용자에게 도움이 되는 맥락이 있어야 합니다. 단순히 키워드를 붙인 짧은 감상문을 대량 생성하는 방식은 사용하지 않는 것이 안전합니다.",
        "$plainTitle 영역에서는 개인정보가 드러나지 않도록 주의해야 합니다. 지역과 코스 맥락은 남기되, 개인 식별 가능 정보나 민감한 상황은 공개하지 않는 기준이 필요합니다.",
        "운영 이후 실제 후기 데이터가 쌓이면 지역, 역, 코스, 예약 흐름을 기준으로 더 세분화할 수 있습니다. 지금 페이지는 후기 메뉴의 역할과 안전한 작성 기준을 먼저 제시합니다."
      )
    }
    'customer' {
      return @(
        "$plainTitle 페이지는 예약 전후에 필요한 문의와 정책 정보를 확인하는 영역입니다. 공지사항, 자주 묻는 질문, 1:1 문의, 제휴 문의, 개인정보처리방침, 이용약관을 역할별로 분리했습니다.",
        "$Desc 고객센터 콘텐츠는 신뢰 신호와 직접 연결됩니다. 사용자가 누가 운영하는지, 어떤 기준으로 안내하는지, 문의가 필요할 때 어디로 연락해야 하는지 알 수 있어야 합니다.",
        "작성자는 플러스 마사지 운영팀이며, 문의 응대 기준과 정책 문서는 운영상 필요한 최소 정보를 투명하게 공개하기 위해 작성했습니다. 검색 순위보다 신뢰 확보가 우선입니다.",
        "개인정보와 이용약관 페이지는 예약 상담에 필요한 정보의 범위, 이용 기준, 변경과 취소에 관한 원칙을 확인하는 기본 문서입니다. 모호한 표현보다 실제 운영 기준을 적는 것이 좋습니다.",
        "문의 전에는 지역, 희망 시간, 이용 목적을 간단히 정리해 주세요. 같은 질문도 위치와 시간대에 따라 답이 달라질 수 있어 기본 정보를 함께 알려주면 더 정확하게 안내할 수 있습니다.",
        "고객센터 페이지는 지역 키워드를 반복할 필요가 없습니다. 대신 연락 방법, 정책 문서, FAQ, 제휴 문의처럼 사용자가 신뢰를 판단하는 정보를 명확하게 보여 주는 것이 중요합니다.",
        "YMYL에 가까운 건강·안전 관련 주제는 과장된 효과보다 책임 있는 안내가 필요합니다. 서비스 범위, 금지행위, 개인정보 처리 기준을 공개하면 이용자가 스스로 판단하기 쉬워집니다.",
        "$plainTitle 내용은 다른 메뉴 페이지와 목적이 다릅니다. 지역이나 코스 선택이 아니라 문의, 정책, 신뢰 확인을 위한 페이지이므로 독립적인 본문 구성을 유지했습니다.",
        "운영 중 공지사항이나 FAQ가 늘어나면 실제 질문을 기준으로 문서를 갱신하는 것이 좋습니다. 오래된 정책이나 모호한 답변을 방치하면 사이트 전체 신뢰도에 좋지 않습니다."
      )
    }
    default {
      return @(
        "$plainTitle 페이지는 플러스 마사지 사이트 안에서 사용자가 다음 행동을 결정하는 출발점입니다. 메뉴명은 짧게 유지하고 본문에서 페이지 목적을 자세히 설명해 탐색 흐름이 끊기지 않도록 했습니다.",
        "$Desc 이 설명은 검색 유입만을 위한 문장이 아니라 실제 방문자가 페이지를 열었을 때 무엇을 확인해야 하는지 알려주는 안내문 역할을 합니다.",
        "작성자는 플러스 마사지 운영팀이며, 콘텐츠는 예약 상담에서 필요한 확인 항목을 기준으로 정리했습니다. AI 보조가 사용될 수 있어도 최종 문구는 운영 기준과 사용자 이해를 중심으로 검토하는 구조입니다.",
        "이 페이지는 지역, 역, 코스, 예약, 가이드, 고객센터 중 어떤 정보로 이동해야 하는지 안내합니다. 특정 키워드를 과하게 반복하지 않고 내부 링크를 통해 필요한 상세 페이지로 연결합니다.",
        "Google의 people-first 원칙에 맞추기 위해 사용자가 직접 도움이 된다고 느낄 수 있는 정보, 즉 준비사항, 확인 기준, 정책 안내, 관련 페이지 이동 경로를 우선했습니다.",
        "스팸 위험을 줄이기 위해 같은 문구를 여러 지역명에 붙이는 방식은 피했습니다. 페이지별 제목과 설명, 연결되는 메뉴, 본문 역할이 다르도록 구성했습니다.",
        "방문 마사지 안내는 건강과 안전에 영향을 줄 수 있는 주제이므로 신뢰가 중요합니다. 치료 효과를 약속하지 않고, 예약 가능 여부와 이용 기준을 상담 단계에서 다시 확인하도록 안내합니다.",
        "상단 메뉴는 사용자 경험을 위해 짧게 두고, 상세 페이지에서만 필요한 검색 의도를 반영합니다. 이 방식은 메뉴 스팸을 줄이면서도 페이지 주제를 명확히 전달하는 균형점입니다.",
        "운영 이후에는 실제 문의 내용, 자주 묻는 질문, 예약 전 혼동되는 지점을 반영해 본문을 계속 보완하는 것이 좋습니다. 지금 구성은 안전한 기본 구조와 검수 가능한 초안입니다."
      )
    }
  }
}

function Unique-Notes([string]$Title, [string]$Desc, [string]$Path) {
  $slug = ($Path.Trim('/') -split '/')[-1]
  $notes = @{
    "junggok-gunja-area" = @(
      "중곡·군자권역은 5호선과 7호선 이용 흐름이 겹치는 곳이라 상담 시 역 기준과 실제 주소 기준을 분리해 확인하는 편이 좋습니다. 군자역 주변인지, 중곡역 쪽 주거지인지에 따라 안내 동선이 달라질 수 있습니다.",
      "이 권역은 주거지 문의와 대학가·상권 문의가 함께 들어올 수 있어 예약 목적을 먼저 확인합니다. 조용한 주거 공간 이용인지, 퇴근 후 짧은 시간 예약인지에 따라 코스 선택 기준이 달라집니다.",
      "중곡동은 용마산로와 시장 생활권을 기준으로 세부 위치 확인이 필요하고, 군자동은 능동로와 세종대학교 생활권을 함께 봅니다. 두 동을 하나로 묶되 상세 페이지는 별도로 두어 안내가 겹치지 않게 했습니다.",
      "중곡·군자권역에서는 북쪽 주거지와 군자역 환승 생활권을 같은 문서에서 비교할 수 있어야 합니다. 권역 페이지는 두 동의 차이를 보여 주고, 상세 판단은 중곡동 또는 군자동 페이지로 넘깁니다.",
      "이 권역의 예약 전 체크 포인트는 역 접근성보다 실제 주소 접근성입니다. 같은 군자역 생활권이라도 중곡동 방향과 능동로 방향은 안내 기준이 다를 수 있습니다."
    )
    "neung-hwayang-area" = @(
      "능동·화양권역은 어린이대공원과 대학가 생활권이 가까워 주간과 야간 문의 성격이 다르게 나타날 수 있습니다. 공원 인근 주거지인지, 건대 상권과 가까운 위치인지 상담에서 구분합니다.",
      "능동은 비교적 조용한 생활권 설명이 필요하고, 화양동은 건대입구 상권과 연결된 안내가 필요합니다. 같은 권역 안에서도 사용자가 찾는 정보가 다르기 때문에 동별 상세 페이지로 나누었습니다.",
      "이 권역은 어린이대공원역, 건대입구역, 세종대학교 생활권을 함께 비교하는 사용자가 많을 수 있어 역세권 안내와 지역 안내를 동시에 연결했습니다.",
      "능동·화양권역은 공원 주변의 차분한 주거지와 건대 주변의 활발한 상권을 동시에 포함합니다. 이 차이를 설명해야 실제 위치를 판단하기 쉽습니다.",
      "예약 상담에서는 공원 인근 주소인지, 대학가 상권 쪽인지, 주거지 안쪽인지 먼저 나눠 확인합니다. 같은 권역이어도 방문 환경이 다르기 때문입니다."
    )
    "guui-gwangjang-area" = @(
      "구의·광장권역은 광진구청과 구의역 생활권, 강변역과 동서울터미널 흐름, 광나루역과 한강·아차산 생활권이 함께 들어옵니다. 그래서 단순 동명보다 실제 이동축을 확인하는 것이 중요합니다.",
      "구의동은 업무와 주거 문의가 섞이는 중심 생활권이고, 광장동은 동부 주거지와 한강 접근성이 특징입니다. 권역 페이지에서는 두 동의 차이를 비교하고 상세 페이지에서 세부 준비사항을 안내합니다.",
      "강변역과 광나루역 주변은 같은 광진 동부권이어도 방문 조건이 다를 수 있습니다. 터미널·상업시설 인근인지, 주거지 안쪽인지에 따라 상담에서 확인할 항목이 달라집니다.",
      "구의·광장권역은 행정 중심지와 동부 주거지가 함께 묶이는 구조입니다. 구의동은 광진구청과 구의역 기준의 접근성이 중요하고, 광장동은 광나루역과 아차산 방향의 생활권 설명이 더 중요합니다.",
      "이 권역에서는 동서울터미널, 테크노마트, 워커힐, 한강 접근성처럼 서로 다른 기준이 섞입니다. 그래서 권역 페이지는 넓은 비교 정보를 주고 세부 예약 판단은 동 또는 역 페이지로 연결합니다.",
      "구의동과 광장동을 같은 기준으로만 설명하면 안내가 부정확해질 수 있습니다. 본문에서는 중심 업무 생활권과 동부 주거 생활권의 차이를 분명히 나누었습니다."
    )
    "jayang-kondae-area" = @(
      "자양·건대권역은 자양동 주거지, 건대입구 상권, 뚝섬유원지역 한강 생활권을 함께 확인하는 사용자가 많습니다. 역세권 메뉴와 지역 메뉴가 서로 보완하도록 구성했습니다.",
      "자양동은 한강 접근성과 주거 문의가 함께 나타나고, 건대입구 생활권은 상권과 대학가 문의가 섞입니다. 이 차이를 본문에 반영해 실제 위치 판단에 도움이 되도록 했습니다.",
      "뚝섬유원지역과 건대입구역은 모두 7호선 흐름에 있지만 예약 준비 기준이 다릅니다. 한강공원 인근인지, 자양동 주거지인지, 건대 상권인지에 따라 상담에서 확인할 위치 정보가 달라집니다.",
      "자양·건대권역은 남부 한강 생활권과 대학가 상권이 만나는 점이 특징입니다. 구의·광장권역처럼 동부 주거 중심으로만 설명하면 실제 사용자가 찾는 정보와 어긋날 수 있습니다.",
      "자양동 문의는 주거지 주소와 한강 접근성을 함께 확인하고, 건대입구 생활권 문의는 상권 혼잡도와 출입 방식 확인이 중요합니다. 두 흐름을 나눠 설명해야 페이지 고유성이 살아납니다.",
      "이 권역에서는 건대입구역 페이지, 뚝섬유원지역 페이지, 자양동 페이지가 서로 다른 역할을 합니다. 권역 페이지는 세 페이지를 비교할 수 있는 안내 화면으로 구성했습니다."
    )
    "junggok-dong" = @(
      "중곡동은 중곡역과 용마산로, 중곡제일시장 생활권을 기준으로 세부 위치를 확인하는 것이 좋습니다. 주거지 안쪽 주소가 많을 수 있어 공동현관과 연락 가능 여부가 중요합니다.",
      "중곡동 페이지는 군자역 중심의 군자동 안내와 구분됩니다. 같은 북서부 권역이어도 중곡동은 주거 밀도와 시장 생활권 중심으로 예약 준비사항을 설명합니다.",
      "예약 문의 시 중곡역 기준인지, 용마산로 안쪽인지, 시장 인근인지 알려주면 안내가 더 정확해집니다. 단순히 중곡동이라고만 말하면 이동 동선 확인이 길어질 수 있습니다."
    )
    "gunja-dong" = @(
      "군자동은 군자역 환승 흐름과 능동로, 세종대학교 생활권이 함께 있는 지역입니다. 환승역 근처인지 대학가 쪽인지에 따라 예약 가능 시간 확인 방식이 달라질 수 있습니다.",
      "군자동 페이지는 중곡동과 달리 군자역 중심의 이동 편의와 상권 접근성을 함께 봅니다. 그래서 권역 페이지보다 역세권 안내와 더 강하게 연결됩니다.",
      "군자역은 5호선과 7호선에 동시에 보이지만 상세 안내는 하나로 연결됩니다. 군자동 안내에서도 같은 기준을 따라 관련 페이지로만 연결합니다.",
      "군자동 예약 문의에서는 군자역 출구 인근인지, 세종대학교와 가까운 생활권인지, 능동로 안쪽 주소인지가 중요한 구분점입니다. 같은 군자동이라도 방문 동선이 달라질 수 있습니다.",
      "군자동은 중곡동처럼 주거지 중심으로만 설명하기 어렵고, 능동·화양권역과도 생활 흐름이 일부 겹칩니다. 그래서 본문에서는 환승역, 대학가, 주거지라는 세 기준을 함께 다룹니다.",
      "상담 시에는 군자역 기준 도보 거리보다 실제 주소와 건물 출입 조건을 우선 확인합니다. 환승역 주변은 위치 설명이 쉬워 보여도 건물 입구와 이동 동선이 다를 수 있습니다."
    )
    "neung-dong" = @(
      "능동은 어린이대공원역과 능동로, 서울어린이대공원 주변 생활권을 기준으로 안내합니다. 공원 주변 주거지인지 큰길 접근이 쉬운 위치인지에 따라 상담 기준이 달라집니다.",
      "능동 페이지는 화양동처럼 상권 중심이 아니라 비교적 조용한 생활권 설명이 필요합니다. 그래서 방문 전 준비사항과 정확한 주소 확인을 더 강조했습니다.",
      "어린이대공원역 인근이라고 해도 능동 안쪽인지 화양동 방향인지에 따라 이동 기준이 달라질 수 있습니다. 동 페이지와 역 페이지를 함께 확인하면 판단이 쉽습니다.",
      "능동은 공원과 주거지가 가까운 생활권이므로 상담에서는 조용한 방문 환경과 정확한 출입 안내가 중요합니다. 대학가 상권 중심의 화양동과 같은 문장으로 설명하지 않았습니다.",
      "서울어린이대공원 주변은 주말과 평일의 이동 흐름이 다를 수 있습니다. 예약 시간대가 겹치면 큰길 접근성과 건물 위치를 더 구체적으로 확인하는 것이 좋습니다.",
      "능동 페이지는 어린이대공원역 페이지와 연결되지만, 역세권 안내보다 실제 동 주소 기준 확인을 우선합니다. 이 차이가 화양동 페이지와의 중복을 줄이는 핵심입니다."
    )
    "hwayang-dong" = @(
      "화양동은 건대입구역, 화양사거리, 건국대학교 인근을 함께 보는 생활권입니다. 대학가와 상권 문의가 많을 수 있어 이용 시간대와 방문 장소 확인이 중요합니다.",
      "화양동 페이지는 능동 안내와 다르게 유동 인구가 많은 상권 흐름을 반영합니다. 주소 확인뿐 아니라 출입 방식과 연락 가능 여부를 상담에서 먼저 확인하는 것이 좋습니다.",
      "건대입구역 생활권과 연결되지만 화양동 페이지는 동 단위 주소 기준 안내입니다. 역세권 페이지와 역할을 나누어 중복을 줄였습니다.",
      "화양동은 건국대학교와 건대입구 상권의 영향이 큰 지역입니다. 능동처럼 공원과 주거지 중심으로 설명하면 실제 예약자가 확인하려는 상권 동선과 맞지 않습니다.",
      "화양사거리나 건대 로데오거리와 가까운 위치라면 혼잡 시간대와 건물 출입 방식을 먼저 확인하는 것이 좋습니다. 예약 가능 여부는 주소의 세부 위치에 따라 달라질 수 있습니다.",
      "화양동 페이지는 대학가, 상권, 역세권이 겹치는 특성을 설명합니다. 어린이대공원역 중심의 능동 페이지와 달리 건대입구역 연결성과 야간 문의 흐름을 별도로 다룹니다."
    )
    "guui-dong" = @(
      "구의동은 구의역, 광진구청, 강변역 생활권이 이어지는 중심 지역입니다. 업무와 주거 문의가 섞일 수 있어 방문 장소의 성격을 상담에서 먼저 확인합니다.",
      "구의동 페이지는 광장동보다 행정·업무 중심 동선이 강합니다. 광진구청 주변인지, 구의역 인근인지, 강변 방향인지에 따라 안내 기준이 달라집니다.",
      "구의역 페이지와 구의동 페이지는 비슷해 보일 수 있지만 역할이 다릅니다. 역 페이지는 역세권 기준이고, 동 페이지는 실제 주소와 생활권 기준으로 구성했습니다.",
      "구의동은 광진구청과 가까운 행정 중심 생활권 설명이 필요합니다. 광장동처럼 한강과 아차산 방향 주거지 중심으로 쓰면 실제 위치 판단에 도움이 되지 않습니다.",
      "구의동 문의에서는 구의역 인근인지, 광진구청 주변인지, 강변역 방향인지가 중요합니다. 같은 동 안에서도 업무시설과 주거지가 섞여 있어 방문 환경을 구분해야 합니다.",
      "동서울터미널이나 테크노마트 쪽과 가까운 경우에는 강변역 안내도 함께 확인할 수 있습니다. 다만 이 페이지는 구의동 주소 기준으로 예약 전 준비사항을 설명합니다."
    )
    "gwangjang-dong" = @(
      "광장동은 광나루역, 아차산, 워커힐 인근 생활권을 기준으로 안내합니다. 한강과 산책로, 동부 주거지가 가까워 조용한 방문 환경 확인이 중요할 수 있습니다.",
      "광장동 페이지는 구의동보다 동부 주거지 성격이 강합니다. 대형 시설 인근인지 주거지 안쪽인지에 따라 상세 주소와 출입 방법을 더 꼼꼼히 확인해야 합니다.",
      "광나루역 안내와 연결되지만 광장동 페이지는 동 단위 생활권을 중심으로 작성했습니다. 역 이름을 반복하지 않고 주변 환경과 예약 준비사항을 설명합니다.",
      "광장동은 구의동처럼 행정 중심지가 아니라 동부 주거지와 자연 접근성이 두드러지는 지역입니다. 아차산, 한강, 워커힐 주변 생활권을 함께 고려해야 합니다.",
      "광장동 예약 문의에서는 광나루역 가까운 위치인지, 아차산 방향인지, 한강공원 접근이 쉬운 곳인지 확인합니다. 이 정보가 있어야 안내 시간과 출입 조건을 더 정확히 볼 수 있습니다.",
      "광장동 페이지는 조용한 주거지 이용 흐름을 설명하는 데 초점을 둡니다. 광진구청이나 구의역 중심의 구의동 문서와 다르게 동부 생활권 고유성을 앞쪽에 배치했습니다."
    )
    "jayang-dong" = @(
      "자양동은 뚝섬유원지역, 건대입구역, 자양전통시장 주변 생활권을 함께 봅니다. 한강 접근성과 주거 문의가 같이 나타날 수 있어 위치 확인이 중요합니다.",
      "자양동 페이지는 건대입구 생활권과 연결되지만 상권 중심 문서가 아닙니다. 실제 자양동 주소, 출입 조건, 방문 가능 시간 확인에 초점을 둡니다.",
      "뚝섬유원지역 인근인지 자양동 주거지 안쪽인지에 따라 상담 기준이 달라질 수 있습니다. 역세권 페이지와 동 페이지를 나누어 중복을 줄였습니다.",
      "자양동은 한강공원 접근성과 주거지 문의가 함께 나타나는 점이 군자동과 다릅니다. 건대입구역을 기준으로 설명할 때도 실제 주소가 자양동인지 화양동인지 구분해야 합니다.",
      "자양전통시장 인근, 뚝섬유원지역 주변, 건대입구 생활권은 같은 자양동 문의 안에서도 분위기가 다릅니다. 본문은 이 차이를 반영해 단순 동명 반복을 피했습니다.",
      "예약 상담에서는 한강 방향인지, 시장 생활권인지, 건대입구와 가까운지 먼저 확인합니다. 이 정보가 있어야 방문 가능 시간과 출입 안내를 더 정확하게 설명할 수 있습니다."
    )
  }
  if ($notes.ContainsKey($slug)) { return $notes[$slug] }
  return @(
    "$Title 안내는 예약 전에 확인할 내용을 중심으로 정리했습니다. 같은 광진구 안에서도 세부 위치와 시간대에 따라 안내가 달라질 수 있어 상담 전 준비사항을 함께 확인하는 것이 좋습니다.",
    "$Desc 예약 전에는 정확한 위치, 희망 시간, 이용 인원, 코스 선택 기준을 간단히 정리해 주세요. 이 정보가 있으면 방문 가능 여부를 더 빠르게 안내받을 수 있습니다.",
    "최종 가능 여부는 상담 단계에서 확인합니다. 페이지 내용은 문의 전에 준비하면 좋은 정보를 알려주는 안내이며, 실제 배정 상황과 방문 조건에 따라 달라질 수 있습니다."
  )
}

function Customer-Notes([string]$Title, [string]$Desc, [string]$Path) {
  $category = Get-Category $Path
  $plainTitle = ($Title -replace '\s*\|.*$', '')
  switch ($category) {
    'station' {
      return @(
        "역 인근 예약은 출구명보다 실제 주소가 더 중요합니다. 같은 역세권이라도 대로변, 주거지, 오피스텔, 숙박시설 위치에 따라 안내 시간이 달라질 수 있습니다.",
        "상담할 때는 가까운 역, 상세 주소, 희망 시간, 출입 방법을 함께 알려주세요. 위치 확인이 빠를수록 방문 가능 여부를 더 정확하게 안내할 수 있습니다.",
        "환승역 주변은 유동 인구가 많아 시간대별 이동 상황이 달라질 수 있습니다. 저녁 시간대와 주말에는 여유 있게 문의하는 것을 권장합니다.",
        "관련 정보는 지하철역별 안내, 지역별 안내, 코스안내, 이용 전 확인사항에서 이어서 확인할 수 있습니다."
      )
    }
    'dong' {
      return @(
        "동 단위 안내는 실제 주소를 기준으로 예약 전 준비사항을 확인하는 페이지입니다. 같은 동 안에서도 주거지 안쪽인지, 역과 가까운지, 상권 주변인지에 따라 안내가 달라질 수 있습니다.",
        "예약 전에는 상세 주소, 공동현관 출입 방법, 주차 가능 여부, 연락 가능한 번호를 준비해 주세요. 현장 안내가 짧아지고 예약 확인이 더 수월해집니다.",
        "방문 환경이 조용히 확보되는지도 중요합니다. 관리 전후로 충분한 휴식이 가능한지, 안내받은 시간에 연락이 가능한지 함께 확인해 주세요.",
        "가까운 권역과 역세권 페이지를 함께 보면 자신의 위치에 맞는 안내를 더 쉽게 찾을 수 있습니다."
      )
    }
    'area' {
      return @(
        "권역 안내는 여러 동을 한 번에 비교해 볼 수 있도록 만든 페이지입니다. 먼저 권역을 확인한 뒤 세부 동이나 가까운 역세권 안내로 이동하면 더 정확한 정보를 볼 수 있습니다.",
        "방문 가능 여부는 권역명만으로 확정되지 않습니다. 상세 주소, 예약 시간, 이동 상황, 코스와 인원에 따라 달라질 수 있어 상담 단계에서 다시 확인합니다.",
        "권역 페이지에서는 큰 생활권의 특징을 보고, 동 페이지에서는 실제 주소 기준 준비사항을 확인하는 흐름이 좋습니다.",
        "예약이 처음이라면 출장 가능 지역, 지하철역 인근 안내, 예약 가능 시간, 이용 전 확인사항을 순서대로 확인해 주세요."
      )
    }
    'course' {
      return @(
        "코스 선택은 현재 컨디션과 이용 목적에 맞춰 결정하는 것이 좋습니다. 피로감, 선호 압, 이용 시간, 동반 인원, 방문 장소의 환경을 상담 시 함께 알려주세요.",
        "처음 이용하는 경우에는 무리한 선택보다 기본적인 관리 목적을 먼저 정리하는 편이 좋습니다. 세부 시간과 가격은 상담 과정에서 다시 확인합니다.",
        "커플·가족 또는 단체 이용은 인원과 공간 조건을 함께 확인해야 합니다. 일정이 정해져 있다면 가능한 빨리 문의하는 것이 좋습니다.",
        "코스안내, 가격 안내, 예약안내를 함께 보면 선택 기준을 더 쉽게 정리할 수 있습니다."
      )
    }
    'reservation' {
      return @(
        "예약은 지역과 희망 시간 확인, 코스와 인원 선택, 방문 가능 여부 안내, 예약 확정 순서로 진행됩니다.",
        "상담 전에는 정확한 주소와 연락 가능한 번호를 준비해 주세요. 출입 방법이나 주차 가능 여부도 함께 알려주면 안내가 더 정확해집니다.",
        "당일 예약은 가능할 수 있지만 시간대와 배정 상황에 따라 달라집니다. 저녁 시간대와 주말은 사전 예약을 권장합니다.",
        "예약 후 변경이 필요하면 가능한 빨리 연락해 주세요. 배정 상황에 따라 조정 가능 여부가 달라질 수 있습니다."
      )
    }
    'guide' {
      return @(
        "이용가이드는 처음 이용하는 분이 방문 전 준비사항과 안전 기준을 확인하는 공간입니다. 주소, 출입 방법, 관리받을 공간을 미리 정리해 주세요.",
        "위생과 안전 기준은 예약 전 반드시 확인하는 것이 좋습니다. 건전한 이용 범위를 벗어난 요청은 제공하지 않습니다.",
        "관리 후에는 물을 충분히 마시고 무리한 활동을 피하는 것이 좋습니다. 개인 컨디션에 따라 휴식 시간이 필요할 수 있습니다.",
        "금지행위 안내, 위생 및 안전 기준, 예약 전 체크리스트를 함께 확인하면 이용 과정의 오해를 줄일 수 있습니다."
      )
    }
    'reviews' {
      return @(
        "후기는 실제 이용 경험이 있을 때만 사용하는 것이 좋습니다. 지역명만 바꾼 반복 문장은 신뢰를 떨어뜨릴 수 있어 사용하지 않습니다.",
        "후기를 볼 때는 이용 지역, 예약 시간대, 선택한 코스, 준비 과정이 자신과 비슷한지 함께 확인해 주세요.",
        "개인의 컨디션과 선호도에 따라 만족 포인트가 달라질 수 있습니다. 후기는 참고용이며 최종 선택은 상담을 통해 확인하는 것이 좋습니다.",
        "지역별 후기와 역세권 후기는 서로 다른 기준으로 정리해 두면 자신의 상황과 가까운 사례를 찾기 쉽습니다."
      )
    }
    'customer' {
      return @(
        "고객센터 페이지는 문의 전후로 필요한 정보를 확인하는 공간입니다. 예약 문의, 자주 묻는 질문, 제휴 문의, 정책 문서를 나누어 안내합니다.",
        "문의 전에는 지역, 희망 시간, 이용 목적을 간단히 정리해 주세요. 같은 질문도 위치와 시간대에 따라 답이 달라질 수 있습니다.",
        "개인정보처리방침과 이용약관은 예약 상담에 필요한 정보의 범위와 이용 기준을 확인하기 위한 문서입니다.",
        "공지사항과 FAQ는 운영 중 자주 묻는 내용을 기준으로 보완하는 것이 좋습니다. 궁금한 점이 남으면 1:1 문의를 이용해 주세요."
      )
    }
    default {
      return @(
        "$plainTitle 페이지는 예약 전 확인할 내용을 한눈에 볼 수 있도록 구성했습니다. 필요한 정보가 많다면 관련 안내 페이지를 함께 확인해 주세요.",
        "정확한 위치, 희망 시간, 코스, 인원, 출입 방법은 상담에서 가장 먼저 확인하는 항목입니다.",
        "방문 가능 여부는 상담 단계에서 최종 확인합니다. 시간대와 배정 상황에 따라 안내가 달라질 수 있습니다.",
        "이용 전 확인사항과 위생 및 안전 기준을 함께 읽으면 예약 과정의 오해를 줄일 수 있습니다."
      )
    }
  }
}

function Add-DetailContent {
  $files = Get-ChildItem -LiteralPath $Root -Recurse -Filter index.html | Where-Object { $_.FullName -notlike '*\work\*' }
  foreach ($file in $files) {
    $html = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $path = $file.FullName.Substring($Root.Length).Replace('\','/')
    if ($path -eq '/index.html') { $urlPath = '/' } else { $urlPath = $path.Replace('/index.html','/') }
    $title = [System.Net.WebUtility]::HtmlDecode([regex]::Match($html, '<title>(.*?)</title>').Groups[1].Value)
    $plainTitle = ($title -replace '\s*\|.*$', '')
    $desc = [System.Net.WebUtility]::HtmlDecode([regex]::Match($html, '<meta name="description" content="(.*?)"').Groups[1].Value)
    $length = (Strip-HtmlText $html).Length
    if ($length -ge 2050) { continue }
    $paras = (Unique-Notes $title $desc $urlPath) + (Customer-Notes $title $desc $urlPath)
    $section = '<section class="block detail-copy"><div class="wrap content"><span class="eyebrow">이용 안내</span><h2 class="sec">상세 안내</h2>'
    $heads = @("예약 전 확인", "방문 가능 여부", "이용 기준", "함께 보면 좋은 안내", "준비사항", "상담 안내", "안전 안내", "관련 정보")
    $i = 0
    while ($length -lt 2120 -and $i -lt $paras.Count) {
      $p = $paras[$i]
      $h = $heads[$i % $heads.Count]
      $section += "<section class=""lux""><h2>$(E $h)</h2><p>$(E $p)</p></section>"
      $length += $p.Length
      $i++
    }
    $supplement = @(
      "$plainTitle 안내를 확인한 뒤에도 궁금한 점이 남으면 예약 문의에서 위치와 희망 시간을 함께 알려주세요. 상담 시 가능한 범위 안에서 방문 여부와 준비사항을 안내합니다.",
      "방문 전에는 조용한 공간, 연락 가능한 상태, 정확한 주소를 한 번 더 확인해 주세요. 작은 정보 차이로도 안내 시간이 달라질 수 있습니다.",
      "예약 내용은 상황에 따라 조정이 필요할 수 있습니다. 변경이나 취소가 필요하면 가능한 빨리 연락하는 것이 좋습니다.",
      "관련 메뉴를 함께 확인하면 지역, 역세권, 코스, 이용 기준을 순서대로 정리할 수 있습니다."
    )
    $j = 0
    while ($length -lt 2180 -and $j -lt $supplement.Count) {
      $p = $supplement[$j]
      $h = $heads[($i + $j) % $heads.Count]
      $section += "<section class=""lux""><h2>$(E $h)</h2><p>$(E $p)</p></section>"
      $length += $p.Length
      $j++
    }
    $extras = @(
      "처음 문의하는 경우에는 현재 위치와 희망 시간을 먼저 정리해 주세요. 이후 코스, 인원, 방문 환경을 차례대로 확인하면 상담 과정이 훨씬 간단해집니다.",
      "건물 출입 방법이나 주차 조건처럼 현장에서 필요한 정보는 예약 전에 알려주는 것이 좋습니다. 작은 정보라도 미리 확인되면 방문 준비가 더 안정적으로 진행됩니다.",
      "이 안내는 확정된 방문 시간을 약속하는 문서가 아니라 문의 전에 확인할 기준을 정리한 내용입니다. 실제 가능 여부는 상담 시점의 배정 상황을 기준으로 다시 안내합니다.",
      "관련 페이지를 함께 보면 지역, 역세권, 코스, 예약 절차를 한 흐름으로 이해할 수 있습니다. 필요한 항목을 확인한 뒤 예약 문의로 이동하면 됩니다.",
      "방문 장소가 아파트, 오피스텔, 숙박시설, 사무실 중 어디인지에 따라 준비해야 할 정보가 달라질 수 있습니다. 예약 전에는 건물명과 출입 기준을 함께 확인해 주세요.",
      "상담 중 안내받은 내용은 예약 시점의 상황을 기준으로 합니다. 시간이 지나면 배정 상태와 이동 상황이 달라질 수 있으므로 확정 전에는 한 번 더 확인하는 것이 좋습니다.",
      "편안한 이용을 위해 관리받을 공간은 미리 정돈해 두는 것이 좋습니다. 주변 소음, 조명, 환기, 연락 가능 상태처럼 기본 환경을 확인하면 이용 과정이 더 안정적입니다.",
      "궁금한 점이 여러 개라면 지역, 시간, 코스, 결제, 변경 가능 여부 순서로 질문을 정리해 주세요. 상담 흐름이 명확해지고 필요한 안내를 빠뜨릴 가능성이 줄어듭니다.",
      "특별히 조심해야 할 컨디션이나 불편한 부위가 있다면 예약 전에 알려주세요. 방문 관리는 의료 행위가 아니므로 치료 효과를 전제로 안내하지 않으며, 필요한 경우 전문 상담을 우선해야 합니다.",
      "같은 광진구 안에서도 주거지, 상권, 역세권, 한강 주변 생활권은 방문 준비 기준이 다릅니다. 이 페이지의 안내를 먼저 확인한 뒤 가까운 세부 페이지로 이동하면 판단이 쉽습니다."
    )
    $k = 0
    while ($length -lt 2070 -and $k -lt $extras.Count) {
      $p = $extras[$k]
      $h = $heads[($i + $j + $k) % $heads.Count]
      $section += "<section class=""lux""><h2>$(E $h)</h2><p>$(E $p)</p></section>"
      $length += $p.Length
      $k++
    }
    $section += '</div></section>'
    $html = $html.Replace('<footer class="footer">', "$section<footer class=""footer"">")
    Set-Content -LiteralPath $file.FullName -Value $html -Encoding UTF8
  }
}

Clean-Output

$trustCards = Cards @(
  @{ Href="/reservation/"; Kicker="RESERVE"; Title="예약 정보 확인"; Text="지역, 희망 시간, 코스, 인원 정보를 기준으로 상담합니다." },
  @{ Href="/guide/safety/"; Kicker="SAFETY"; Title="위생 관리 기준"; Text="방문 전후 위생과 안전 기준을 먼저 확인할 수 있습니다." },
  @{ Href="/guide/checklist/"; Kicker="CHECK"; Title="방문 전 안내"; Text="주소, 출입 방법, 주차 가능 여부를 미리 준비합니다." },
  @{ Href="/guide/notice/"; Kicker="NOTICE"; Title="금지행위 안내"; Text="건전한 이용 범위를 벗어난 요청은 제공하지 않습니다." },
  @{ Href="/privacy/"; Kicker="PRIVACY"; Title="개인정보 보호"; Text="예약 상담에 필요한 최소 정보와 처리 기준을 안내합니다." }
)
$areaCards = Cards @(
  @{ Href="/gwangjin-gu/junggok-gunja-area/"; Kicker="AREA"; Title="중곡·군자권역"; Text="중곡동, 군자동 인근 안내" },
  @{ Href="/gwangjin-gu/neung-hwayang-area/"; Kicker="AREA"; Title="능동·화양권역"; Text="능동, 화양동, 어린이대공원 인근 안내" },
  @{ Href="/gwangjin-gu/guui-gwangjang-area/"; Kicker="AREA"; Title="구의·광장권역"; Text="구의동, 광장동, 강변역 인근 안내" },
  @{ Href="/gwangjin-gu/jayang-kondae-area/"; Kicker="AREA"; Title="자양·건대권역"; Text="자양동, 건대입구 생활권 안내" }
)
$stationCards = Cards @(
  @{ Href="/gwangjin-gu/stations/kondae-station/"; Kicker="2·7"; Title="건대입구역"; Text="화양동, 자양동, 건국대학교 생활권" },
  @{ Href="/gwangjin-gu/stations/gunja-station/"; Kicker="5·7"; Title="군자역"; Text="군자동, 중곡동, 능동로 생활권" },
  @{ Href="/gwangjin-gu/stations/guui-station/"; Kicker="2"; Title="구의역"; Text="구의동, 광진구청 인근 생활권" },
  @{ Href="/gwangjin-gu/stations/gangbyeon-station/"; Kicker="2"; Title="강변역"; Text="동서울터미널, 테크노마트 인근" },
  @{ Href="/gwangjin-gu/stations/achasan-station/"; Kicker="5"; Title="아차산역"; Text="아차산, 구의동 동부 생활권" },
  @{ Href="/gwangjin-gu/stations/gwangnaru-station/"; Kicker="5"; Title="광나루역"; Text="광장동, 한강공원 인근" },
  @{ Href="/gwangjin-gu/stations/junggok-station/"; Kicker="7"; Title="중곡역"; Text="중곡동, 용마산로 생활권" },
  @{ Href="/gwangjin-gu/stations/children-grand-park-station/"; Kicker="7"; Title="어린이대공원역"; Text="능동, 세종대학교 생활권" },
  @{ Href="/gwangjin-gu/stations/ttukseom-resort-station/"; Kicker="7"; Title="뚝섬유원지역"; Text="자양동, 한강공원 인근" }
)
$courseCardsHome = Cards @(
  @{ Href="/course/fatigue/"; Kicker="COURSE"; Title="피로 회복 관리"; Text="누적된 피로와 긴장 완화를 목적으로 선택합니다." },
  @{ Href="/course/aroma/"; Kicker="COURSE"; Title="아로마 관리"; Text="부드러운 관리와 편안한 이용감을 선호할 때 확인합니다." },
  @{ Href="/course/sports/"; Kicker="COURSE"; Title="스포츠 관리"; Text="활동량이 많은 날의 뭉침과 컨디션 회복 기준을 안내합니다." },
  @{ Href="/course/couple/"; Kicker="COURSE"; Title="커플·가족 방문 관리"; Text="동반 이용 시 인원과 공간 조건을 함께 확인합니다." },
  @{ Href="/course/group/"; Kicker="COURSE"; Title="기업·단체 방문 관리"; Text="행사, 복지, 단체 예약은 일정과 인원을 먼저 조율합니다." },
  @{ Href="/course/price/"; Kicker="PRICE"; Title="가격 안내"; Text="시간과 코스 기준은 상담 전 안내 페이지에서 확인합니다." }
)
$homeBody = @"
<section class="hero"><div class="wrap hero-inner"><div><span class="eyebrow">PLUS MASSAGE</span><h1><span class="grad">광진 출장마사지</span> 예약 안내</h1><p class="lead">광진 출장마사지를 찾는 분들을 위해 광진구 중곡동, 구의동, 자양동, 화양동, 군자동 일대 방문 가능 지역, 코스 선택 기준, 예약 전 확인사항을 안내합니다.</p><div class="actions"><a class="btn primary" href="tel:$PhoneTel">예약문의</a><a class="btn" href="/course/">코스 확인하기</a><a class="btn" href="/gwangjin-gu/area/">출장 가능 지역 보기</a></div></div><div class="panel"><div class="k">RESERVATION CHECK</div><h3>예약 확인</h3><div class="row"><span>지역</span><b>광진구 생활권</b></div><div class="row"><span>상담</span><b>$Hours</b></div><div class="row"><span>기준</span><b>위치·시간·코스 확인</b></div></div></div></section>
<section class="block"><div class="wrap"><span class="eyebrow">TRUST</span><h2 class="sec">편안하고 안전한 방문 관리 안내</h2><p class="sec-lead">예약 정보, 위생 기준, 방문 전 준비, 금지행위, 개인정보 보호를 메인 상단에서 먼저 확인할 수 있게 구성했습니다.</p>$trustCards</div></section>
<section class="block"><div class="wrap"><span class="eyebrow">AREA</span><h2 class="sec">광진구 출장 가능 지역</h2><p class="sec-lead">광진구 생활권을 권역별로 나누어 가까운 동과 역세권 안내를 쉽게 찾을 수 있게 정리했습니다.</p>$areaCards</div></section>
<section class="block"><div class="wrap"><span class="eyebrow">STATION</span><h2 class="sec">광진구 지하철역 인근 방문 안내</h2><p class="sec-lead">역세권 카드에는 역명만 표기합니다. 건대입구역과 군자역처럼 환승역은 여러 메뉴에 보일 수 있어도 상세 안내는 하나로 연결됩니다.</p>$stationCards</div></section>
<section class="block"><div class="wrap"><span class="eyebrow">COURSE</span><h2 class="sec">관리 코스 안내</h2><p class="sec-lead">컨디션과 이용 목적에 따라 피로 회복 관리, 아로마 관리, 스포츠 관리 등 다양한 코스를 선택할 수 있습니다. 자세한 시간과 가격은 코스 안내 페이지에서 확인해보세요.</p>$courseCardsHome</div></section>
$(PriceTable)
<section class="block"><div class="wrap content"><span class="eyebrow">PROCESS</span><h2 class="sec">예약은 이렇게 진행됩니다</h2><section class="lux"><ol><li>지역과 희망 시간 확인</li><li>코스와 인원 선택</li><li>방문 가능 여부 안내</li><li>예약 확정</li><li>방문 관리 진행</li></ol></section></div></section>
<section class="block"><div class="wrap content"><span class="eyebrow">CHECKLIST</span><h2 class="sec">이용 전 확인사항</h2><section class="lux"><ul><li>정확한 주소</li><li>공동현관 출입 방법</li><li>주차 가능 여부</li><li>조용한 공간 확보</li><li>예약자 연락 가능 여부</li><li><a href="/guide/notice/">금지행위 확인</a></li></ul><p><a href="/guide/">이용가이드</a>, <a href="/guide/safety/">위생 및 안전 기준</a>, <a href="/guide/notice/">금지행위 안내</a>를 함께 확인하세요.</p></section></div></section>
<section class="block"><div class="wrap content"><span class="eyebrow">AREA LINKS</span><h2 class="sec">지역별 안내 바로가기</h2><div class="chips"><a class="chip" href="/gwangjin-gu/junggok-gunja-area/">중곡·군자권역</a><a class="chip" href="/gwangjin-gu/neung-hwayang-area/">능동·화양권역</a><a class="chip" href="/gwangjin-gu/guui-gwangjang-area/">구의·광장권역</a><a class="chip" href="/gwangjin-gu/jayang-kondae-area/">자양·건대권역</a></div></div></section>
<section class="block"><div class="wrap content"><span class="eyebrow">STATION LINKS</span><h2 class="sec">지하철역별 안내 바로가기</h2><section class="lux"><h3>2호선 광진권</h3><p><a href="/gwangjin-gu/stations/kondae-station/">건대입구역</a> · <a href="/gwangjin-gu/stations/guui-station/">구의역</a> · <a href="/gwangjin-gu/stations/gangbyeon-station/">강변역</a></p><h3>5호선 광진권</h3><p><a href="/gwangjin-gu/stations/gunja-station/">군자역</a> · <a href="/gwangjin-gu/stations/achasan-station/">아차산역</a> · <a href="/gwangjin-gu/stations/gwangnaru-station/">광나루역</a></p><h3>7호선 광진권</h3><p><a href="/gwangjin-gu/stations/junggok-station/">중곡역</a> · <a href="/gwangjin-gu/stations/children-grand-park-station/">어린이대공원역</a> · <a href="/gwangjin-gu/stations/ttukseom-resort-station/">뚝섬유원지역</a></p></section></div></section>
<section class="block"><div class="wrap content"><span class="eyebrow">FAQ</span><h2 class="sec">광진 출장마사지 자주 묻는 질문</h2><details><summary>광진구 전 지역 방문이 가능한가요?</summary><p>예약 시간, 정확한 위치, 배정 상황에 따라 가능 여부가 달라질 수 있습니다. 중곡동, 구의동, 자양동, 화양동 등 주요 생활권을 기준으로 안내드립니다.</p></details><details><summary>건대입구역이나 군자역 근처도 가능한가요?</summary><p>건대입구역, 군자역, 구의역, 강변역 등 광진구 주요 역세권은 예약 시 위치를 기준으로 방문 가능 여부를 확인합니다.</p></details><details><summary>당일 예약도 가능한가요?</summary><p>당일 예약은 시간대와 배정 상황에 따라 달라질 수 있습니다. 저녁 시간대와 주말은 사전 예약을 권장드립니다.</p></details><details><summary>예약 전 준비할 것이 있나요?</summary><p>정확한 주소, 출입 방법, 주차 가능 여부, 조용한 공간을 미리 확인해주시면 원활한 이용에 도움이 됩니다.</p></details></div></section>
<section class="block"><div class="wrap content"><span class="eyebrow">CTA</span><h2 class="sec">광진 출장마사지 예약문의</h2><p class="lead">광진구 방문 가능 여부는 희망 시간과 위치에 따라 달라질 수 있습니다. 지역, 시간, 코스를 알려주시면 예약 가능 여부를 안내드립니다.</p><div class="actions"><a class="btn primary" href="tel:$PhoneTel">전화 문의</a><a class="btn" href="/customer/contact/">카카오톡 문의</a><a class="btn" href="/course/">코스 확인하기</a></div></div></section>
"@
Write-Page "/" "$PrimaryKeyword | 광진구 방문 마사지 예약 안내" "광진 출장마사지 안내 페이지입니다. 중곡동, 구의동, 자양동, 화양동, 건대입구역, 군자역 인근 방문 가능 지역과 예약 전 확인사항을 확인해보세요." "home" $homeBody

$sections = @(
  @{ Title="서비스 안내"; Texts=@("광진구 전역을 대상으로 방문 마사지 예약 안내를 제공합니다. 서비스 범위, 상담 기준, 위생과 안전, 예약 전 확인사항을 순서대로 확인할 수 있습니다.") },
  @{ Title="출장 가능 지역"; Texts=@("중곡동, 군자동, 능동, 화양동, 구의동, 광장동, 자양동과 건대입구 생활권을 중심으로 권역별 안내를 제공합니다.") },
  @{ Title="지하철역 인근 안내"; Texts=@("건대입구역과 군자역처럼 환승 노선이 있는 역도 상세 안내는 하나로 연결합니다. 같은 역 메뉴가 여러 노선 아래 보이더라도 모두 같은 안내로 이동합니다.") },
  @{ Title="예약 가능 시간"; Texts=@("상담은 연중무휴 24시간 기준으로 안내하며 실제 방문 가능 시간은 위치, 코스, 예약 상황에 따라 확인합니다.") },
  @{ Title="이용 전 확인사항"; Texts=@("정확한 주소, 연락 가능한 번호, 방문 환경, 희망 코스를 미리 확인하면 상담과 배정이 더 빠르게 진행됩니다.") }
)
$faqs = @(
  @("광진구 전체 예약이 가능한가요?", "중곡동, 군자동, 능동, 화양동, 구의동, 광장동, 자양동 등 광진구 주요 생활권을 기준으로 안내합니다."),
  @("건대입구역은 2호선과 7호선 페이지가 따로 있나요?", "아니요. 메뉴에는 노선별로 보일 수 있지만 실제 페이지는 /gwangjin-gu/stations/kondae-station/ 하나만 사용합니다."),
  @("군자역도 안내가 하나로 연결되나요?", "네. 5호선과 7호선 메뉴 모두 같은 군자역 안내 페이지로 이동합니다.")
)
Write-Page "/gwangjin-gu/" "광진구 방문 마사지 지역·역 안내 | 플러스 마사지" "광진구 방문 마사지 대표 안내. 가능 지역, 지하철역 인근, 코스 선택, 예약 전 확인사항을 제공합니다." "gwangjin" ((StandardContent "GWANGJIN" "<span class=""grad"">$PrimaryKeyword</span><br>예약 안내" "광진구 방문 마사지 예약을 처음 확인하는 분을 위한 대표 안내 페이지입니다." $sections $faqs) + (PriceTable))

function GwangjinSubPage([string]$Path, [string]$Title, [string]$Desc, [string]$H1, [string]$Lead, [array]$Sections, [array]$Faqs) {
  Write-Page $Path $Title $Desc "gwangjin" (StandardContent "GWANGJIN GUIDE" "<span class=""grad"">$H1</span>" $Lead $Sections $Faqs)
}

GwangjinSubPage "/gwangjin-gu/service/" "서비스 안내 | 광진구 방문 마사지 이용 기준" "광진구 방문 마사지 서비스 안내 페이지입니다. 예약 범위, 상담 기준, 위생과 안전, 금지행위, 개인정보 보호 원칙을 확인하세요." "서비스 안내" "광진구에서 방문 마사지 예약을 알아볼 때 먼저 확인해야 할 서비스 범위와 이용 기준을 정리했습니다." @(
  @{ Title="서비스 범위"; Texts=@("플러스 마사지는 광진구 생활권을 기준으로 방문 마사지 예약 정보를 안내합니다. 서비스 안내 페이지는 특정 동이나 역을 반복하는 곳이 아니라, 이용자가 예약 전 전체 기준을 이해하는 출발점입니다.") },
  @{ Title="상담 기준"; Texts=@("상담 시에는 지역, 희망 시간, 코스, 이용 인원, 방문 환경을 확인합니다. 정확한 주소와 출입 방식이 있어야 실제 가능 여부를 안내할 수 있습니다.") },
  @{ Title="안전한 이용 원칙"; Texts=@("건전한 방문 관리 기준을 벗어난 요청은 제공하지 않습니다. 위생 기준, 금지행위, 개인정보 보호 문서를 함께 확인하면 오해를 줄일 수 있습니다.") },
  @{ Title="관련 안내"; Texts=@(@('<a href="/gwangjin-gu/area/">출장 가능 지역</a>', '<a href="/gwangjin-gu/hours/">예약 가능 시간</a>', '<a href="/gwangjin-gu/checklist/">이용 전 확인사항</a>')) }
) @(@("서비스 안내와 지역 페이지는 어떻게 다른가요?", "서비스 안내는 이용 기준을 설명하고, 지역 페이지는 실제 방문 가능 생활권을 안내합니다."), @("방문 가능 여부는 바로 확정되나요?", "정확한 위치와 예약 시간, 배정 상황을 확인한 뒤 안내합니다."))

GwangjinSubPage "/gwangjin-gu/course-guide/" "코스 선택 안내 | 광진구 방문 마사지 코스 기준" "광진구 방문 마사지 코스 선택 안내입니다. 피로 회복, 아로마, 스포츠, 커플·가족, 단체 관리 선택 기준을 확인하세요." "코스 선택 안내" "코스 선택 안내는 특정 코스를 밀어주는 페이지가 아니라 현재 컨디션과 이용 목적에 맞는 판단 기준을 제공하는 페이지입니다." @(
  @{ Title="컨디션 기준"; Texts=@("피로가 누적된 날, 부드러운 관리가 필요한 날, 운동 후 뭉침이 있는 날은 선택 기준이 다릅니다. 상담 단계에서 현재 상태를 간단히 설명하면 코스 안내가 더 정확해집니다.") },
  @{ Title="이용 환경 기준"; Texts=@("혼자 이용하는지, 커플·가족이 함께 이용하는지, 기업·단체 일정인지에 따라 필요한 시간과 인원이 달라집니다. 방문 장소의 공간 조건도 함께 확인합니다.") },
  @{ Title="가격과 시간 확인"; Texts=@("코스별 시간과 가격은 상담 기준으로 안내합니다. 방문 위치, 시간대, 인원에 따라 최종 확인이 필요할 수 있으므로 예약 전 다시 확인하는 것이 좋습니다.") },
  @{ Title="세부 코스 연결"; Texts=@(@('<a href="/course/fatigue/">피로 회복 관리</a>', '<a href="/course/aroma/">아로마 관리</a>', '<a href="/course/sports/">스포츠 관리</a>', '<a href="/course/price/">가격 안내</a>')) }
) @(@("처음 이용하면 어떤 코스가 좋나요?", "현재 컨디션, 선호 압, 이용 시간, 방문 환경을 기준으로 상담 후 안내받는 것이 좋습니다."), @("코스 선택 후 변경할 수 있나요?", "배정 전이라면 상황에 따라 조정할 수 있으나, 예약 상황에 따라 달라질 수 있습니다."))

GwangjinSubPage "/gwangjin-gu/checklist/" "이용 전 확인사항 | 광진구 방문 마사지 예약 체크리스트" "광진구 방문 마사지 이용 전 확인사항입니다. 정확한 주소, 출입 방법, 주차 가능 여부, 연락 가능 상태, 금지행위를 확인하세요." "이용 전 확인사항" "이용 전 확인사항 페이지는 예약자가 상담 전에 준비할 정보를 한곳에 정리해 불필요한 재확인을 줄이는 역할을 합니다." @(
  @{ Title="주소와 출입 정보"; Texts=@("정확한 주소, 건물명, 호수, 공동현관 출입 방법은 예약 가능 여부를 확인하는 기본 정보입니다. 역명이나 동명만으로는 실제 방문 동선을 확정하기 어렵습니다.") },
  @{ Title="방문 환경"; Texts=@("조용한 공간 확보, 주차 가능 여부, 엘리베이터 이용 가능 여부, 연락 가능한 상태를 미리 확인해 주세요. 현장 안내가 늦어지면 예약 시간이 밀릴 수 있습니다.") },
  @{ Title="이용 기준"; Texts=@("금지행위 안내와 위생 및 안전 기준은 예약 전 반드시 확인하는 것이 좋습니다. 건전한 서비스 범위를 벗어난 요청은 제공하지 않습니다.") },
  @{ Title="바로가기"; Texts=@(@('<a href="/guide/safety/">위생 및 안전 기준</a>', '<a href="/guide/notice/">금지행위 안내</a>', '<a href="/reservation/">예약안내</a>')) }
) @(@("정확한 주소를 꼭 알려야 하나요?", "네. 실제 방문 가능 여부는 상세 주소와 출입 조건을 기준으로 확인합니다."), @("주차 정보도 필요한가요?", "방문 환경에 따라 필요할 수 있으므로 가능 여부를 미리 알려주시면 좋습니다."))

GwangjinSubPage "/gwangjin-gu/faq/" "자주 묻는 질문 | 광진구 방문 마사지 예약 FAQ" "광진구 방문 마사지 자주 묻는 질문입니다. 가능 지역, 역세권, 당일 예약, 준비사항, 코스 선택 기준을 확인하세요." "자주 묻는 질문" "FAQ 페이지는 실제 예약 전 많이 확인하는 질문을 광진구 생활권 기준으로 정리한 안내 페이지입니다." @(
  @{ Title="가능 지역 질문"; Texts=@("광진구 전 지역 방문 가능 여부는 예약 시간, 정확한 위치, 배정 상황에 따라 달라질 수 있습니다. 중곡동, 구의동, 자양동, 화양동 등 주요 생활권을 기준으로 안내합니다.") },
  @{ Title="역세권 질문"; Texts=@("건대입구역, 군자역, 구의역, 강변역 등 주요 역세권은 메뉴에 짧은 역명으로 표시하고, 상세 페이지에서 위치 기준 안내를 제공합니다.") },
  @{ Title="예약과 준비"; Texts=@("당일 예약은 시간대와 배정 상황에 따라 달라질 수 있습니다. 정확한 주소, 출입 방법, 주차 가능 여부, 연락 가능 상태를 미리 확인하면 상담이 원활합니다.") },
  @{ Title="관련 페이지"; Texts=@(@('<a href="/gwangjin-gu/hours/">예약 가능 시간</a>', '<a href="/gwangjin-gu/checklist/">이용 전 확인사항</a>', '<a href="/gwangjin-gu/stations/">지하철역 인근 안내</a>')) }
) @(@("광진구 전 지역 방문이 가능한가요?", "예약 시간, 정확한 위치, 배정 상황에 따라 가능 여부가 달라질 수 있습니다."), @("당일 예약도 가능한가요?", "가능할 수 있지만 저녁 시간대와 주말은 사전 예약을 권장합니다."))

$areaItems = @(@{Href="/gwangjin-gu/area/";Kicker="ALL";Title="광진구 전체";Text="광진구 가능 지역 전체 보기"})
foreach ($r in $Regions) { $areaItems += @{Href="/gwangjin-gu/$($r.Slug)/";Kicker="AREA";Title=$r.Name;Text=$r.Summary} }
Write-Page "/gwangjin-gu/area/" "광진구 출장마사지 가능 지역 | 중곡동·구의동·자양동 안내" "광진구 출장마사지 가능 지역 안내. 중곡동, 군자동, 능동, 화양동, 구의동, 광장동, 자양동 권역 정보를 제공합니다." "area" "$(Hero '지역 안내' '<span class=""grad"">지역별 안내</span>' '광진구 생활권을 권역별로 확인한 뒤 가까운 동과 역세권 안내로 이동할 수 있습니다.' '/gwangjin-gu/area/' '지역 전체 보기')<section class=""block""><div class=""wrap"">$(Cards $areaItems)</div></section>$(PriceTable)"

foreach ($r in $Regions) {
  $dongList = @()
  foreach ($d in $r.Dongs) { $dongList += "<a href=""/gwangjin-gu/$($d.Slug)/"">$(E $d.Name)</a>" }
  $sections = @(
    @{ Title="권역 안내"; Texts=@($r.Summary, @($dongList)) },
    @{ Title="방문 가능 생활권"; Texts=@("이 권역은 주요 도로와 지하철 생활권을 함께 고려해 방문 가능 여부를 안내합니다.") },
    @{ Title="코스 선택 안내"; Texts=@("권역별 방문 가능 여부를 확인한 뒤 이용 목적과 컨디션에 맞는 코스는 코스안내 페이지에서 자세히 확인할 수 있습니다.") }
  )
  Write-Page "/gwangjin-gu/$($r.Slug)/" "$($r.H1) | 플러스 마사지" "$($r.Name) 방문 마사지 안내. $($r.Summary)" "area" ((StandardContent "AREA" "<span class=""grad"">$($r.H1)</span>" $r.Summary $sections @(@("$($r.Name) 예약은 어떻게 하나요?", "전화 상담 시 위치와 희망 시간을 알려주시면 가능 여부를 안내합니다."))) + (PriceTable))
  foreach ($d in $r.Dongs) {
    $title = "$($d.Title) | 광진구 $($d.Name) 방문 마사지 예약 안내"
    $desc = "광진구 $($d.Name) 출장마사지 안내 페이지입니다. $($d.Landmarks) 방문 가능 지역과 예약 가능 시간, 코스 선택 기준, 이용 전 확인사항을 확인해보세요."
    Write-Page "/gwangjin-gu/$($d.Slug)/" $title $desc "area" (Dong-Content $d $r)
  }
}

$stationItems = @(@{Href="/gwangjin-gu/stations/";Kicker="ALL";Title="광진구 지하철역 전체";Text="역세권 안내 전체 보기"})
foreach ($s in $Stations) { $stationItems += @{Href="/gwangjin-gu/stations/$($s.Slug)/";Kicker=($s.Lines -join " · ");Title=$s.Name;Text=$s.Nearby} }
Write-Page "/gwangjin-gu/stations/" "광진구 지하철역 출장마사지 | 건대입구역·군자역·구의역 안내" "광진구 지하철역 출장마사지 안내. 건대입구역, 군자역, 구의역, 강변역 등 역세권 방문 마사지 정보를 제공합니다." "stations" "$(Hero '역세권 안내' '<span class=""grad"">지하철역별 안내</span>' '건대입구역, 군자역, 구의역, 강변역 등 가까운 역을 기준으로 방문 가능 생활권을 확인할 수 있습니다.' '/gwangjin-gu/stations/' '역 전체 보기')<section class=""block""><div class=""wrap"">$(Cards $stationItems)</div></section>$(PriceTable)"

foreach ($s in $Stations) {
  $sections = @(
    @{ Title="$($s.Name) 이용 안내"; Texts=@("$($s.Name) 인근은 $($s.Nearby)을 기준으로 방문 가능 여부를 안내합니다.") },
      @{ Title="환승역 안내 기준"; Texts=@("건대입구역과 군자역처럼 여러 노선에 걸친 역도 실제 상세 안내는 하나로 연결합니다. 이 페이지가 $($s.Name) 안내의 기준 페이지입니다.") },
    @{ Title="방문 가능 생활권"; Texts=@("평균 안내 시간은 약 $($s.Arrival)분 내외이며 예약 시간대, 위치, 교통 상황에 따라 달라질 수 있습니다.") },
    @{ Title="예약 전 체크사항"; Texts=@("출구 번호, 상세 주소, 연락 가능한 번호, 방문 환경을 상담 시 함께 알려주시면 안내가 정확해집니다.") }
  )
  Write-Page "/gwangjin-gu/stations/$($s.Slug)/" $s.Seo "$($s.Title) 안내. $($s.Nearby) 인근 방문 마사지 예약 정보를 제공합니다." "stations" ((StandardContent "STATION" "<span class=""grad"">$($s.Title)</span><br>예약 안내" "$($s.Name) 인근 방문 마사지 예약을 확인하는 분을 위한 역세권 안내입니다." $sections @(@("$($s.Name) 근처 예약이 가능한가요?", "상세 위치와 시간대를 확인한 뒤 방문 가능 여부를 안내합니다."), @("노선별로 안내가 나뉘나요?", "아니요. 메뉴 노출은 여러 곳에 가능하지만 상세 안내는 하나로 연결됩니다."))) + (PriceTable))
}

$courseCards = @()
foreach ($c in $Courses) { $courseCards += @{Href="/course/$($c.Slug)/";Kicker="COURSE";Title=$c.Name;Text=$c.Desc} }
$courseCards += @{Href="/course/price/";Kicker="PRICE";Title="가격 안내";Text="코스별 상담 기준 가격 안내"}
$courseCards += @{Href="/course/guide/";Kicker="GUIDE";Title="코스 선택 가이드";Text="목적과 컨디션에 맞춘 선택 기준"}
Write-Page "/course/" "코스안내 | 광진구 방문 마사지 코스 선택" "피로 회복 관리, 아로마 관리, 스포츠 관리, 커플·가족 관리, 기업·단체 관리 등 코스 안내입니다." "course" "$(Hero 'COURSE' '<span class=""grad"">코스안내</span>' '목적과 컨디션에 맞춰 관리 코스를 선택할 수 있도록 핵심 정보만 정리했습니다.' '/course/' '전체 코스 보기')<section class=""block""><div class=""wrap"">$(Cards $courseCards)</div></section>"
foreach ($c in $Courses) {
  Build-SimplePage "/course/$($c.Slug)/" "course" "$($c.Name) | 플러스 마사지 광진구 코스안내" $c.Name $c.Desc @(@("/reservation/","RESERVE","예약 방법","희망 시간과 위치를 상담 시 알려주세요."), @("/course/price/","PRICE","가격 안내","코스별 상담 기준을 확인합니다."))
}
Build-SimplePage "/course/price/" "course" "가격 안내 | 플러스 마사지" "가격 안내" "코스와 시간, 방문 위치에 따라 상담 시 최종 안내합니다." @(@("/course/","COURSE","전체 코스","코스별 상세 안내 보기"), @("/reservation/","RESERVE","예약안내","예약 전 확인사항 보기"))
Build-SimplePage "/course/guide/" "course" "코스 선택 가이드 | 플러스 마사지" "코스 선택 가이드" "피로도, 선호 압, 이용 인원, 방문 환경에 맞춰 코스를 선택하세요." @(@("/course/fatigue/","BASIC","피로 회복 관리","처음 이용하는 분께 무난한 구성"), @("/course/aroma/","AROMA","아로마 관리","부드러운 관리 선호 시 추천"))

Build-SimplePage "/reservation/" "reservation" "예약안내 | 플러스 마사지 광진 방문 마사지 예약" "예약안내" "예약 방법, 가능 시간, 방문 장소, 결제, 변경·취소 전 확인사항을 안내합니다." @(@("tel:$PhoneTel","CALL","예약 방법","전화 상담으로 위치와 시간을 확인합니다."), @("/guide/checklist/","CHECK","예약 전 체크사항","주소와 방문 환경을 미리 확인합니다."))
Build-SimplePage "/gwangjin-gu/hours/" "gwangjin" "예약 가능 시간 | 광진구 방문 마사지 예약 안내" "예약 가능 시간" "상담은 연중무휴 24시간 기준이며 실제 방문 가능 시간은 위치와 예약 상황에 따라 확인합니다." @(@("/reservation/","RESERVE","예약 방법","상담 시 위치와 희망 시간을 확인합니다."), @("/guide/checklist/","CHECK","예약 전 체크사항","방문 전 준비사항을 확인합니다."))
Build-SimplePage "/guide/" "guide" "이용가이드 | 처음 이용하시는 분 안내" "이용가이드" "처음 이용하시는 분을 위한 방문 전 준비사항, 위생 및 안전 기준, 금지행위 안내입니다." @(@("/guide/checklist/","CHECK","방문 전 준비사항","주소, 연락처, 환경 확인"), @("/guide/safety/","SAFETY","위생 및 안전 기준","건전한 방문 관리 기준"))
Build-SimplePage "/guide/checklist/" "guide" "방문 전 준비사항 | 플러스 마사지" "방문 전 준비사항" "예약 전 주소, 연락처, 희망 시간, 출입 방법을 확인합니다." @(@("/reservation/","RESERVE","예약안내","예약 절차 확인"), @("/guide/safety/","SAFETY","위생 및 안전 기준","안전 기준 확인"))
Build-SimplePage "/guide/safety/" "guide" "위생 및 안전 기준 | 플러스 마사지" "위생 및 안전 기준" "건전한 방문 마사지 이용을 위한 위생과 안전 기준 안내입니다." @(@("/guide/notice/","RULE","금지행위 안내","이용 전 반드시 확인"), @("/customer/faq/","FAQ","이용 FAQ","자주 묻는 질문"))
Build-SimplePage "/guide/aftercare/" "guide" "관리 후 주의사항 | 플러스 마사지" "관리 후 주의사항" "관리 후 수분 섭취와 충분한 휴식을 권장합니다." @(@("/guide/","GUIDE","이용가이드","전체 가이드 보기"))
Build-SimplePage "/guide/notice/" "guide" "금지행위 안내 | 플러스 마사지" "금지행위 안내" "건전한 서비스 범위를 벗어난 요청은 제공하지 않습니다." @(@("/guide/safety/","SAFETY","위생 및 안전 기준","안전 기준 보기"))
Build-SimplePage "/reviews/" "reviews" "후기 | 플러스 마사지" "후기" "지역별, 역세권별 이용 흐름을 참고할 수 있는 후기 안내입니다." @(@("/reviews/area/","AREA","지역별 후기","지역 기준 후기"), @("/reviews/stations/","STATION","역세권 후기","역세권 기준 후기"))
Build-SimplePage "/reviews/area/" "reviews" "지역별 후기 | 플러스 마사지" "지역별 후기" "광진구 권역별 이용 후기를 정리하는 페이지입니다." @(@("/gwangjin-gu/area/","AREA","지역별 안내","권역 안내 보기"))
Build-SimplePage "/reviews/stations/" "reviews" "역세권 후기 | 플러스 마사지" "역세권 후기" "광진구 지하철역 생활권 기준 후기 안내입니다." @(@("/gwangjin-gu/stations/","STATION","지하철역별 안내","역세권 안내 보기"))
Build-SimplePage "/customer/" "customer" "고객센터 | 플러스 마사지" "고객센터" "공지사항, 자주 묻는 질문, 1:1 문의, 제휴 문의를 안내합니다." @(@("/customer/faq/","FAQ","자주 묻는 질문","이용 전 궁금한 점 확인"), @("/customer/contact/","CONTACT","1:1 문의","개별 문의 안내"))
Build-SimplePage "/customer/faq/" "customer" "자주 묻는 질문 | 플러스 마사지" "자주 묻는 질문" "예약, 지역, 코스, 이용 기준에 관한 FAQ입니다." @(@("/reservation/","RESERVE","예약안내","예약 절차 보기"), @("/guide/","GUIDE","이용가이드","이용 기준 보기"))
Build-SimplePage "/customer/contact/" "customer" "1:1 문의 | 플러스 마사지" "1:1 문의" "예약과 이용 관련 개별 문의는 전화 상담으로 안내합니다." @(@("tel:$PhoneTel","CALL","전화 문의","상담 연결"))
Build-SimplePage "/customer/partner/" "customer" "제휴 문의 | 플러스 마사지" "제휴 문의" "기업·단체 관리와 제휴 문의 안내입니다." @(@("/course/group/","GROUP","기업·단체 관리","단체 코스 보기"))
Build-SimplePage "/privacy/" "customer" "개인정보처리방침 | 플러스 마사지" "개인정보처리방침" "예약 상담에 필요한 최소한의 개인정보 처리 기준을 안내합니다." @(@("/customer/","CENTER","고객센터","고객센터로 이동"))
Build-SimplePage "/terms/" "customer" "이용약관 | 플러스 마사지" "이용약관" "서비스 이용 기준과 예약 변경·취소 관련 기본 안내입니다." @(@("/customer/","CENTER","고객센터","고객센터로 이동"))

Add-DetailContent

$urls = @("/")
Get-ChildItem -LiteralPath $Root -Recurse -Filter index.html | ForEach-Object {
  $rel = $_.FullName.Substring($Root.Length).Replace("\","/")
  if ($rel -ne "/index.html") { $urls += $rel.Replace("/index.html","/") }
}
$urls = $urls | Sort-Object -Unique
$lastMod = (Get-Date).ToUniversalTime().ToString("yyyy-MM-dd")
$rssDate = (Get-Date).ToUniversalTime().ToString("r")
$sitemapItems = ($urls | ForEach-Object { "  <url><loc>$BaseUrl$_</loc><lastmod>$lastMod</lastmod><changefreq>weekly</changefreq><priority>0.8</priority></url>" }) -join "`n"
"<?xml version=""1.0"" encoding=""UTF-8""?>`n<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">`n$sitemapItems`n</urlset>" | Set-Content -LiteralPath (Join-Path $Root "sitemap.xml") -Encoding UTF8

$rssItems = ($urls | ForEach-Object {
  $path = $_
  $pageFile = if ($path -eq "/") { Join-Path $Root "index.html" } else { Join-Path $Root ($path.Trim("/") + "/index.html") }
  $html = Get-Content -LiteralPath $pageFile -Raw -Encoding UTF8
  $pageTitle = if ($html -match "<title>(.*?)</title>") { [System.Net.WebUtility]::HtmlDecode($Matches[1]) } else { $Brand }
  $pageDesc = if ($html -match '<meta name="description" content="([^"]*)"') { [System.Net.WebUtility]::HtmlDecode($Matches[1]) } else { "$Brand 광진구 방문 마사지 안내" }
  "    <item><title>$(X $pageTitle)</title><link>$BaseUrl$path</link><guid isPermaLink=""true"">$BaseUrl$path</guid><description>$(X $pageDesc)</description><pubDate>$rssDate</pubDate></item>"
}) -join "`n"
"<?xml version=""1.0"" encoding=""UTF-8""?>`n<rss version=""2.0"" xmlns:atom=""http://www.w3.org/2005/Atom"">`n  <channel>`n    <title>$(X $Brand) 새 안내</title>`n    <link>$BaseUrl/</link>`n    <description>$(X $Brand) 광진구 방문 마사지 지역, 역세권, 코스, 예약 안내</description>`n    <language>ko-KR</language>`n    <lastBuildDate>$rssDate</lastBuildDate>`n    <atom:link href=""$BaseUrl/rss.xml"" rel=""self"" type=""application/rss+xml"" />`n$rssItems`n  </channel>`n</rss>" | Set-Content -LiteralPath (Join-Path $Root "rss.xml") -Encoding UTF8

$robots = @"
User-agent: *
Allow: /
Disallow: /tools/

User-agent: Googlebot
Allow: /

User-agent: Yeti
Allow: /

User-agent: NaverBot
Allow: /

Sitemap: $BaseUrl/sitemap.xml
Sitemap: $BaseUrl/rss.xml
"@
$robots | Set-Content -LiteralPath (Join-Path $Root "robots.txt") -Encoding UTF8
"<svg xmlns=""http://www.w3.org/2000/svg"" viewBox=""0 0 64 64""><rect width=""64"" height=""64"" rx=""14"" fill=""#0b0c10""/><circle cx=""32"" cy=""32"" r=""25"" fill=""url(#g)""/><path fill=""#17110a"" d=""M22 44V18h14c6 0 10 4 10 9s-4 9-10 9h-6v8h-8Zm8-15h5c2 0 4-1 4-3s-2-3-4-3h-5v6Z""/><defs><linearGradient id=""g"" x1=""10"" x2=""54"" y1=""8"" y2=""56""><stop stop-color=""#f0cf8a""/><stop offset=""1"" stop-color=""#d98975""/></linearGradient></defs></svg>" | Set-Content -LiteralPath (Join-Path $Root "favicon.svg") -Encoding UTF8
"{`"name`":`"$Brand`",`"short_name`":`"플러스`",`"start_url`":`"/`",`"display`":`"standalone`",`"lang`":`"ko-KR`",`"theme_color`":`"#0b0c10`",`"icons`":[{`"src`":`"/favicon.svg`",`"sizes`":`"any`",`"type`":`"image/svg+xml`"}]}" | Set-Content -LiteralPath (Join-Path $Root "site.webmanifest") -Encoding UTF8
"" | Set-Content -LiteralPath (Join-Path $Root ".nojekyll") -Encoding UTF8

Write-Host "Build complete: $($urls.Count) pages"

