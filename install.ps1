# Install scientific-research-skill ke skills dir Hermes (Windows).
# Pakai (PowerShell):
#   irm https://raw.githubusercontent.com/Genesis410/scientific-research-skill/main/install.ps1 | iex
param([string]$SkillsDir)  # opsi: -SkillsDir <path>

# Deteksi skills dir aktif bila -SkillsDir tidak diberikan
if (-not $SkillsDir) {
  $SkillsDir = if ((Test-Path "$env:LOCALAPPDATA\hermes\skills") -and (Get-ChildItem "$env:LOCALAPPDATA\hermes\skills" -ErrorAction SilentlyContinue)) {
    Join-Path $env:LOCALAPPDATA "hermes\skills"
  } else {
    Join-Path $env:USERPROFILE ".hermes\skills"
  }
}

$Repo = "https://github.com/Genesis410/scientific-research-skill.git"
$Dest = Join-Path $SkillsDir "scientific-research-skill"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw "butuh git" }
New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null

if (Test-Path (Join-Path $Dest ".git")) {
  Write-Host "sudah terpasang — update..."
  git -C $Dest pull --ff-only -q
} else {
  Remove-Item -Recurse -Force $Dest -ErrorAction SilentlyContinue
  git clone --depth 1 $Repo $Dest -q
}

Write-Host "terpasang: $Dest"
Write-Host "pakai: sebut 'riset ilmiah' / panggil skill scientific-research di runtime agent kamu"
Write-Host "catatan: butuh runtime dengan tool pencarian web + ekstraksi halaman (web_search/web_extract)"
