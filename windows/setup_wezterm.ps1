# 5. Create Symbolic Links
Write-Host "[RUN] Set wezterm config dir..." -ForegroundColor Yellow

# Get the directory where this script is located
$scriptDir = Split-Path -Parent $PSScriptRoot
if ($scriptDir -eq "") { $scriptDir = Get-Location }

$sourceNvim = Join-Path $scriptDir "windows\wezterm"
Write-Host "$sourceNvim"
setx WEZTERM_CONFIG_FILE "$sourceNvim\wezterm.lua"


