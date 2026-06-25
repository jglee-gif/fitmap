#!/bin/bash
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   Fit Map — 포트폴리오 진단 시스템"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# API 키 확인
if [ -z "$ANTHROPIC_API_KEY" ]; then
  if [ -f ".env" ]; then
    export $(cat .env | grep -v '#' | xargs)
    echo "✅ .env 파일에서 API 키 로드"
  else
    echo ""
    echo "⚠️  ANTHROPIC_API_KEY가 설정되지 않았습니다."
    echo "   아래 방법 중 하나로 설정하세요:"
    echo ""
    echo "   방법 1) 터미널에서 직접 입력:"
    echo "   export ANTHROPIC_API_KEY=sk-ant-..."
    echo ""
    echo "   방법 2) .env 파일 생성:"
    echo "   echo 'ANTHROPIC_API_KEY=sk-ant-...' > .env"
    echo ""
    read -p "지금 API 키를 입력하시겠습니까? (y/n): " ans
    if [ "$ans" = "y" ]; then
      read -p "API 키: " key
      export ANTHROPIC_API_KEY=$key
    else
      echo "API 키 없이는 분석이 불가합니다. 종료합니다."
      exit 1
    fi
  fi
fi

# 패키지 확인 및 설치
echo ""
echo "📦 패키지 확인 중..."
cd backend
if ! python3 -c "import fastapi, anthropic, openpyxl, pandas" 2>/dev/null; then
  echo "📦 필요한 패키지를 설치합니다..."
  pip install -r ../requirements.txt -q
fi

echo ""
echo "🚀 서버 시작 중..."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   접속 주소: http://localhost:8000"
echo "   팀원 공유: http://[내 IP]:8000"
echo ""
echo "   종료: Ctrl + C"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

uvicorn main:app --host 0.0.0.0 --port 8000 --reload
