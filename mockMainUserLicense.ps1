# "%LOCALAPPDATA%\Programs\Fiddler Everywhere\resources\app\out\WebServer\ClientApp\dist\main.xxxxxx.js(正则, xxxxxx是任意字符)

$originMainFullPath = Get-ChildItem -Path "$(cmd /c echo %LOCALAPPDATA%)\Programs\Fiddler Everywhere\resources\app\out\WebServer\ClientApp\dist" -Filter "main.*.js" | Select-Object -ExpandProperty FullName
$veDefinition = (Get-Content $originMainFullPath) | Select-String -Pattern '}updateUserLicense\(\w{1,3}\){' -AllMatches | Select-Object -ExpandProperty Matches | Select-Object -ExpandProperty Value
$ve = $veDefinition -replace '.*\((.*)\).*','$1'
(Get-Content $originMainFullPath) -replace "}updateUserLicense\($ve\)\{","}updateUserLicense($ve){$ve.licenseInfo.currentLicense=`"Pro`";$ve.licenseInfo.hasExpiredTrial=false;$ve.licenseInfo.isTrialAvailable=false;$ve.licenseInfo.hasValidLicense=true;" | Set-Content $originMainFullPath
Write-Host "[*] mock definition of updateUserLicense success!"

pause