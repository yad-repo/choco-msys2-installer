$ErrorActionPreference = 'Stop';

$packageName= 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://repo.msys2.org/distrib/i686/msys2-i686-20160921.exe'
$url64 = 'http://repo.msys2.org/distrib/x86_64/msys2-x86_64-20160921.exe'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'MSYS2 *'
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  
  # Checksums can be found here: http://www.msys2.org/
  checksum      = '5bbcec0925d6e0a0b870287fbe2de87e42be968c4e17937848b52402df1d1f28'
  checksumType  = 'sha256'
  checksum64    = '5630197faf072b382bb1b0147b2fd2462f0fad49af42436eeb7bbd4e31b28d67'
  checksumType64= 'sha256'

  # WARNING: Installer seems to get stuck on "SHOW FINISHED PAGE" page when you use -v (verbose)
  silentArgs    = "--script `"$toolsDir\msys2install.qs`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
