@echo off
setlocal
set "html_file=%temp%\bsod_chrome.html"

:: Écriture du code HTML épuré (sans détection de la touche Échap)
(
echo ^<!DOCTYPE html^>^<html^>^<head^>^<title^>Windows^</title^>^<meta charset="UTF-8"^>^<style^>
echo body { background-color: #0078d7; color: white; font-family: 'Segoe UI', -apple-system, sans-serif; margin: 0; padding: 0; height: 100vh; display: flex; flex-direction: column; justify-content: center; padding-left: 10%%; overflow: hidden; user-select: none; cursor: none; }
echo .sad-face { font-size: 140px; margin-bottom: 20px; font-weight: 300; }
echo .main-text { font-size: 32px; line-height: 1.4; max-width: 900px; margin-bottom: 40px; font-weight: 300; }
echo .percentage { font-size: 32px; font-weight: 300; }
echo ^</style^>^</head^>^<body^>
echo ^<div class="sad-face"^>:(^</div^>
echo ^<div class="main-text"^>Your PC ran into a problem and needs to restart. We're just collecting some error info, and then we'll restart for you.^</div^>
echo ^<div class="percentage"^>^<span id="count"^>0^</span^>%% complete^</div^>
echo ^<script^>
echo let count = 0;
echo function updateCounter^(^) {
echo     if ^(count ^< 100^) {
echo         count += Math.floor^(Math.random^(^) * 3^) + 1;
echo         if ^(count ^> 100^) count = 100;
echo         document.getElementById^('count'^).innerText = count;
echo         setTimeout^(updateCounter, Math.random^(^) * 800 + 400^);
echo     }
echo }
echo window.onload = function^(^) { setTimeout^(updateCounter, 1000^); };
echo ^</script^>^</body^>^</html^>
) > "%html_file%"

:: Mode "Kiosk" Google Chrome : bloque la souris, masque la barre du haut (pas de croix) et ignore F11/Échap
start "" chrome --kiosk "file:///%html_file%"

:: Nettoyage
timeout /t 2 >nul
del "%html_file%"
exit