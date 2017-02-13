function RunInstaller($exe, $arguments) {
    Write-Host "Executing $exe $arguments"
    Start-Process $exe arguments -Wait
    Remove-Item $exe
}
