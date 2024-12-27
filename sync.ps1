$RepoPath = "C:\Users\Ian\OneDrive\reznov\reznov"


if (-Not (Test-Path -Path $RepoPath)) {
    Write-Host "Repository path not found! Exiting."
    exit 1
}
Set-Location -Path $RepoPath


git stash


try {
    git pull origin main
} catch {
    Write-Host "Git pull failed!"
}


try {
    git stash pop
} catch {
    Write-Host "No changes to unstash."
}


$CommitMessage = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
git add .
try {
    git commit -m $CommitMessage
} catch {
    Write-Host "Nothing to commit."
}


try {
    git push origin main
} catch {
    Write-Host "Git push failed!"
}
