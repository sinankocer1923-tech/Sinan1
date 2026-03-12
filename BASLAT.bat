@echo off
title Cince Sayilar Uygulamasi
echo.
echo =============================================
echo   Cince Sayilar ve Fiyatlar - Baslatiliyor
echo =============================================
echo.

:: Python varsa kullan
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo Python bulundu, sunucu baslatiliyor...
    start "" "http://localhost:8765"
    timeout /t 1 /nobreak >nul
    python -m http.server 8765
    goto :end
)

python3 --version >nul 2>&1
if %errorlevel% == 0 (
    echo Python3 bulundu, sunucu baslatiliyor...
    start "" "http://localhost:8765"
    timeout /t 1 /nobreak >nul
    python3 -m http.server 8765
    goto :end
)

:: Python yoksa sadece HTML dosyasini ac (PWA olmadan calisir)
echo Python bulunamadi. Uygulama normal modda aciliyor...
start "" index.html

:end
