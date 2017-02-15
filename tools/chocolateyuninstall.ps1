$ErrorActionPreference = 'Stop';

$packageName = 'msys2-installer'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$softwareName = 'MSYS2 *'
$installerType = 'exe'

# Note: We are not using --platform minimal as the uninstallation could get stuck on Corrupt_Installation_Error message box
$silentArgs = "--script `"$toolsDir\msys2uninstall.js`""
$validExitCodes = @(0)

$uninstalled = $false

# Note: During testing the following statement was returing array with empty element. 
# This needs further investigation. Let's stick to direct registry access for now. 
#[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

[array]$key = Get-ItemProperty  -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                       'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                       'HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                       'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                                -ErrorAction:SilentlyContinue `
  | Where-Object   {$_.DisplayName -like $softwareName}

$key `
| ForEach-Object {
  Uninstall-ChocolateyPackage -PackageName "$packageName" `
                             -FileType "$installerType" `
                             -SilentArgs "$($silentArgs)" `
                             -File "$($_.UninstallString)" `
                             -ValidExitCodes $validExitCodes}
