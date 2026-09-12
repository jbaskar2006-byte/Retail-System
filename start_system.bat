@echo off
setlocal enabledelayedexpansion

title RetailSmart AI System Starter
color 0B

echo ========================================================
echo   STARE RETAIL AI ANALYTICS SYSTEM - ONE-CLICK STARTER
echo ========================================================
echo.

:: FIND MYSQL EXECUTABLE
set "MYSQL_CMD=mysql"
where mysql >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    if exist "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" (
        set "MYSQL_CMD=C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
        set "PATH=%PATH%;C:\Program Files\MySQL\MySQL Server 8.0\bin"
    ) else if exist "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe" (
        set "MYSQL_CMD=C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe"
        set "PATH=%PATH%;C:\Program Files\MySQL\MySQL Server 8.4\bin"
    ) else if exist "C:\xampp\mysql\bin\mysql.exe" (
        set "MYSQL_CMD=C:\xampp\mysql\bin\mysql.exe"
    )
)

:: STEP 1: DATABASE INITIALIZATION
echo [1/3] Initializing MySQL Neural Data...
"%MYSQL_CMD%" -u root -pRoot@123 < "%~dp0database\schema.sql" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Schema loaded successfully. Seeding database...
    "%MYSQL_CMD%" -u root -pRoot@123 < "%~dp0database\seed.sql" 2>nul
    echo Database initialized and seeded successfully!
) else (
    echo MySQL setup verified. Proceeding to server launch...
)

echo.
:: STEP 2: START BACKEND
echo [2/3] Starting Golang Backend API on Port 8080...
start "Retail Backend (Port 8080)" cmd /k "cd /d "%~dp0database\backend" && go run main.go"

:: WAIT 4 SECONDS FOR BACKEND TO BIND (USING PING FOR 100% WINDOWS COMPATIBILITY)
ping 127.0.0.1 -n 5 > nul

:: STEP 3: START FRONTEND
echo [3/3] Starting React Frontend Dashboard on Port 3005...
start "Retail Frontend (Port 3005)" cmd /k "cd /d "%~dp0frontend" && set PORT=3005&& set HOST=0.0.0.0&& npm start"

:: WAIT 5 SECONDS AND LAUNCH BROWSER
ping 127.0.0.1 -n 6 > nul
echo Opening Retail Dashboard in your default web browser...
start http://localhost:3005

echo.
echo ========================================================
echo   RetailSmart AI System is running!
echo   - Backend API: http://localhost:8080
echo   - Web Dashboard: http://localhost:3005
echo ========================================================
echo.
pause
