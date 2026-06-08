@echo off
chcp 65001 >nul
cd /d "d:\fsy\99.其他\TYLM"

echo [%date% %time%] Checking for TYLM project changes...

git add .

git diff --cached --quiet
if %errorlevel% == 0 (
    echo No changes to sync.
    exit /b 0
)

git commit -m "auto-sync %date% %time%"
git push origin master

if %errorlevel% == 0 (
    echo Sync completed successfully.
) else (
    echo Sync failed.
)
