@echo off
setlocal

:: TITLE
title RetailSmart AI System Starter
color 0B
echo ========================================================
echo   STARE RETAIL AI ANALYTICS SYSTEM - STARTER
echo ========================================================
echo.

:: STEP 0: INITIALIZE DATABASE
echo [1/3] Initializing MySQL Neural Data...
echo Loading schema and seeding databases (root:Root@123)...
mysql -u root -pRoot@123 < e:\retailsss\database\schema.sql
mysql -u root -pRoot@123 < e:\retailsss\database\seed.sql

:: STEP 1: START BACKEND (PORT 8080)
echo [2/3] Starting Golang Backend API on Port 8080...
start "Retail Backend (Port 8080)" cmd /k "cd /d e:\retailsss\database\backend && go run main.go"

:: WAIT FOR BACKEND TO BIND TO PORT
timeout /t 5 /nobreak > nul

:: STEP 2: START FRONTEND (PORT 3005)
echo [3/3] Starting React Frontend Dashboard on Port 3005...
start "Retail Frontend (Port 3005)" cmd /k "cd /d e:\retailsss\frontend && set PORT=3005&& set HOST=0.0.0.0&& npm start"

echo.
echo ========================================================
echo   RetailSmart AI System is launching!
echo   - Backend API: http://localhost:8080
echo   - Web Dashboard: http://localhost:3005
echo.
echo   * Dedicated Port 3005 (Does not collide with Hire AI on 5173/8000)
echo ========================================================
echo.
pause
