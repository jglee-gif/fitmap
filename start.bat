@echo off
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo    Fit Map — 포트폴리오 진단 시스템
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

:: .env 파일에서 API 키 로드
if exist .env (
  for /f "tokens=1,2 delims==" %%a in (.env) do (
    if "%%a"=="ANTHROPIC_API_KEY" set ANTHROPIC_API_KEY=%%b
  )
  echo API 키 로드 완료
)

if "%ANTHROPIC_API_KEY%"=="" (
  echo.
  echo ⚠️  ANTHROPIC_API_KEY가 설정되지 않았습니다.
  echo    .env 파일에 아래 내용을 추가하세요:
  echo    ANTHROPIC_API_KEY=sk-ant-...
  echo.
  set /p ANTHROPIC_API_KEY=API 키를 직접 입력하세요: 
)

echo.
echo 📦 패키지 확인 중...
cd backend
pip install -r ../requirements.txt -q

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo    접속 주소: http://localhost:8000
echo    종료: Ctrl + C
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

uvicorn main:app --host 0.0.0.0 --port 8000 --reload
