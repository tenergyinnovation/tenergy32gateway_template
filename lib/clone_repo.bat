@echo off
REM This script clones multiple git repositories

echo Cloning repositories...

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Git is not installed. Please install Git to proceed.
    exit /b 1
)

REM Define the repository URLs
set REPO_URL1=https://github.com/tenergyinnovation/tenergy32hub.git
set REPO_URL2=https://github.com/adafruit/Adafruit_SSD1306.git
set REPO_URL3=https://github.com/sandeepmistry/arduino-LoRa.git
set REPO_URL4=https://github.com/adafruit/Adafruit_BusIO.git
set REPO_URL5=https://github.com/adafruit/Adafruit_Sensor.git
set REPO_URL6=https://github.com/adafruit/RTClib.git
set REPO_URL7=https://github.com/johnrickman/LiquidCrystal_I2C.git
set REPO_URL8=https://github.com/adafruit/Adafruit_SSD1306.git
set REPO_URL9=https://github.com/adafruit/Adafruit-GFX-Library.git

REM Define the target directory (optional)
set TARGET_DIR=repository

REM Create the target directory if it doesn't exist
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

REM Change to the target directory
cd "%TARGET_DIR%"

REM Clone the repositories
git clone %REPO_URL1%
git clone %REPO_URL2%
git clone %REPO_URL3%
git clone %REPO_URL4%
git clone %REPO_URL5%
git clone %REPO_URL6%
git clone %REPO_URL7%
git clone %REPO_URL8%
git clone %REPO_URL9%

REM List the contents of the target directory
echo Listing contents of the target directory:
dir /b

echo All repositories have been cloned successfully.
pause