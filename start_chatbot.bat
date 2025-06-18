@echo off
echo ========================================
echo    CAMPUS NAVIGATION CHATBOT
echo ========================================
echo.

echo Starting Python Chatbot API...
start "Python Chatbot API" cmd /k "python chatbot_api.py"

echo.
echo Waiting 3 seconds for Python API to start...
timeout /t 3 /nobreak > nul

echo.
echo Starting Spring Boot Application...
start "Spring Boot App" cmd /k "mvnd spring-boot:run"

echo.
echo Services are starting...
echo.
echo Python API: http://localhost:5000
echo Spring Boot: http://localhost:8080
echo Chatbot Interface: http://localhost:8080/ask-the-bot.html
echo.
echo Press any key to open the chatbot in your browser...
pause > nul

start http://localhost:8080/ask-the-bot.html

echo.
echo Chatbot services started successfully!
echo Keep these command windows open to run the services.
echo.
pause 