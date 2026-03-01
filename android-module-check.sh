#!/bin/bash
# A simple script to check Android module loading status
# Used for testing LSPosed and Magisk module management

echo "=== Android Module Check Script ==="
echo "Checking for connected device..."

if ! adb devices | grep -q "device$"; then
    echo "Error: No Android device connected via ADB."
    exit 1
fi

echo "Checking Magisk/LSPosed module status..."
adb shell su -c "ls -la /data/adb/modules/"

echo "Checking LSPosed log entries..."
adb logcat -d | grep -i "lsposed" | tail -10
