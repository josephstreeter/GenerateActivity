clear host
#
# Script will prevent screen lock and sleep.
# Works by pressing "F15" every 60 minutes.
#

$opt = (Get-Host).PrivateData
$opt.WarningBackgroundColor = "DarkCyan"
$opt.WarningForegroundColor = "white"

write-warning "Your PC will not go to sleep whilst this window is open..."
Do {
[void][System.Reflection.Assembly]::LoadWithPartialName(‘System.Windows.Forms’)
[System.Windows.Forms.SendKeys]::SendWait(“{F15}”)

Start-Sleep -Seconds 30

} While ($true)
