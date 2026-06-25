# Fit Map — 포트폴리오 진단 시스템

포트폴리오사 결산 자료(엑셀/PDF)를 업로드하면 AI가 자동으로
MPES 등급 산출 · 밸류업 프로그램 매칭 · 그로스파트너스 멘토 추천을 해드립니다.

---

## 시작하기 (3단계)

### 1단계 — API 키 설정

```bash
cp .env.example .env
# .env 파일 열고 sk-ant-... 키 입력
```

### 2단계 — 서버 실행

**Mac / Linux:**
```bash
chmod +x start.sh
./start.sh
```

**Windows:**
```
start.bat 더블클릭
```

### 3단계 — 접속

브라우저에서 **http://localhost:8000** 접속

---

## 팀원 공유 방법

같은 WiFi에 연결된 팀원들은 아래 주소로 접속 가능합니다:

```
http://[내 노트북 IP]:8000
```

내 IP 확인:
- Mac: `ifconfig | grep "inet " | grep -v 127`
- Windows: `ipconfig | findstr IPv4`

---

## 파일 구조

```
fitmap-local/
├── backend/
│   └── main.py          ← FastAPI 서버 + Claude API + 멘토 매칭
├── frontend/
│   └── static/
│       ├── index.html   ← 업로드 페이지 (기업 목록)
│       └── report.html  ← 진단 리포트 페이지
├── data/
│   └── mentors.csv      ← 그로스파트너스 177명 멘토 데이터
├── requirements.txt
├── start.sh             ← Mac/Linux 시작 스크립트
├── start.bat            ← Windows 시작 스크립트
└── .env.example         ← API 키 설정 예시
```

---

## 자주 수정하는 것

| 항목 | 파일 |
|------|------|
| 밸류업 프로그램 내용 | `backend/main.py` → `VALUEUP_PROGRAMS` |
| AI 분석 프롬프트 | `backend/main.py` → `SYSTEM_PROMPT` |
| 멘토 데이터 업데이트 | `data/mentors.csv` 교체 |
| 업로드 UI | `frontend/static/index.html` |
| 리포트 UI | `frontend/static/report.html` |
