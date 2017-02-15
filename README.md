# choco-msys2-installer
[![AppVeyor status](https://ci.appveyor.com/api/projects/status/github/yad-repo/choco-msys2-installer?branch=master&svg=true)](https://ci.appveyor.com/project/yad-repo/choco-msys2-installer)

MSYS2 is a Cygwin-derived software distro for Windows that uses Arch Linux's Pacman. 
This lightweight package performs an unattended installation of MSYS2 using official installer. 

## Testing

```shell
# Create .nupkg
cpack
# Install package locally
choco install msys2-installer -y -fdv -s .
# Uninstall package locally
choco uninstall -y -fdv msys2-installer
```

## Known issues

 - Running `choco` from MSYS2 bash (when on PATH)
  - In certain situations you might experience exception `Item has already been added. Key in dictionary: 'TMP'  Key being added: 'tmp'` or notice that CTRL+C handler does not work as expected
  - Typical workaround is to use `winpty`, e.g. `pacman -S --noconfirm --needed winpty && winpty choco install msys2-installer`
