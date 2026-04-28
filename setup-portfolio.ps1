# Cybersecurity Portfolio Setup Script
# Run from PowerShell after reviewing the variables at the top.

$ErrorActionPreference = "Stop"

# === EDIT THESE ===
$GitHubUser   = "<your-github-username>"
$RepoName     = "cybersecurity-portfolio"
$TargetPath   = "D:\GitHub\cybersecurity-portfolio"
$SourcePath   = "D:\GitHub\Claude_Management\cybersecurity-portfolio"
$AuthorName   = "Markus Dachroeden-Walker"
$AuthorEmail  = "markusdachroeden@gmail.com"
# ==================

# Move folder to target if different
if ($SourcePath -ne $TargetPath -and -not (Test-Path $TargetPath)) {
    Write-Host "Moving $SourcePath to $TargetPath"
    Move-Item -Path $SourcePath -Destination $TargetPath
}

Set-Location $TargetPath

# Initialise repo if not already a repo
if (-not (Test-Path ".git")) {
    git init -b main
    git config user.name  $AuthorName
    git config user.email $AuthorEmail
}

git add .
git commit -m "Initial commit: cybersecurity portfolio scaffolded from Quartz"

# Add remote and push
$RemoteUrl = "https://github.com/$GitHubUser/$RepoName.git"

if (-not (git remote)) {
    git remote add origin $RemoteUrl
} else {
    git remote set-url origin $RemoteUrl
}

git push -u origin main

Write-Host ""
Write-Host "Done. Now go to https://github.com/$GitHubUser/$RepoName/settings/pages and set Source to GitHub Actions."
