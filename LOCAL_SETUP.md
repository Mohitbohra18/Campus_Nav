# Local Setup Guide: CAMPUSNAV-AI

## Prerequisites
- Python 3.7+
- Java 8+
- XAMPP (MySQL)
- Node.js (optional, for development)
- Git

## 1. Clone the Repository
```bash
git clone https://github.com/iamsonaliu/Campus_Navigation.git
cd Campus_Navigation
```

## 2. Install Python Dependencies
```bash
pip install -r requirements.txt
```

## 3. Install Java & Maven Daemon (if not already)
- Download Java: https://adoptopenjdk.net/
- Download Maven Daemon: https://github.com/apache/maven-mvnd

## 4. Set Up MySQL Database
- Start XAMPP and MySQL
- Open phpMyAdmin: http://localhost/phpmyadmin
- Create a database named `campus_navigation`
- Import all provided `.sql` files (e.g., `database_setup.sql`, `nodes.sql`, etc.)
  - Go to the database > Import > Choose file > Go
- (To export all tables for future use: phpMyAdmin > Export > SQL)

## 5. Start the Python Chatbot API
```bash
python chatbot_api.py
```

## 6. Start the Spring Boot Backend
```bash
mvnd spring-boot:run
# or
mvn spring-boot:run
```

## 7. Access the Application
- Open your browser: [http://localhost:8081/](http://localhost:8081/)
- Use the navigation cards or chatbot as needed

## 8. Troubleshooting
- Ensure MySQL is running and all tables are imported
- Check Python and Java versions
- If ports 5000/8081 are busy, stop other services or change the port in config

## 9. Exporting Database for Others
- In phpMyAdmin, select your database > Export > SQL > Go
- Share the SQL file with your team for easy setup

---

**For more details, see the main README and team technical overview.** 