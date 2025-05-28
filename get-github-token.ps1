# Read GitHub token from secrets.json
$secretsPath = Join-Path $PSScriptRoot "secrets.json"
if (Test-Path $secretsPath) {
    $secrets = Get-Content $secretsPath | ConvertFrom-Json
    $token = $secrets.GitHubPersonalAccessToken
    if ($token) {
        Write-Output $token
    } else {
        Write-Error "GitHub token not found in secrets.json"
    }
} else {
    Write-Error "secrets.json not found"
}
