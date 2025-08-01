Set-StrictMode -Version 3.0
$ErrorActionPreference = "Stop"

$path = "$env:USERPROFILE\workspace"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

# Disable notifications
# Turns off "Get notifications from apps and other senders"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name ToastEnabled -Value 0 -Type DWord -Force

# Disable focus assist notifications
New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Force | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK -Value 0 -Type DWord

# Disable tips and suggestions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-310093Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Value 0 -Type DWord -Force

# Remove weather and search from taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name ShellFeedsTaskbarViewMode -Value 2 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name SearchboxTaskbarMode -Value 0 -Type DWord

# Hide Copilot
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCopilotButton" -Value 0 -Type DWord

# Restart Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Process explorer.exe

Write-Host "System preferences updated."
