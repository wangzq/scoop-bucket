```
Set-ExecutionPolicy RemoteSigned -s cu -force
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
scoop install git
scoop bucket known | % { scoop bucket add $_ }
scoop bucket add wangzq https://github.com/wangzq/scoop-bucket
scoop update
```

