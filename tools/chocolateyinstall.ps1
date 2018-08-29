$ErrorActionPreference = 'Stop';

$packageName= 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://repo.msys2.org/distrib/i686/msys2-i686-20180531.exe'
$url64 = 'http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20180531.exe'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'MSYS2 *'
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  # Checksums can be found here: http://www.msys2.org/
  checksum      = '27da9bf74614f3a07be6151e4d7d702e54bd6443649d387912676ab150d859a1'
  checksumType  = 'sha256'
  checksum64    = '3b233de38cb0393b40617654409369e025b5e6262d3ad60dbd6be33b4eeb8e7b'
  checksumType64= 'sha256'

  # WARNING: Installer seems to get stuck on "SHOW FINISHED PAGE" page when you use -v (verbose)
  silentArgs    = "--script `"$toolsDir\msys2install.qs`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
