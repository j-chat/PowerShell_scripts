#this script disables hyper-v if it is enabled 
#hyper-v role is enabled on Windows 10 Enterprise, Windows 10 Professional, Windows 10 Education


if((Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online).State -eq "Enabled") {
  Write-Host "Hyper-V is enabled."
	Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
	Write-Host "Hyper-V is now disabled."
}
