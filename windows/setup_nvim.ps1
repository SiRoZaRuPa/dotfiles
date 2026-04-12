# Set execution policy for the current process
Set-ExecutionPolicy Bypass -Scope Process -Force

# 2. Install Chocolatey
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Host "[SKIP] Scoop is already installed." -ForegroundColor Cyan
} else {
    Write-Host "[RUN] Installing Scoop..." -ForegroundColor Yellow
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

scoop bucket add main
scoop bucket add versions

# 3. Install Neovim and Dependencies
Write-Host "`n[RUN] Installing Neovim and required tools..." -ForegroundColor Yellow
# Installing git, ripgrep, fd, and make for LazyVim requirements
scoop install ripgrep fd mingw cmake make unzip -y
scoop install neovim@0.11.7

# 4. Setup LazyVim
Write-Host "`n[RUN] Setting up LazyVim configuration..." -ForegroundColor Yellow

$nvimConfigPath = "$env:LOCALAPPDATA\nvim"

# Backup existing config if it exists
if (Test-Path $nvimConfigPath) {
    $backupPath = "$nvimConfigPath.bak"
    Write-Host "[INFO] Backing up existing config to $backupPath" -ForegroundColor Cyan
    if (Test-Path $backupPath) { Remove-Item -Recurse -Force $backupPath }
    Move-Item -Path $nvimConfigPath -Destination $backupPath
}

# Clone the LazyVim starter template
Write-Host "`n[RUN] Cloning LazyVim starter repository..." -ForegroundColor Yellow
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim

# Remove .git folder to allow for personal customization
if (Test-Path "$env:LOCALAPPDATA\nvim\.git") {
    Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim\.git
}

# 5. Create Symbolic Links
Write-Host "`n[RUN] Creating symbolic links..." -ForegroundColor Yellow

# Get the directory where this script is located
$scriptDir = Split-Path -Parent $PSScriptRoot
if ($scriptDir -eq "") { $scriptDir = Get-Location }

$sourceNvim = Join-Path $scriptDir "windows\nvim\lua"
$targetNvim = "$env:LOCALAPPDATA\nvim\lua"

if (Test-Path $sourceNvim) {
    Write-Host "[INFO] Linking $sourceNvim to $targetNvim" -ForegroundColor Cyan
    
    # Remove existing config or link
    if (Test-Path $targetNvim) {
        Write-Host "[INFO] Removing existing target: $targetNvim" -ForegroundColor Gray
        Remove-Item -Recurse -Force $targetNvim
    }
    
    # Create Symbolic Link
    cmd /c mklink /j $targetNvim $sourceNvim
    Write-Host "[SUCCESS] Symbolic link created for Neovim." -ForegroundColor Green
} else {
    Write-Warning "Source directory not found: $sourceNvim"
}

Write-Host "[SUCCESS] Symbolic links created." -ForegroundColor Green

Write-Host "-------------------------------------------" -ForegroundColor Green
Write-Host "Setup Completed Successfully!" -ForegroundColor Green
Write-Host "Please restart your terminal and run 'nvim'." -ForegroundColor White
Write-Host "-------------------------------------------" -ForegroundColor Green
