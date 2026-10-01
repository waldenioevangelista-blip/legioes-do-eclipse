$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    throw "Node.js não encontrado. Instale o Node.js LTS antes de continuar."
}

Write-Host "Instalando dependências do executável..." -ForegroundColor Cyan
npm install

Write-Host "Gerando Legiões do Eclipse DREAM para Windows..." -ForegroundColor Cyan
npm run dist:win

Write-Host ""
Write-Host "Pronto. O EXE estará em: $PSScriptRoot\dist" -ForegroundColor Green
