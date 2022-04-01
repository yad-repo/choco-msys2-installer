# choco-msys2-installer

[MSYS2](http://www.msys2.org/) is a Cygwin-derived software distro for Windows that uses Arch Linux's Pacman package manager.

[msys2-installer](https://chocolatey.org/packages/msys2-installer/) (this repo) is Chocolatey package that performs an unattended installation of MSYS2 using the official .exe installer.

## Testing

```shell
# Create .nupkg
choco pack msys2-installer.nuspec
# Install package locally
choco install msys2-installer -y -fdv -s .
# Uninstall package locally
choco uninstall -y -fdv msys2-installer
```

## Known issues

 - Running [choco](https://docs.chocolatey.org/en-us/choco/) from MSYS2 launchers (Mintty terminal)
   - Some Windows console programs behave unpredictably and you might notice that CTRL+C handler does not work as expected or seemingly random exception is thrown
   - Try using [Windows Terminal](https://www.msys2.org/docs/terminals/) or [winpty](https://packages.msys2.org/package/winpty)
