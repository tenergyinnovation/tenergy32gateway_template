#!/bin/bash
# This script clones a git repository
echo "Cloning repositories..."
# Check if the git command is available
if ! command -v git &> /dev/null
then
    echo "git could not be found. Please install git to proceed."
    exit 1
fi
# Check if the target directory exists, if not create it
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
fi
# Change to the target directory

# Define the repository URL
REPO_URL1="https://github.com/tenergyinnovation/tenergy32gateway.git"
REPO_URL2="https://github.com/adafruit/Adafruit_SSD1306.git"
REPO_URL3="https://github.com/sandeepmistry/arduino-LoRa.git"
REPO_URL4="https://github.com/adafruit/Adafruit_BusIO.git"
REPO_URL5="https://github.com/adafruit/Adafruit_Sensor.git" 
REPO_URL6="https://github.com/adafruit/RTClib.git"
REPO_URL7="https://github.com/johnrickman/LiquidCrystal_I2C.git"
REPO_URL8="https://github.com/adafruit/Adafruit_SSD1306.git"
REPO_URL9="https://github.com/adafruit/Adafruit-GFX-Library.git"

# Define the target directory (optional)
TARGET_DIR="repository"

# Clone the repository
git clone $REPO_URL1
git clone $REPO_URL2
git clone $REPO_URL3
git clone $REPO_URL4
git clone $REPO_URL5
git clone $REPO_URL6
git clone $REPO_URL7
git clone $REPO_URL8
git clone $REPO_URL9

echo "Repositories cloned successfully."
cd "$TARGET_DIR" || exit
# Change to the target directory
cd "$TARGET_DIR" || exit
# List the contents of the target directory
ls -l
# List the contents of the target directory
ls -l
# List the contents of the target directory


