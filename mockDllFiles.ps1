# "%LOCALAPPDATA%\Programs\Fiddler Everywhere\resources\app\out\WebServer\Fiddler.WebUi.dll
# "%LOCALAPPDATA%\Programs\Fiddler Everywhere\resources\app\out\WebServer\FiddlerBackendSDK.dll

if (-not (Test-Path "Fiddler.WebUi.dll") -or -not (Test-Path "FiddlerBackendSDK.dll")) {
    [System.Windows.Forms.MessageBox]::Show("Fiddler.WebUi.dll or FiddlerBackendSDK.dll are missing in the current directory.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit 1
}
Write-Host "[*] Fiddler.WebUi.dll and FiddlerBackendSDK.dll already!"

# "%LOCALAPPDATA%\Programs\Fiddler Everywhere\resources\app\out\WebServer\Fiddler.WebUi.dll 使用当前文件夹下的 Fiddler.WebUi.dll 文件覆盖
$originFiddlerWebUiFullPath = "$(cmd /c echo %LOCALAPPDATA%)\Programs\Fiddler Everywhere\resources\app\out\WebServer\Fiddler.WebUi.dll"
$mockFiddlerWebUiFullPath = Get-ChildItem -Path . -Filter "Fiddler.WebUi.dll" | Select-Object -ExpandProperty FullName
Copy-Item -Path $mockFiddlerWebUiFullPath -Destination $originFiddlerWebUiFullPath -Force
Write-Host "[*] mock $originFiddlerWebUiFullPath content with content of $mockFiddlerWebUiFullPath"

# "%LOCALAPPDATA%\Programs\Fiddler Everywhere\resources\app\out\WebServer\FiddlerBackendSDK.dll 使用当前文件夹下的 FiddlerBackendSDK.dll 文件覆盖
$originFiddlerBackendSDKFullPath = "$(cmd /c echo %LOCALAPPDATA%)\Programs\Fiddler Everywhere\resources\app\out\WebServer\FiddlerBackendSDK.dll"
$mockFiddlerBackendSDKFullPath = Get-ChildItem -Path . -Filter "FiddlerBackendSDK.dll" | Select-Object -ExpandProperty FullName
Copy-Item -Path $mockFiddlerBackendSDKFullPath -Destination $originFiddlerBackendSDKFullPath -Force
Write-Host "[*] mock $originFiddlerBackendSDKFullPath content with content of $mockFiddlerBackendSDKFullPath"

pause