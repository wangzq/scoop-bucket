#include installer.ps1

function install {
    '86', '64' | % {
        RunInstaller "$dir\vcredist_x$_.exe" '/q /norestart'
    }
}
