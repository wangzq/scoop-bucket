[CmdletBinding()]
param (
	[Parameter(Mandatory=$true)]
	[string] $Name
	)

& "$PsScriptRoot\inject-script.ps1" "$PsScriptRoot\$Name.json" "$PsScriptRoot\$Name.pre_install.ps1"
scoop uninstall $Name
scoop install "$PsScriptRoot\$Name.json"
