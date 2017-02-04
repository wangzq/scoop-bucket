[CmdletBinding()]
param (
	[string] $Name
	)
if (!$Name) {
    dir "$PsScriptRoot\*.json" | % { [IO.Path]::GetFileNameWithoutExtension($_) }
} else {
    $preinstall = "$PsScriptRoot\$Name.pre_install.ps1"
    if (Test-Path $preinstall) {
        & "$PsScriptRoot\inject-script.ps1" "$PsScriptRoot\$Name.json" @(
            "$PsScriptRoot\common.ps1"
            $preinstall
        )
    }

    scoop uninstall $Name
    scoop install "$PsScriptRoot\$Name.json"
}
