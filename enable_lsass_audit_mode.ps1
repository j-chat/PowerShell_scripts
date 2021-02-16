#This script enables the audit mode for Lsass.exe on a single computer by editing the Registry
#If the Registry does not exist, the script will create it

#Define variables
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe"
$name = "AuditLevel"
$value = "00000008"
$propertyType = "DWORD"

	if(!(Test-Path $registryPath))
#create the registry key if it doesn't exist. Then edit registry key value
  { Write-Output "LSASS Registry path does not exist."
    New-Item -Path $registryPath -Force | Out-Null
	Write-Output "Registry path created."
    New-ItemProperty -Path $registryPath -Name $name -Value $value `
    -PropertyType $propertyType -Force | Out-Null
	Write-Output "Registry key and value created. Audit mode is enabled."
	Get-ItemProperty -Path $registryPath}
	
#Else edit registry key value
 else {
	Write-Output "LSASS Registry path exists."
    New-ItemProperty -Path $registryPath -Name $name -Value $value `
    -PropertyType $propertyType -Force | Out-Null
	Write-Output "Registry key and value edited. Audit mode is enabled."
	Get-ItemProperty -Path $registryPath}
