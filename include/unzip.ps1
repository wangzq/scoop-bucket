function unzip($file, $outdir) {
    if (Test-Path $file) {
        Write-Host "Extracting $file to $outdir"
        & 7z x "-o$outdir" $file | Out-Null
        Remove-Item $file
    } else {
        Write-Warning "Unable to find $file"
    }
}
