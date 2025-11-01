@echo off
title Tamrinat (در خانه)
cls
echo ===============================
echo   تمرینات (در خانه)
echo ===============================
echo.

:: ============================
:: Tamrin 1 - زوج یا فرد بودن اعداد
:: ============================
echo [تمرين 1] تشخيص زوج يا فرد بودن اعداد 1 تا 10
setlocal enabledelayedexpansion
for /L %%i in (1,1,10) do (
    set /a r=%%i %% 2
    if !r! EQU 0 (
        echo %%i = زوج
    ) else (
        echo %%i = فرد
    )
)
endlocal
echo.
pause

:: ============================
:: Tamrin 2 - بررسی وجود فایل و کپی آن
:: ============================
echo [تمرين 2] بررسي وجود report.txt و کپي آن در Backup
if exist "report.txt" (
    if not exist "Backup" mkdir "Backup"
    copy /Y "report.txt" "Backup\" >nul
    echo report.txt به پوشه Backup کپي شد.
) else (
    echo فايل report.txt پيدا نشد.
)
echo.
pause

:: ============================
:: Tamrin 3 - حذف فايل‌هاي خالي
:: ============================
echo [تمرين 3] حذف فايل‌هاي خالي txt در پوشه جاري
for %%f in (*.txt) do (
    if %%~zf EQU 0 (
        echo حذف: %%f
        del /Q "%%f"
    )
)
echo.
pause

:: ============================
:: Tamrin 4 - کپي فايل‌هاي جديدتر از تاريخ مشخص
:: ============================
echo [تمرين 4] کپي فايل‌هاي txt جديدتر از تاريخ مشخص به پوشه Backup
if not exist "Backup" mkdir "Backup"
set "TARGET_DATE=2025-01-01"
forfiles /M *.txt /D +%TARGET_DATE% /C "cmd /c copy /Y @path Backup\ >nul & echo کپي شد: @file"
echo.
pause

:: ============================
:: Tamrin 5 - شمارش تعداد فايل‌هاي txt
:: ============================
echo [تمرين 5] شمارش تعداد فايل‌هاي txt و نمايش پيام
setlocal enabledelayedexpansion
set /a count=0
for %%f in (*.txt) do set /a count+=1

if !count! EQU 0 (
    echo هيچ فايل .txt در اين پوشه نيست.
) else (
    echo تعداد فايل‌هاي .txt: !count!
)
endlocal
echo.
pause

echo ===============================
echo   پايان تمرينات
echo ===============================
pause
exit
