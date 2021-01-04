# GenerateActivity
PowerShell code that will generate activity on a Windows computer to keep the screen saver from activating. Basically the 
script simulates pressing the F15 key periodically to keep the computer from appearing inactive. 

## Setup
* Download the scripts (or clone the repository using git)
  * On the repository main page click the "Code" button
  * Click "Download Zip"
  * In the "Save As" dialog box click "Save" 
* "Unblock" the Zip archive
  * Right-click the .zip file and click "Properties"
  * At the bottom of the "General" tab you should see a warning about how the file may be blocked to protect this computer
  * Click "Unblock" and click "Ok"
* Extract the files from the Zip archive to an easily accessible location

## Files
The folder that is extracted from the archive will have three files in it
* KeepAlive.bat - A Windows batch script that calls the PowerShell script
* KeepAlive.ps1 - A PowerShell script that performs the main functions
* README.md - The README document for this project

## Execution
* Open the GenerateActivity-main folder
* Double-click the KeepAlive.bat script 
* This will open a cmd prompt and execute the PowerShell script
* close the cmd prompt to stop the script

The "-ExecutionPolicy Bypass" 
switch should make sure that the computer's PowerShell Execution Policy does not 
prevent script execution. 
