# Campus Navigation Chatbot Integration

This document explains how to set up and use the chatbot integration for the Campus Navigation system. The chatbot can answer queries about classroom locations in the Hill Campus by fetching data from a MySQL database.

## 🏗️ Architecture Overview

The chatbot integration consists of three main components:

1. **Python Flask API** (`chatbot_api.py`) - Handles natural language processing and database queries
2. **Spring Boot Controller** (`ChatbotController.java`) - Acts as a bridge between frontend and Python API
3. **Frontend Interface** (`ask-the-bot.html`) - Modern chat interface for user interaction

## 📋 Prerequisites

- Python 3.7 or higher
- Java 8 or higher
- Maven Daemon (mvnd) or Maven
- XAMPP (for MySQL database)
- Node.js (optional, for development)

## 🚀 Quick Setup

### Step 1: Database Setup

1. **Start XAMPP**
   - Open XAMPP Control Panel
   - Start Apache and MySQL services
   - Open phpMyAdmin (http://localhost/phpmyadmin)

2. **Create Database**
   - Create a new database named `campus_navigation`
   - Or use the existing database if it already exists

### Step 2: Run Setup Script

```bash
python setup_chatbot.py
```

This script will:
- ✅ Check Python version compatibility
- 📦 Install required Python dependencies
- 🔌 Test database connection
- 🗄️ Create the `classroom_locations` table
- 📊 Insert sample classroom data

### Step 3: Start Services

1. **Start Spring Boot Application**
   ```bash
   mvnd spring-boot:run
   ```

2. **Start Python Chatbot API**
   ```bash
   python chatbot_api.py
   ```

3. **Access the Chatbot**
   - Open: http://localhost:8080/ask-the-bot.html

## 🧪 Testing the Chatbot

### Sample Queries

The chatbot can understand various query formats:

- **Direct room codes**: "Where is LT 201?"
- **Full names**: "Tell me about Lecture Theatre 201"
- **Descriptive queries**: "How do I reach Classroom 101?"
- **Building queries**: "What's in the Main Block?"

### Available Room Types

- **LT** - Lecture Theatre
- **CR** - Classroom
- **LAB** - Laboratory
- **AUD** - Auditorium
- **LIB** - Library
- **CAF** - Cafeteria
- **ADM** - Administration
- **GYM** - Gymnasium
- **MED** - Medical Room

## 📊 Database Schema

The `classroom_locations` table structure:

```sql
CREATE TABLE classroom_locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_code VARCHAR(20) NOT NULL UNIQUE,
    room_name VARCHAR(100) NOT NULL,
    building VARCHAR(50) NOT NULL,
    floor VARCHAR(10) NOT NULL,
    description TEXT,
    coordinates VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 🔧 Configuration

### Python API Configuration

Edit `chatbot_api.py` to modify database settings:

```python
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '',  # Add password if needed
    'database': 'campus_navigation',
    'port': 3306
}
```

### Spring Boot Configuration

The Spring Boot application uses the existing `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/campus_navigation
spring.datasource.username=root
spring.datasource.password=
```

## 📁 File Structure

```
campus/
├── chatbot_api.py              # Python Flask API
├── requirements.txt            # Python dependencies
├── database_setup.sql          # Database schema and sample data
├── setup_chatbot.py           # Setup script
├── src/main/java/com/campusnavai/campus/controller/
│   └── ChatbotController.java  # Spring Boot controller
├── src/main/resources/static/
│   ├── ask-the-bot.html       # Chatbot interface
│   ├── css/chatbot.css        # Chatbot styles
│   └── js/chatbot.js          # Chatbot functionality
└── CHATBOT_INTEGRATION_README.md
```

## 🔍 API Endpoints

### Python API (Port 5000)

- `POST /api/chatbot/query` - Process user queries
- `GET /api/chatbot/rooms` - Get all available rooms
- `GET /api/chatbot/health` - Health check

### Spring Boot API (Port 8080)

- `POST /api/chatbot/query` - Forward queries to Python API
- `GET /api/chatbot/rooms` - Get available rooms
- `GET /api/chatbot/health` - Check service health

## 🛠️ Troubleshooting

### Common Issues

1. **Database Connection Failed**
   - Ensure XAMPP MySQL is running
   - Check database name and credentials
   - Verify database exists in phpMyAdmin

2. **Python API Not Starting**
   - Check if port 5000 is available
   - Install dependencies: `pip install -r requirements.txt`
   - Verify Python version (3.7+)

3. **Spring Boot Connection Issues**
   - Ensure Python API is running on port 5000
   - Check CORS settings
   - Verify RestTemplate configuration

4. **Frontend Not Loading**
   - Check if Spring Boot is running on port 8080
   - Clear browser cache
   - Check browser console for errors

### Debug Mode

Enable debug logging in `application.properties`:

```properties
logging.level.com.campusnavai=DEBUG
logging.level.org.springframework.web=DEBUG
```

## 🔄 Adding New Rooms

To add new classroom locations:

1. **Via SQL**:
   ```sql
   INSERT INTO classroom_locations (room_code, room_name, building, floor, description) 
   VALUES ('NEW 001', 'New Room', 'Building Name', 'Floor', 'Description');
   ```

2. **Via Excel Import**:
   - Create Excel file with columns: room_code, room_name, building, floor, description
   - Use phpMyAdmin import feature
   - Or create a Python script to read Excel and insert data

## 🎯 Features

- ✅ Natural language processing
- ✅ Room code extraction from queries
- ✅ Contextual responses
- ✅ Real-time chat interface
- ✅ Quick action buttons
- ✅ Room directory display
- ✅ Health monitoring
- ✅ Responsive design
- ✅ Error handling

## 🔮 Future Enhancements

- [ ] Voice input/output
- [ ] Multi-language support
- [ ] Advanced NLP with machine learning
- [ ] Integration with campus maps
- [ ] Real-time navigation directions
- [ ] Room availability checking
- [ ] Event scheduling integration

## 📞 Support

For issues or questions:
1. Check the troubleshooting section
2. Review the logs in both Python and Spring Boot applications
3. Verify all services are running correctly
4. Test database connectivity separately

---

**Note**: This chatbot integration is designed to work independently without affecting the main navigation system. It can be easily enabled/disabled by starting/stopping the Python API service. 