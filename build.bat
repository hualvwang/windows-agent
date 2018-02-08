@echo off
:: setup http proxy and git proxy if needed.
set http_proxy=127.0.0.1:1080
git config --global http.proxy %http_proxy%


set GOPATH=C:\Users\laosh\go
mkdir %GOPATH%\src\github.com\freedomkk-qfeng\
mklink /J %GOPATH%\src\github.com\freedomkk-qfeng\windows-agent g:\Github\open-falcon\windows-agent

cd /d %GOPATH%\src\github.com\freedomkk-qfeng\windows-agent

go get

go build -o windows-agent.exe
@if errorlevel 1 (echo "build failed.") else (  echo "build success."  )
echo "will exit in 3s."
ping  -n 3 127.1 > nul 2>&1