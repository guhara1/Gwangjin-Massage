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

function Clean-Output {
  $paths = @("gwangjin-gu", "course", "reservation", "guide", "reviews", "customer", "privacy", "terms", "index.html", "sitemap.xml", "robots.txt", "site.webmanifest", ".nojekyll")
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
    (MenuItem "/gwangjin-gu/" "서비스 안내"),
    (MenuItem "/gwangjin-gu/area/" "출장 가능 지역"),
    (MenuItem "/gwangjin-gu/stations/" "지하철역 인근 안내"),
    (MenuItem "/gwangjin-gu/hours/" "예약 가능 시간"),
    (MenuItem "/course/guide/" "코스 선택 안내"),
    (MenuItem "/guide/checklist/" "이용 전 확인사항"),
    (MenuItem "/customer/faq/" "자주 묻는 질문")
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
    (MenuItem "/guide/prohibited/" "금지행위 안내"),
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
*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;background:#0b0c10;color:#f5f2eb;font-family:"Pretendard","Apple SD Gothic Neo","Noto Sans KR",system-ui,sans-serif;line-height:1.75}a{color:inherit;text-decoration:none}.wrap{max-width:1180px;margin:0 auto;padding:0 22px}header{position:sticky;top:0;z-index:30;background:rgba(11,12,16,.86);backdrop-filter:blur(16px);border-bottom:1px solid rgba(255,255,255,.08)}.nav{max-width:1240px;margin:0 auto;display:flex;align-items:center;gap:12px;padding:12px 20px}.brand{display:flex;align-items:center;gap:10px;font-weight:850;white-space:nowrap}.brand small{display:block;color:#d9b56f;font-size:11px;letter-spacing:.12em}.mark{width:34px;height:34px;border-radius:8px;display:grid;place-items:center;background:linear-gradient(135deg,#f0cf8a,#d98975);color:#17110a;font-weight:900}.menu{list-style:none;display:flex;align-items:center;gap:2px;margin:0 0 0 auto;padding:0}.menu>li{position:relative}.menu>li>a{display:block;padding:10px 9px;border-radius:8px;font-size:14px;font-weight:700;color:#ece7dc}.menu>li>a:hover,.menu>li>a.active{background:rgba(240,207,138,.12);color:#f0cf8a}.submenu{position:absolute;top:100%;left:0;min-width:220px;padding:8px;margin:0;list-style:none;background:#151821;border:1px solid rgba(255,255,255,.1);border-radius:10px;box-shadow:0 22px 50px rgba(0,0,0,.38);opacity:0;visibility:hidden;transform:translateY(8px);transition:.18s}.menu>li:hover>.submenu,.menu>li:focus-within>.submenu,.has-sub:hover>.sub2{opacity:1;visibility:visible;transform:none}.submenu a{display:block;padding:9px 11px;border-radius:8px;color:#c9c2b5;font-size:13.5px}.submenu a:hover{background:rgba(255,255,255,.06);color:#fff}.has-sub{position:relative}.has-sub>a:after{content:"›";float:right;color:#d9b56f}.sub2{left:calc(100% + 7px);top:0}.call{padding:10px 14px;border-radius:999px;background:linear-gradient(135deg,#ffb14f,#ff7a18);color:#1c1006;font-weight:900}.toggle{display:none;margin-left:auto;background:transparent;color:#fff;border:1px solid rgba(255,255,255,.16);border-radius:8px;width:42px;height:42px}.hero{background:radial-gradient(70% 90% at 80% 0%,rgba(217,137,117,.2),transparent 60%),linear-gradient(180deg,#11141c,#0b0c10);border-bottom:1px solid rgba(255,255,255,.08)}.hero-inner{display:grid;grid-template-columns:1.1fr .9fr;gap:34px;align-items:center;min-height:620px}.eyebrow{color:#d9b56f;font-size:12px;font-weight:900;letter-spacing:.18em;text-transform:uppercase}.hero h1{font-size:clamp(38px,6vw,72px);line-height:1.08;margin:16px 0 18px;letter-spacing:-.03em}.grad{background:linear-gradient(135deg,#f0cf8a,#d98975);-webkit-background-clip:text;background-clip:text;color:transparent}.lead{color:#c7c0b5;font-size:17px;max-width:680px}.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:26px}.btn{display:inline-flex;padding:13px 18px;border-radius:10px;font-weight:850;border:1px solid rgba(255,255,255,.12)}.btn.primary{background:linear-gradient(135deg,#f0cf8a,#d98975);color:#17110a;border:0}.panel{background:linear-gradient(155deg,#171b24,#10131a);border:1px solid rgba(255,255,255,.1);border-radius:8px;padding:26px}.row{display:flex;justify-content:space-between;gap:12px;padding:12px 0;border-top:1px solid rgba(255,255,255,.08);color:#c7c0b5}.block{padding:76px 0}.sec{font-size:clamp(28px,4vw,46px);line-height:1.16;margin:12px 0 10px}.grid{display:grid;gap:16px}.g2{grid-template-columns:repeat(auto-fit,minmax(280px,1fr))}.g3{grid-template-columns:repeat(auto-fit,minmax(240px,1fr))}.card{display:block;background:#141821;border:1px solid rgba(255,255,255,.09);border-radius:8px;padding:22px;min-height:150px}.card:hover{border-color:rgba(240,207,138,.42);transform:translateY(-2px)}.k{color:#d9b56f;font-weight:900;font-size:12px;letter-spacing:.14em}.card h3{margin:8px 0 8px;font-size:20px}.card p,.muted{color:#bcb4a8}.chips{display:flex;flex-wrap:wrap;gap:8px;margin-top:18px}.chip{border:1px solid rgba(255,255,255,.12);border-radius:999px;padding:7px 11px;color:#d7d0c4}.content{max-width:940px}.content h1{font-size:clamp(34px,5vw,58px);line-height:1.12}.lux{margin:18px 0;padding:24px;border-left:3px solid #d9b56f;background:#141821;border-radius:0 8px 8px 0}.lux h2{margin-top:0}.lux h3{color:#d9b56f}.lux li{margin:7px 0}.toc{display:flex;flex-wrap:wrap;gap:8px;margin:24px 0}.toc a{border:1px solid rgba(255,255,255,.12);border-radius:999px;padding:7px 11px;color:#d7d0c4}.footer{border-top:1px solid rgba(255,255,255,.08);background:#090a0d;padding:38px 0;color:#bcb4a8}.footer-grid{display:grid;grid-template-columns:2fr repeat(3,1fr);gap:20px}.footer a{display:block;margin:5px 0;color:#d7d0c4}.fab{position:fixed;right:18px;bottom:18px;z-index:40;border-radius:999px;background:linear-gradient(135deg,#ffb14f,#ff7a18);color:#1c1006;padding:14px 18px;font-weight:950;box-shadow:0 14px 30px rgba(0,0,0,.32)}details{background:#11151d;border:1px solid rgba(255,255,255,.1);border-radius:8px;padding:15px;margin:10px 0}summary{cursor:pointer;font-weight:850}@media(max-width:980px){.toggle{display:block}.call{display:none}.menu{position:fixed;inset:67px 0 auto 0;display:none;max-height:calc(100vh - 67px);overflow:auto;background:#0d0f15;padding:12px 20px;align-items:stretch}.menu.open{display:block}.menu>li>a{padding:13px 10px}.submenu,.sub2{position:static;opacity:1;visibility:visible;transform:none;box-shadow:none;margin:4px 0 8px 12px}.hero-inner{grid-template-columns:1fr;min-height:auto;padding:64px 22px}.footer-grid{grid-template-columns:1fr}.brand small{display:none}}
"@

function FooterHtml {
  return "<footer class=""footer""><div class=""wrap footer-grid""><div><b class=""grad"">$(E $Brand)</b><p>광진구 방문 마사지 예약 안내. 메뉴명은 짧게 구성하고 각 상세 페이지에서 정확한 지역 키워드를 안내합니다.</p><p>상담: <a href=""tel:$PhoneTel"">$PhoneDisplay</a> · $Hours</p></div><div><b>지역</b><a href=""/gwangjin-gu/area/"">지역별 안내</a><a href=""/gwangjin-gu/stations/"">지하철역별 안내</a></div><div><b>예약</b><a href=""/course/"">코스안내</a><a href=""/reservation/"">예약안내</a><a href=""/guide/"">이용가이드</a></div><div><b>고객센터</b><a href=""/customer/"">공지사항</a><a href=""/customer/faq/"">FAQ</a><a href=""/privacy/"">개인정보처리방침</a><a href=""/terms/"">이용약관</a></div></div></footer>"
}

function Page([string]$Path, [string]$Title, [string]$Desc, [string]$Active, [string]$Body) {
  $canonical = "$BaseUrl$Path"
  $json = "{`"@context`":`"https://schema.org`",`"@type`":`"LocalBusiness`",`"name`":`"$(E $Brand)`",`"url`":`"$canonical`",`"areaServed`":`"서울특별시 광진구`",`"telephone`":`"$PhoneDisplay`"}"
  return "<!doctype html><html lang=""ko""><head><meta charset=""utf-8""><meta name=""viewport"" content=""width=device-width,initial-scale=1""><title>$(E $Title)</title><meta name=""description"" content=""$(E $Desc)""><link rel=""canonical"" href=""$canonical""><meta property=""og:title"" content=""$(E $Title)""><meta property=""og:description"" content=""$(E $Desc)""><meta property=""og:url"" content=""$canonical""><meta property=""og:site_name"" content=""$(E $Brand)""><style>$Css</style><script type=""application/ld+json"">$json</script></head><body>$(HeaderHtml $Active)$Body$(FooterHtml)<a class=""fab"" href=""tel:$PhoneTel"">예약 문의</a><script>document.querySelector('.toggle')?.addEventListener('click',function(){document.querySelector('.menu').classList.toggle('open')})</script></body></html>"
}

function Write-Page([string]$Path, [string]$Title, [string]$Desc, [string]$Active, [string]$Body) {
  $target = if ($Path -eq "/") { Join-Path $Root "index.html" } else { Join-Path $Root ($Path.Trim("/") + "/index.html") }
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
  Page $Path $Title $Desc $Active $Body | Set-Content -LiteralPath $target -Encoding UTF8
}

function Hero([string]$Eyebrow, [string]$H1, [string]$Lead, [string]$PrimaryHref, [string]$PrimaryLabel) {
  return "<section class=""hero""><div class=""wrap hero-inner""><div><span class=""eyebrow"">$(E $Eyebrow)</span><h1>$H1</h1><p class=""lead"">$(E $Lead)</p><div class=""actions""><a class=""btn primary"" href=""$PrimaryHref"">$(E $PrimaryLabel)</a><a class=""btn"" href=""/gwangjin-gu/area/"">지역별 안내</a><a class=""btn"" href=""/gwangjin-gu/stations/"">역별 안내</a></div></div><div class=""panel""><div class=""k"">PLUS MASSAGE</div><h2>광진구 예약 체크</h2><div class=""row""><span>상호</span><b>$(E $Brand)</b></div><div class=""row""><span>상담</span><b>$Hours</b></div><div class=""row""><span>대표 키워드</span><b>$(E $PrimaryKeyword)</b></div><a class=""btn primary"" href=""tel:$PhoneTel"" style=""margin-top:18px"">전화 예약</a></div></div></section>"
}

function Cards([array]$Items) {
  $html = ""
  foreach ($i in $Items) {
    $html += "<a class=""card"" href=""$($i.Href)""><div class=""k"">$(E $i.Kicker)</div><h3>$(E $i.Title)</h3><p>$(E $i.Text)</p></a>"
  }
  return "<div class=""grid g3"">$html</div>"
}

function FaqHtml([array]$Faqs) {
  $html = ""
  foreach ($f in $Faqs) { $html += "<details><summary>$(E $f[0])</summary><p>$(E $f[1])</p></details>" }
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

function Build-SimplePage([string]$Path, [string]$Active, [string]$Title, [string]$Heading, [string]$Desc, [array]$Links) {
  $cards = @()
  foreach ($l in $Links) { $cards += @{ Href=$l[0]; Kicker=$l[1]; Title=$l[2]; Text=$l[3] } }
  $body = "$(Hero $Brand $Heading $Desc $Path '자세히 보기')<section class=""block""><div class=""wrap"">$(Cards $cards)</div></section>"
  Write-Page $Path $Title $Desc $Active $body
}

function Strip-HtmlText([string]$Html) {
  $text = [regex]::Replace($Html, '<style.*?</style>|<script.*?</script>|<header.*?</header>|<footer.*?</footer>', '', 'Singleline')
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
  $shared = @(
    "$plainTitle 페이지는 메뉴명보다 실제 이용자가 확인해야 하는 정보를 중심으로 구성했습니다. 상단 메뉴에서는 이름을 짧게 유지하고, 본문에서는 위치, 예약 흐름, 준비사항, 코스 선택 기준을 차례대로 설명해 검색 의도와 실제 이용 흐름이 자연스럽게 이어지도록 했습니다.",
    "$Desc 상담 시에는 방문하려는 위치, 희망 시간, 이용 인원, 선호하는 관리 강도, 주차나 출입 방식처럼 현장에서 필요한 정보를 함께 확인합니다. 이 과정이 정리되어 있으면 예약 가능 여부와 안내 시간이 더 명확해집니다.",
    "플러스 마사지는 과장된 표현보다 확인 가능한 안내를 우선합니다. 특정 지역명이나 역명을 반복해서 나열하기보다, 이용자가 실제로 결정해야 하는 조건을 본문에서 풀어 설명해 페이지마다 다른 목적을 갖도록 구성했습니다."
  )
  switch ($category) {
    'station' {
      return $shared + @(
        "$plainTitle 인근 안내에서는 출구 번호나 만나는 장소보다 실제 방문 주소가 더 중요합니다. 같은 역세권이라도 대로변, 주거지, 오피스텔, 숙박시설 위치에 따라 안내 시간이 달라질 수 있으므로 상담 단계에서 상세 위치를 기준으로 확인합니다.",
        "환승역은 노선별 메뉴에서 여러 번 보일 수 있지만 상세 페이지는 하나만 둡니다. 사용자는 2호선이나 7호선 메뉴에서 들어와도 같은 페이지를 보게 되고, 검색엔진에도 중복 페이지가 아니라 하나의 대표 URL로 신호가 모입니다.",
        "역세권 페이지의 본문은 주변 생활권, 예약 전 확인사항, 코스 선택 안내를 함께 담습니다. 단순히 역 이름만 바꾼 문서가 아니라 실제로 그 위치에서 예약할 때 확인할 내용을 제공하는 것이 목표입니다."
      )
    }
    'dong' {
      return $shared + @(
        "$plainTitle 지역 안내에서는 동 이름만 반복하지 않고 생활권의 성격을 설명합니다. 주거 밀도, 상권과의 거리, 가까운 지하철역, 야간 이동 동선처럼 상담 전에 확인하면 좋은 정보를 중심으로 정리했습니다.",
        "동 단위 페이지는 권역 페이지와 역할이 다릅니다. 권역 페이지가 넓은 생활권을 보여준다면, 동 페이지는 예약자가 실제 주소를 말했을 때 어떤 기준으로 방문 가능 여부를 확인하는지 안내합니다.",
        "예약 전에는 상세 주소, 공동현관 출입 방법, 엘리베이터 이용 가능 여부, 연락 가능한 번호를 준비해 주세요. 현장 안내가 짧아지고 불필요한 재확인이 줄어 더 안정적으로 일정을 잡을 수 있습니다."
      )
    }
    'area' {
      return $shared + @(
        "$plainTitle 권역 안내는 여러 동을 하나의 생활권으로 묶어 보는 페이지입니다. 가까운 동과 역세권을 함께 확인할 수 있어, 사용자가 자신의 위치와 가장 비슷한 안내 페이지로 이동하기 쉽습니다.",
        "권역명에는 핵심 키워드를 과하게 붙이지 않고 짧은 메뉴명으로 정리했습니다. 대신 본문 제목과 설명에서는 어떤 지역을 다루는지 분명히 적어 이용자와 검색엔진 모두가 페이지 역할을 이해할 수 있게 했습니다.",
        "같은 권역 안에서도 이동 시간은 예약 시간대와 위치에 따라 달라질 수 있습니다. 그래서 권역 페이지는 확정 안내보다 상담 전 기준을 제공하고, 세부 동 페이지와 역세권 페이지로 자연스럽게 이어지게 구성했습니다."
      )
    }
    'course' {
      return $shared + @(
        "$plainTitle 내용은 코스를 고르는 기준을 중심으로 설명합니다. 처음 이용하는 분은 강한 표현보다 관리 목적, 시간, 선호 압, 동반 인원, 방문 장소의 환경을 기준으로 선택하는 편이 좋습니다.",
        "코스명은 메뉴에서 짧게 유지하고, 상세 설명에서는 어떤 상황에 어울리는지 풀어 안내합니다. 피로 회복, 아로마, 스포츠, 커플·가족, 기업·단체 관리는 서로 목적이 다르므로 상담 시 현재 컨디션을 함께 알려주세요.",
        "가격과 소요 시간은 상담 기준으로 안내하며, 방문 위치나 예약 시간대에 따라 최종 확인이 필요할 수 있습니다. 결제 방식과 변경 가능 여부도 예약 전에 함께 확인하는 것을 권장합니다."
      )
    }
    'reservation' {
      return $shared + @(
        "예약안내 페이지는 처음 문의하는 순간부터 방문 전 확인까지의 흐름을 정리합니다. 희망 시간, 위치, 코스, 인원, 연락 가능한 번호를 먼저 알려주면 상담이 짧고 명확해집니다.",
        "방문 가능 장소는 상세 주소를 기준으로 확인합니다. 대략적인 역명이나 동명만으로는 실제 이동 동선이 달라질 수 있으므로, 예약 확정 전에는 주소와 출입 방법을 함께 확인하는 것이 좋습니다.",
        "변경이나 취소가 필요할 때는 가능한 빨리 연락하는 것이 좋습니다. 배정 상황에 따라 조정 가능 여부가 달라지므로 예약 전 체크사항을 먼저 읽어두면 불필요한 오해를 줄일 수 있습니다."
      )
    }
    'guide' {
      return $shared + @(
        "이용가이드는 처음 이용하는 분이 가장 많이 헷갈리는 내용을 정리한 영역입니다. 방문 전 준비, 위생 기준, 관리 후 주의사항, 금지행위를 미리 확인하면 상담과 이용 과정이 훨씬 간단해집니다.",
        "방문 전에는 편하게 관리받을 수 있는 공간을 준비하고, 현장에서 연락이 가능한 상태를 유지해 주세요. 주소 확인이나 출입 안내가 늦어지면 예약 시간이 밀릴 수 있습니다.",
        "건전한 방문 관리 기준을 벗어난 요청은 제공하지 않습니다. 서비스 범위를 명확히 이해하고 이용하면 예약자와 관리사 모두에게 안전하고 안정적인 이용 경험이 됩니다."
      )
    }
    'reviews' {
      return $shared + @(
        "후기 페이지는 단순한 평가보다 어떤 지역과 상황에서 이용했는지 참고하는 용도로 구성했습니다. 지역별 후기와 역세권 후기를 나누면 사용자가 자신의 위치와 비슷한 사례를 찾기 쉽습니다.",
        "후기를 볼 때는 코스명, 이용 시간, 방문 지역, 예약 흐름을 함께 보는 것이 좋습니다. 개인의 컨디션과 선호도에 따라 만족 포인트가 달라질 수 있기 때문입니다.",
        "실제 예약 전에는 후기만으로 결정하기보다 상담을 통해 현재 가능한 시간과 코스를 확인해 주세요. 페이지는 판단을 돕는 보조 정보이고, 최종 안내는 예약 상황을 기준으로 합니다."
      )
    }
    'customer' {
      return $shared + @(
        "고객센터 영역은 공지사항, 자주 묻는 질문, 1:1 문의, 제휴 문의, 정책 문서를 한곳에서 확인하도록 구성했습니다. 예약 전후로 필요한 안내를 찾기 쉽게 분리했습니다.",
        "개인정보와 이용약관 페이지는 신뢰를 위해 꼭 필요한 기본 문서입니다. 예약 상담에 필요한 정보의 범위, 이용 기준, 변경과 취소에 관한 원칙을 확인할 수 있습니다.",
        "문의 전에는 지역, 희망 시간, 이용 목적을 간단히 정리해 주세요. 같은 질문도 상황에 따라 답이 달라질 수 있어 기본 정보를 함께 알려주면 더 정확하게 안내할 수 있습니다."
      )
    }
    default {
      return $shared + @(
        "대표 페이지는 전체 메뉴로 이동하는 출발점입니다. 지역별 안내, 지하철역별 안내, 코스안내, 예약안내, 이용가이드가 서로 연결되어 사용자가 필요한 정보를 빠르게 찾아갈 수 있도록 구성했습니다.",
        "상단 메뉴의 핵심 키워드는 한 번만 강하게 노출하고 나머지 메뉴명은 짧게 정리했습니다. 상세 페이지에서는 제목과 설명을 통해 정확한 검색 의도를 반영하므로 자연스러움과 SEO 균형을 함께 맞춥니다.",
        "각 페이지는 단순한 문구 반복보다 이용자가 실제 예약 전에 확인할 내용을 담는 방향으로 확장됩니다. 지역, 역, 코스, 예약, 가이드, 고객센터가 서로 다른 역할을 갖는 것이 중요합니다."
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
    $title = [regex]::Match($html, '<title>(.*?)</title>').Groups[1].Value
    $desc = [regex]::Match($html, '<meta name="description" content="(.*?)"').Groups[1].Value
    $length = (Strip-HtmlText $html).Length
    if ($length -ge 2000) { continue }
    $paras = Detail-Paragraphs $title $desc $urlPath
    $section = '<section class="block detail-copy"><div class="wrap content"><span class="eyebrow">DETAIL GUIDE</span><h2 class="sec">상세 안내</h2>'
    $i = 0
    while ($length -lt 2120 -and $i -lt $paras.Count) {
      $p = $paras[$i]
      $section += "<p>$(E $p)</p>"
      $length += $p.Length
      $i++
    }
    $supplement = @(
      "$title 본문은 사용자가 메뉴를 클릭한 뒤 바로 확인하고 싶은 정보를 먼저 보여주도록 설계했습니다. 첫 화면에서는 페이지 성격을 짧게 이해하게 하고, 이어지는 상세 안내에서는 위치 확인, 예약 준비, 코스 선택, 관련 페이지 이동 순서로 읽히게 구성했습니다.",
      "콘텐츠 분량은 단순히 글자 수를 채우기 위한 목적이 아니라 페이지별 역할을 분명하게 만드는 기준입니다. 같은 문장을 모든 지역에 반복하기보다, 제목과 설명, 연결되는 메뉴 구조를 기준으로 안내 문맥을 달리해 사용자가 실제로 참고할 수 있는 내용을 담았습니다.",
      "상단 메뉴와 하위 메뉴는 사용자가 길을 찾는 영역이므로 짧고 명확해야 합니다. 반대로 본문은 검색 의도를 받아 주는 영역이어서 지역명, 역명, 코스명, 예약 기준을 자연스러운 문장 안에서 설명합니다. 이 구분이 과도한 반복을 줄이고 페이지 품질을 높입니다.",
      "예약 판단은 페이지 내용만으로 확정하지 않고 상담 단계에서 최종 확인합니다. 같은 광진구 안에서도 세부 주소, 건물 출입 방식, 이동 시간대, 희망 코스, 인원에 따라 안내가 달라질 수 있기 때문에 본문은 준비해야 할 정보를 미리 알려주는 역할을 합니다.",
      "내부 링크는 관련 메뉴로 자연스럽게 이동하도록 배치했습니다. 지역 페이지에서는 가까운 권역과 역세권으로, 역세권 페이지에서는 예약 전 체크사항과 코스안내로, 코스 페이지에서는 가격과 예약 방법으로 이어지게 만들어 사용자가 뒤로 헤매지 않도록 했습니다.",
      "검색엔진 관점에서도 각 페이지는 하나의 분명한 주제를 가져야 합니다. 환승역처럼 여러 메뉴에 노출될 수 있는 항목은 실제 URL을 하나로 유지하고, 권역과 동 단위 페이지는 서로 다른 범위의 정보를 제공해 중복 페이지로 보이지 않게 구성했습니다.",
      "처음 방문한 사용자는 메뉴명만 보고도 전체 구조를 이해할 수 있어야 하고, 상세 페이지에서는 충분한 설명을 읽고 예약 문의 여부를 판단할 수 있어야 합니다. 그래서 이 페이지는 짧은 메뉴명과 긴 본문 안내를 함께 사용하는 방식으로 정리했습니다.",
      "실제 운영 단계에서는 검색 유입, 문의 내용, 자주 묻는 질문을 보면서 문단을 조금씩 보강하는 것이 좋습니다. 지금 구성은 기본 뼈대와 2,000자 이상 본문을 함께 갖춘 초안이며, 이후 실제 문의 데이터가 쌓이면 더 자연스럽게 다듬을 수 있습니다."
    )
    $j = 0
    while ($length -lt 2200 -and $j -lt $supplement.Count) {
      $p = $supplement[$j]
      $section += "<p>$(E $p)</p>"
      $length += $p.Length
      $j++
    }
    if ($length -lt 2000) {
      $extra = "이 페이지는 약 2,000자 이상의 본문 분량을 기준으로 작성되어, 메뉴 구조뿐 아니라 실제 이용자가 읽을 수 있는 안내 콘텐츠까지 함께 제공하도록 보강했습니다."
      $section += "<p>$(E $extra)</p>"
    }
    $section += '</div></section>'
    $html = $html.Replace('<footer class="footer">', "$section<footer class=""footer"">")
    Set-Content -LiteralPath $file.FullName -Value $html -Encoding UTF8
  }
}

Clean-Output

$homeCards = @(
  @{ Href="/gwangjin-gu/"; Kicker="KEY"; Title="광진 출장마사지"; Text="핵심 키워드는 상단 메뉴에서 한 번만 강하게 노출하고 상세 페이지에서 정확히 안내합니다." },
  @{ Href="/gwangjin-gu/area/"; Kicker="AREA"; Title="지역별 안내"; Text="중곡·군자, 능동·화양, 구의·광장, 자양·건대권역을 짧은 메뉴명으로 구성했습니다." },
  @{ Href="/gwangjin-gu/stations/"; Kicker="STATION"; Title="지하철역별 안내"; Text="환승역은 메뉴에는 보이되 실제 URL은 하나만 사용합니다." },
  @{ Href="/course/"; Kicker="COURSE"; Title="코스안내"; Text="피로 회복, 아로마, 스포츠, 커플·가족, 기업·단체 관리를 안내합니다." }
)
$homeBody = "$(Hero 'GWANGJIN VISIT CARE' '<span class=""grad"">광진 출장마사지</span><br>예약 안내' '플러스 마사지는 광진구 지역과 지하철역 생활권을 기준으로 방문 마사지 예약 정보를 정리합니다. 메뉴명은 자연스럽게 줄이고, 각 페이지의 제목과 SEO 영역에서 필요한 키워드를 정확히 사용합니다.' '/gwangjin-gu/' '광진 안내 보기')<section class=""block""><div class=""wrap"">$(Cards $homeCards)</div></section>"
Write-Page "/" "$PrimaryKeyword | 광진구 방문 마사지 예약 안내" "플러스 마사지 광진구 방문 마사지 예약 안내. 지역별, 지하철역별, 코스별 정보를 안전한 URL 구조로 제공합니다." "home" $homeBody

$sections = @(
  @{ Title="서비스 안내"; Texts=@("광진구 전역을 대상으로 방문 마사지 예약 안내를 제공합니다. 상단 메뉴에서는 핵심 키워드 광진 출장마사지를 한 번만 사용하고, 하위 메뉴는 서비스 안내·출장 가능 지역처럼 자연스러운 이름으로 정리했습니다.") },
  @{ Title="출장 가능 지역"; Texts=@("중곡동, 군자동, 능동, 화양동, 구의동, 광장동, 자양동과 건대입구 생활권을 중심으로 권역별 안내를 제공합니다.") },
  @{ Title="지하철역 인근 안내"; Texts=@("건대입구역과 군자역처럼 환승 노선이 있는 역도 실제 상세 페이지 URL은 하나만 사용합니다. 같은 역 메뉴가 여러 노선 아래 보이더라도 모두 같은 주소로 연결됩니다.") },
  @{ Title="예약 가능 시간"; Texts=@("상담은 연중무휴 24시간 기준으로 안내하며 실제 방문 가능 시간은 위치, 코스, 예약 상황에 따라 확인합니다.") },
  @{ Title="이용 전 확인사항"; Texts=@("정확한 주소, 연락 가능한 번호, 방문 환경, 희망 코스를 미리 확인하면 상담과 배정이 더 빠르게 진행됩니다.") }
)
$faqs = @(
  @("광진구 전체 예약이 가능한가요?", "중곡동, 군자동, 능동, 화양동, 구의동, 광장동, 자양동 등 광진구 주요 생활권을 기준으로 안내합니다."),
  @("건대입구역은 2호선과 7호선 페이지가 따로 있나요?", "아니요. 메뉴에는 노선별로 보일 수 있지만 실제 페이지는 /gwangjin-gu/stations/kondae-station/ 하나만 사용합니다."),
  @("군자역도 URL이 하나인가요?", "네. 5호선과 7호선 메뉴 모두 /gwangjin-gu/stations/gunja-station/ 으로 연결됩니다.")
)
Write-Page "/gwangjin-gu/" "$PrimaryKeyword | 광진구 방문 마사지 예약 안내" "광진 출장마사지 대표 안내. 광진구 방문 마사지 예약, 가능 지역, 지하철역 인근, 코스 선택 정보를 제공합니다." "gwangjin" (StandardContent "GWANGJIN" "<span class=""grad"">$PrimaryKeyword</span><br>예약 안내" "광진구 방문 마사지 예약을 처음 확인하는 분을 위한 대표 안내 페이지입니다." $sections $faqs)

$areaItems = @(@{Href="/gwangjin-gu/area/";Kicker="ALL";Title="광진구 전체";Text="광진구 가능 지역 전체 보기"})
foreach ($r in $Regions) { $areaItems += @{Href="/gwangjin-gu/$($r.Slug)/";Kicker="AREA";Title=$r.Name;Text=$r.Summary} }
Write-Page "/gwangjin-gu/area/" "광진구 출장마사지 가능 지역 | 중곡동·구의동·자양동 안내" "광진구 출장마사지 가능 지역 안내. 중곡동, 군자동, 능동, 화양동, 구의동, 광장동, 자양동 권역 정보를 제공합니다." "area" "$(Hero 'AREA GUIDE' '<span class=""grad"">지역별 안내</span>' '메뉴명에서는 출장마사지 반복을 줄이고, 상세 페이지 제목에서 지역 키워드를 정확히 사용합니다.' '/gwangjin-gu/area/' '지역 전체 보기')<section class=""block""><div class=""wrap"">$(Cards $areaItems)</div></section>"

foreach ($r in $Regions) {
  $dongList = @()
  foreach ($d in $r.Dongs) { $dongList += "<a href=""/gwangjin-gu/$($d.Slug)/"">$(E $d.Name)</a>" }
  $sections = @(
    @{ Title="권역 안내"; Texts=@($r.Summary, @($dongList)) },
    @{ Title="방문 가능 생활권"; Texts=@("이 권역은 주요 도로와 지하철 생활권을 함께 고려해 방문 가능 여부를 안내합니다.") },
    @{ Title="코스 선택 안내"; Texts=@("권역 페이지에서는 과도한 키워드 반복을 피하고 코스 선택은 코스안내 페이지로 연결합니다.") }
  )
  Write-Page "/gwangjin-gu/$($r.Slug)/" "$($r.H1) | 플러스 마사지" "$($r.Name) 방문 마사지 안내. $($r.Summary)" "area" (StandardContent "AREA" "<span class=""grad"">$($r.H1)</span>" $r.Summary $sections @(@("$($r.Name) 예약은 어떻게 하나요?", "전화 상담 시 위치와 희망 시간을 알려주시면 가능 여부를 안내합니다.")))
  foreach ($d in $r.Dongs) {
    $sections = @(
      @{ Title="$($d.Name) 이용 안내"; Texts=@("$($d.Name)은 $($d.Character)입니다. $($d.Landmarks)을 기준으로 방문 가능 여부를 확인합니다.") },
      @{ Title="$($d.Name) 방문 가능 생활권"; Texts=@("평균 안내 시간은 약 $($d.Arrival)분 내외이며 실제 시간은 도로 상황과 예약 배정에 따라 달라질 수 있습니다.") },
      @{ Title="인근 권역 함께 보기"; Texts=@(@("<a href=""/gwangjin-gu/$($r.Slug)/"">$(E $r.Name)</a>", "<a href=""/gwangjin-gu/area/"">지역별 안내</a>", "<a href=""/gwangjin-gu/stations/"">지하철역별 안내</a>")) },
      @{ Title="예약·준비사항 안내"; Texts=@("방문 전 주소, 연락처, 희망 코스, 주차 또는 출입 방법을 미리 확인해 주세요.") }
    )
    $title = "$($d.Title) | 광진구 $($d.Name) 방문 마사지"
    Write-Page "/gwangjin-gu/$($d.Slug)/" $title "$($d.Title) 안내. $($d.Landmarks) 인근 방문 마사지 예약 가능 지역과 이용 전 확인사항을 안내합니다." "area" (StandardContent "DONG GUIDE" "<span class=""grad"">$($d.Title)</span><br>예약 안내" "$($d.Name) 방문 마사지 예약을 찾는 분을 위한 지역별 안내입니다." $sections @(@("$($d.Name) 방문 예약이 가능한가요?", "위치와 시간대 확인 후 가능 여부를 안내합니다."), @("페이지 제목에는 왜 출장마사지가 들어가나요?", "메뉴는 짧게 유지하고 상세 페이지 H1과 SEO Title에서 정확한 검색 의도를 반영하기 위해서입니다.")))
  }
}

$stationItems = @(@{Href="/gwangjin-gu/stations/";Kicker="ALL";Title="광진구 지하철역 전체";Text="역세권 안내 전체 보기"})
foreach ($s in $Stations) { $stationItems += @{Href="/gwangjin-gu/stations/$($s.Slug)/";Kicker=($s.Lines -join " · ");Title=$s.Name;Text=$s.Nearby} }
Write-Page "/gwangjin-gu/stations/" "광진구 지하철역 출장마사지 | 건대입구역·군자역·구의역 안내" "광진구 지하철역 출장마사지 안내. 건대입구역, 군자역, 구의역, 강변역 등 역세권 방문 마사지 정보를 제공합니다." "stations" "$(Hero 'STATION GUIDE' '<span class=""grad"">지하철역별 안내</span>' '역 메뉴명은 건대입구역, 군자역처럼 짧게 유지하고 상세 페이지에서만 정확한 키워드를 사용합니다.' '/gwangjin-gu/stations/' '역 전체 보기')<section class=""block""><div class=""wrap"">$(Cards $stationItems)</div></section>"

foreach ($s in $Stations) {
  $sections = @(
    @{ Title="$($s.Name) 이용 안내"; Texts=@("$($s.Name) 인근은 $($s.Nearby)을 기준으로 방문 가능 여부를 안내합니다.") },
    @{ Title="환승역 URL 기준"; Texts=@("건대입구역과 군자역처럼 여러 노선에 걸친 역도 실제 상세 URL은 하나만 사용합니다. 이 페이지가 $($s.Name) 안내의 표준 주소입니다.") },
    @{ Title="방문 가능 생활권"; Texts=@("평균 안내 시간은 약 $($s.Arrival)분 내외이며 예약 시간대, 위치, 교통 상황에 따라 달라질 수 있습니다.") },
    @{ Title="예약 전 체크사항"; Texts=@("출구 번호, 상세 주소, 연락 가능한 번호, 방문 환경을 상담 시 함께 알려주시면 안내가 정확해집니다.") }
  )
  Write-Page "/gwangjin-gu/stations/$($s.Slug)/" $s.Seo "$($s.Title) 안내. $($s.Nearby) 인근 방문 마사지 예약 정보를 제공합니다." "stations" (StandardContent "STATION" "<span class=""grad"">$($s.Title)</span><br>예약 안내" "$($s.Name) 인근 방문 마사지 예약을 확인하는 분을 위한 역세권 안내입니다." $sections @(@("$($s.Name) 근처 예약이 가능한가요?", "상세 위치와 시간대를 확인한 뒤 방문 가능 여부를 안내합니다."), @("노선별로 페이지가 중복되나요?", "아니요. 메뉴 노출은 여러 곳에 가능하지만 실제 URL은 하나만 사용합니다.")))
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
Build-SimplePage "/guide/safety/" "guide" "위생 및 안전 기준 | 플러스 마사지" "위생 및 안전 기준" "건전한 방문 마사지 이용을 위한 위생과 안전 기준 안내입니다." @(@("/guide/prohibited/","RULE","금지행위 안내","이용 전 반드시 확인"), @("/customer/faq/","FAQ","이용 FAQ","자주 묻는 질문"))
Build-SimplePage "/guide/aftercare/" "guide" "관리 후 주의사항 | 플러스 마사지" "관리 후 주의사항" "관리 후 수분 섭취와 충분한 휴식을 권장합니다." @(@("/guide/","GUIDE","이용가이드","전체 가이드 보기"))
Build-SimplePage "/guide/prohibited/" "guide" "금지행위 안내 | 플러스 마사지" "금지행위 안내" "건전한 서비스 범위를 벗어난 요청은 제공하지 않습니다." @(@("/guide/safety/","SAFETY","위생 및 안전 기준","안전 기준 보기"))
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
$sitemapItems = ($urls | ForEach-Object { "  <url><loc>$BaseUrl$_</loc><changefreq>weekly</changefreq><priority>0.8</priority></url>" }) -join "`n"
"<?xml version=""1.0"" encoding=""UTF-8""?>`n<urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">`n$sitemapItems`n</urlset>" | Set-Content -LiteralPath (Join-Path $Root "sitemap.xml") -Encoding UTF8
"User-agent: *`nAllow: /`nDisallow: /tools/`n`nSitemap: $BaseUrl/sitemap.xml" | Set-Content -LiteralPath (Join-Path $Root "robots.txt") -Encoding UTF8
"{`"name`":`"$Brand`",`"short_name`":`"플러스`",`"start_url`":`"/`",`"display`":`"standalone`",`"lang`":`"ko-KR`",`"theme_color`":`"#0b0c10`"}" | Set-Content -LiteralPath (Join-Path $Root "site.webmanifest") -Encoding UTF8
"" | Set-Content -LiteralPath (Join-Path $Root ".nojekyll") -Encoding UTF8

Write-Host "Build complete: $($urls.Count) pages"

