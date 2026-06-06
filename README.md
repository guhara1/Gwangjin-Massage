# 플러스 마사지 광진 출장마사지

정적 HTML 사이트입니다. 상단 메뉴에서는 핵심 키워드 `광진 출장마사지`를 한 번만 강하게 노출하고, 지역/역/코스 하위 메뉴에서는 반복 키워드를 제거했습니다.

## 빌드

```powershell
powershell -ExecutionPolicy Bypass -File tools\build.ps1
```

생성 결과는 저장소 루트의 `index.html`, `gwangjin-gu/`, `course/`, `reservation/`, `guide/`, `reviews/`, `customer/` 경로에 출력됩니다.

## URL 원칙

- 대표: `/gwangjin-gu/`
- 지역 전체: `/gwangjin-gu/area/`
- 역 전체: `/gwangjin-gu/stations/`
- 환승역 중복 방지:
  - `/gwangjin-gu/stations/kondae-station/`
  - `/gwangjin-gu/stations/gunja-station/`

메뉴명은 `건대입구역`, `군자역`, `구의동`처럼 짧게 유지하고, 페이지 H1과 SEO Title에서 `건대입구역 출장마사지`처럼 검색 의도를 반영합니다.
