[CmdletBinding()]
param (
	[Parameter(Mandatory=$true)]
	[string] $JsonFile,

	[Parameter(Mandatory=$true)]
	[string[]] $ScriptFiles,

	[string] $PropertyPath = 'pre_install'
	)
function GetFileContent($files) {
    [array] $result = $files | % {
        [IO.File]::ReadAllText($ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($_))
    }
    $result -join "`n"
}
$j = ConvertFrom-Json (GetFileContent $JsonFile)
$j.$PropertyPath = GetFileContent $ScriptFiles
$j | ConvertTo-Json | Out-File $JsonFile -Encoding UTF8
