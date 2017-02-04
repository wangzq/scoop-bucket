[CmdletBinding()]
param (
	[Parameter(Mandatory=$true)]
	[string] $JsonFile,

	[Parameter(Mandatory=$true)]
	[string] $ScriptFile,

	[string] $PropertyPath = 'pre_install'
	)
$ErrorActionPreference = 'stop'
function GetFileContent($file) {
	[IO.File]::ReadAllText($ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file))
}
$j = ConvertFrom-Json (GetFileContent $JsonFile)
$j.$PropertyPath = GetFileContent $ScriptFile
$j | ConvertTo-Json | Out-File $JsonFile -Encoding UTF8
