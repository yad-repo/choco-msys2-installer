$ErrorActionPreference = 'Stop';

$packageName= 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://repo.msys2.org/distrib/x86_64/msys2-x86_64-20220319.exe'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'MSYS2 *'
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  # Checksum from http://www.msys2.org/
  checksum64    = 'bd7cac636c1bf3a1821b9694ba3f49a92a6de1458d0ccc78f36338a393892e71'
  checksumType64= 'sha256'
  silentArgs    = "--script `"$toolsDir\auto-install.qs`" --verbose"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
