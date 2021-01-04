clear host
#
# Script will prevent screen lock and sleep.
# Works by pressing "F15" every 60 minutes.
# 
# Copied from https://cloudrun.co.uk/powershell/how-to-keep-your-screen-alive-or-pc-from-going-to-sleep-during-presentations/

$opt = (Get-Host).PrivateData
$opt.WarningBackgroundColor = "DarkCyan"
$opt.WarningForegroundColor = "white"

write-warning "Your PC will not go to sleep whilst this window is open..."
Do {
[void][System.Reflection.Assembly]::LoadWithPartialName(‘System.Windows.Forms’)
[System.Windows.Forms.SendKeys]::SendWait(“{F15}”)

Start-Sleep -Seconds 30

} While ($true)
