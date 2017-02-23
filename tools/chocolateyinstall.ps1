$ErrorActionPreference = 'Stop';

$packageName= 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://repo.msys2.org/distrib/i686/msys2-i686-20160205.exe'
$url64 = 'http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20160205.exe'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'MSYS2 *'
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  # Checksums can be found here: http://www.msys2.org/
  checksum      = '37ccf5bc416545079f03382633c3842a0d93a559009fc56280d6b966c1642c41'
  checksumType  = 'sha256'
  checksum64    = '3c0673086ff41776de88935d60bff4bdcd6455ab72adb47575fae49d3e671f21'
  checksumType64= 'sha256'

  # WARNING: Installer seems to get stuck on "SHOW FINISHED PAGE" page when you use -v (verbose)
  silentArgs    = "--script `"$toolsDir\msys2install.qs`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
