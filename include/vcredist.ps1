#include installer.ps1

function InstallVcredist {
    '86', '64' | % {
        $a = $_
        '_', '.' | % {
            $f = "$dir\vcredist$_x$a.exe"
            if (Test-Path $f) {
                RunInstaller $f '/q /norestart'
            }
        }
    }
}
