$ErrorActionPreference = 'Stop';

$packageName= 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://repo.msys2.org/distrib/i686/msys2-i686-20150916.exe'
$url64 = 'http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20150916.exe'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'MSYS2 *'
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  # Checksums can be found here: http://www.msys2.org/
  checksum      = '5282b05da1424f0b500eea85d92155ee7fe70050a30f0274d388fcf3deed81ec'
  checksumType  = 'sha256'
  checksum64    = '684c604895bd4f612912c29e06b88bbda23ee9feec72ec5ec434e8d8e1456879'
  checksumType64= 'sha256'

  # WARNING: Installer seems to get stuck on "SHOW FINISHED PAGE" page when you use -v (verbose)
  silentArgs    = "--script `"$toolsDir\msys2install.qs`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
