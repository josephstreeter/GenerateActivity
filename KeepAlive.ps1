#Requires -Version 5.1

<#
.SYNOPSIS
    Prevents the screen from locking and the PC from going to sleep.

.DESCRIPTION
    This script simulates keyboard activity by sending the F15 key press at regular intervals.
    This keeps the system active without interfering with normal use, as F15 is rarely used.
    The script runs indefinitely until the PowerShell window is closed or Ctrl+C is pressed.

.NOTES
    Author: Unknown
    Source: https://cloudrun.co.uk/powershell/how-to-keep-your-screen-alive-or-pc-from-going-to-sleep-during-presentations/

.PARAMETER EndTime
    Optional. A DateTime specifying when the script should stop. If not provided, runs indefinitely.

.PARAMETER IntervalSeconds
    The interval in seconds between keep-alive signals. Default is 300 (5 minutes).

.EXAMPLE
    .\KeepAlive.ps1
    Runs the keep-alive script indefinitely with the default 5-minute interval.

.EXAMPLE
    .\KeepAlive.ps1 -EndTime "17:00"
    Runs until 5:00 PM today.

.EXAMPLE
    .\KeepAlive.ps1 -EndTime "2026-02-10 09:00" -IntervalSeconds 60
    Runs until 9:00 AM on Feb 10, 2026, with 1-minute intervals.
#>

param(
    [datetime]$EndTime,
    [int]$IntervalSeconds = 300
)

Clear-Host

$opt = (Get-Host).PrivateData
$opt.WarningBackgroundColor = "DarkCyan"
$opt.WarningForegroundColor = "white"

if ($EndTime)
{
    Write-Warning "Your PC will not go to sleep until $($EndTime.ToString('yyyy-MM-dd HH:mm:ss'))..."
}
else
{
    Write-Warning "Your PC will not go to sleep whilst this window is open..."
}

Add-Type -AssemblyName System.Windows.Forms

try
{
    do
    {
        [System.Windows.Forms.SendKeys]::SendWait("{F15}")
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Sent keep-alive signal" -ForegroundColor Green
        Start-Sleep -Seconds $IntervalSeconds
    }
    while (-not $EndTime -or (Get-Date) -lt $EndTime)
}
catch
{
    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Stack Trace: $($_.ScriptStackTrace)" -ForegroundColor DarkRed
}
finally
{
    Write-Host "KeepAlive stopped."
}
