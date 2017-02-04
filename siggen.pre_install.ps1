function unzip($file, $outdir) {
	& 7z x "-o$outdir" $file
	Remove-Item $file
}
unzip "$dir\CLRInsideOut2008_01.exe" "$dir\tmp" 
unzip "$dir\tmp\CLRINS~1.EXE" "$dir"
