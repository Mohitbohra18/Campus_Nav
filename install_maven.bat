@echo off
echo ========================================
echo    MAVEN INSTALLATION GUIDE
echo ========================================
echo.

echo Maven is not installed on your system.
echo.
echo To install Maven:
echo.
echo 1. Download Maven from: https://maven.apache.org/download.cgi
echo    (Download the Binary zip archive)
echo.
echo 2. Extract to C:\Program Files\Apache\maven
echo.
echo 3. Add to PATH:
echo    - Open System Properties
echo    - Click "Environment Variables"
echo    - Edit "Path" variable
echo    - Add: C:\Program Files\Apache\maven\bin
echo.
echo 4. Restart your command prompt
echo.
echo OR use the Maven wrapper (recommended):
echo    mvnw.cmd spring-boot:run
echo.
pause 