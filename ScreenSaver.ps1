### Screen Saver File ####
# Replace only the file name within the "" #

$ScreenSaver = ".\ScreensaverLDC.scr"

### Copy Process ###

Copy-Item $ScreenSaver "C:\windows\SysWOW64"


### Set Screensaver ###

Start-Transcript -Path "C:\temp\Screensaver-Registry.log"

$registryPath = "HKCU:\Control Panel\Desktop"
$Name = "SCRNSAVE.EXE"
$value = "C:\Windows\SysWOW64\$ScreenSaver"  #Replace the * with the file name

IF(!(Test-Path $registryPath))
{
New-Item -Path $registryPath -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}

ELSE {

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}

 
### Set Screensaver Timeout ###

$registryPath = "HKCU:\Control Panel\Desktop"
$Name = "ScreenSaveTimeOut"
$value = "300" #Change value to time-out preference

IF(!(Test-Path $registryPath))
{
New-Item -Path $registryPath -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}

ELSE {

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}

### Secure Screensaver ###

$registryPath = "HKCU:\Control Panel\Desktop"
$Name = "ScreenSaverIsSecure"
$value = "1"

IF(!(Test-Path $registryPath))
{
New-Item -Path $registryPath -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}

ELSE {

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}



### Activate Screensaver ###

$registryPath = "HKCU:\Control Panel\Desktop"
$Name = "ScreenSaveActive"
$value = "1"

IF(!(Test-Path $registryPath))
{
New-Item -Path $registryPath -Force | Out-Null
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}

ELSE {

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType STRING -Force | Out-Null}


Stop-Transcript