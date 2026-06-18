@echo off
:: Lancement de Firefox avec ton fichier
start "" "firefox.exe" "C:\Users\ljeune\Desktop\haha.html"

:: Attente précise de 0.5 seconde (500 millisecondes)
powershell -command "Start-Sleep -Milliseconds 500"

:: Envoi immédiat de la touche F11
powershell -command "$wshell = New-Object -ComObject WScript.Shell; $wshell.SendKeys('{F11}')"

exit