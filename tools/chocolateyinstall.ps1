$ErrorActionPreference = 'Stop';

$packageName= 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://repo.msys2.org/distrib/i686/msys2-i686-20161025.exe'
$url64 = 'http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20161025.exe'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'MSYS2 *'
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  # Checksums can be found here: http://www.msys2.org/
  checksum      = '4951a47177777a54c7ad4ac99755ba4bbdf1a0cb23a174a72d91f71dc25bcb15'
  checksumType  = 'sha256'
  checksum64    = '2c198787ea1c4be39ff80466c4d831f8c7f06bd56d6d190bf63ede35292e344c'
  checksumType64= 'sha256'

  # WARNING: Installer seems to get stuck on "SHOW FINISHED PAGE" page when you use -v (verbose)
  silentArgs    = "--script `"$toolsDir\msys2install.qs`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
