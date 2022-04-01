$ErrorActionPreference = 'Stop';

$packageName = 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$softwareName = 'MSYS2 *'
$installerType = 'exe'

# Note: We are not using --platform minimal as the uninstallation could get stuck on Corrupt_Installation_Error message box
$silentArgs = "--script `"$toolsDir\auto-install.qs`" --verbose"
$validExitCodes = @(0)

$uninstalled = $false

# TODO: Check if following approach would work as well
#[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

$uninstallKeys = @(
  'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
  'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
  'HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
  'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
)
[array]$keys = `
  Get-ItemProperty -Path $uninstallKeys -ErrorAction:SilentlyContinue `
  | Where-Object {
    ($_.DisplayName -like $softwareName) -and (Test-Path -Path $_.UninstallString -PathType Leaf)
  }

Write-Host $keys

$keys `
| ForEach-Object {
  Uninstall-ChocolateyPackage `
    -PackageName "$packageName" `
    -FileType "$installerType" `
    -SilentArgs "$($silentArgs)" `
    -File "$($_.UninstallString)" `
    -ValidExitCodes $validExitCodes
}
