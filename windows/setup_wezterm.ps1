# 5. Create Symbolic Links
Write-Host "`n[RUN] Creating symbolic links..." -ForegroundColor Yellow

# Get the directory where this script is located
$scriptDir = Split-Path -Parent $PSScriptRoot
if ($scriptDir -eq "") { $scriptDir = Get-Location }

$sourceNvim = Join-Path $scriptDir "windows\.wezterm.lua"
$targetNvim = "$env:HOMEPATH\.wezterm.lua"

if (Test-Path $sourceNvim) {
    Write-Host "[INFO] Linking $sourceNvim to $targetNvim" -ForegroundColor Cyan
    
    # Remove existing config or link
    if (Test-Path $targetNvim) {
        Write-Host "[INFO] Removing existing target: $targetNvim" -ForegroundColor Gray
        Remove-Item -Recurse -Force $targetNvim
    }
    
    # Create Symbolic Link
    New-Item -ItemType SymbolicLink -Path $targetNvim -Value $sourceNvim -Force
    Write-Host "[SUCCESS] Symbolic link created for Neovim." -ForegroundColor Green
} else {
    Write-Warning "Source directory not found: $sourceNvim"
}

Write-Host "[SUCCESS] Symbolic links created." -ForegroundColor Green
