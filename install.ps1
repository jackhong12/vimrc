# A script to install vim pulgins.

function run {
    param(
        [string]$command,
        [Parameter(ValueFromRemainingArguments=$true)]$args
    )

    Write-Host "[RUN] > $command $($args -join ' ')" -ForegroundColor Cyan
    & $command @args

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Command failed" -ForegroundColor Red
        exit 1
    }
}

# Install vim
winget list --id vim.vim > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    run winget install vim.vim
}
$vim = (Get-ChildItem "C:\Program Files" -Recurse -Filter vim.exe -ErrorAction SilentlyContinue | Select-Object -First 1).FullName
Write-Host "[INFO] vim path: $vim"

# Install vim plugin manager
if (-not(Test-Path $HOME\vimfiles\bundle\Vundle.vim\.git)) {
    run git clone https://github.com/VundleVim/Vundle.vim.git $HOME\vimfiles\bundle\Vundle.vim
}

# Create folder
if (-not(Test-Path "$HOME\.cache")) {
    run mkdir "$HOME\.cache"
}
if (-not(Test-Path "$HOME\.cache\vim")) {
    run mkdir "$HOME\.cache\vim"
}
if (-not(Test-Path "$HOME\.cache\vim\backup")) {
    run mkdir "$HOME\.cache\vim\backup"
}
if (-not(Test-Path "$HOME\.cache\vim\swap")) {
    run mkdir "$HOME\.cache\vim\swap"
}
if (-not(Test-Path "$HOME\.cache\vim\undo")) {
    run mkdir "$HOME\.cache\vim\undo"
}

# Copy color scheme
run cp colors/molokai.vim "$HOME\vimfiles\colors"

run cp windows.vimrc "$HOME/_vimrc"
run vim +PluginInstall +qall