# 🚀 Quick Start Guide - Campus Navigation Chatbot

## Prerequisites Check

1. **Python 3.7+**: `python --version`
2. **Java 8+**: `java -version`
3. **Maven Daemon (mvnd)**: `mvnd --version`
4. **XAMPP**: Make sure MySQL is running

## Step 1: Setup Database & Dependencies

```bash
python setup_chatbot.py
```

This will:
- ✅ Install Python dependencies
- ✅ Test database connection
- ✅ Create classroom_locations table
- ✅ Insert sample data

## Step 2: Start Services

### Option A: Use Batch File (Windows)
```bash
start_chatbot.bat
```

### Option B: Manual Start
```bash
# Terminal 1: Start Python API
python chatbot_api.py

# Terminal 2: Start Spring Boot (using Maven Daemon)
mvnd spring-boot:run
```

## Step 3: Test Everything

```bash
python test_chatbot.py
```

## Step 4: Access Chatbot

Open: http://localhost:8080/ask-the-bot.html

## 🧪 Test Queries

- "Where is LT 201?"
- "Tell me about CR 101"
- "How do I reach LAB 102?"

## 🔧 Troubleshooting

### Maven Daemon Not Found Error
**Solution**: Install Maven Daemon or use regular Maven
```bash
# ✅ Using Maven Daemon (faster): mvnd spring-boot:run
# ✅ Using regular Maven: mvn spring-boot:run
# ✅ Using Maven wrapper: mvnw.cmd spring-boot:run
```

### Database Connection Failed
1. Start XAMPP Control Panel
2. Start MySQL service
3. Create database `campus_navigation` in phpMyAdmin

### Python API Not Starting
1. Install dependencies: `pip install -r requirements.txt`
2. Check if port 5000 is available
3. Verify Python version: `python --version`

### Spring Boot Not Starting
1. Use Maven Daemon: `mvnd spring-boot:run`
2. Check if port 8080 is available
3. Verify Java is installed: `java -version`

## 📞 Need Help?

1. Run the setup script: `python setup_chatbot.py`
2. Check the logs in both terminal windows
3. Verify all services are running on correct ports
4. Test database connectivity in phpMyAdmin 