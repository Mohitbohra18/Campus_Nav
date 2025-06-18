# CAMPUSNAV-AI

Smart Campus Navigation System for Graphic Era Hill University

---

## 🚀 Project Overview
CAMPUSNAV-AI is a full-stack, AI-powered navigation platform designed to help students, faculty, and visitors easily find their way around the Graphic Era Hill University campus. It combines interactive maps, intelligent chatbot assistance, and real-time routing to deliver a seamless campus experience.

## ✨ Features
- **Interactive Maps**: Navigate inside and outside campus with real-time route guidance
- **AI Chatbot**: Instantly answers queries about classroom and facility locations using NLP
- **Quick Search**: Find any room, lab, or office by name or code
- **Mobile Responsive**: Works on all devices
- **RESTful APIs**: Modular backend for easy integration and extension
- **Admin-Friendly**: Easily update campus data via database

## 🏗️ Architecture
- **Frontend**: HTML5, CSS3, JavaScript, modern UI/UX, responsive design
- **Backend**: Spring Boot (Java), REST APIs, business logic, security
- **Chatbot**: Python (Flask), NLP, MySQL integration, REST API bridge
- **Database**: MySQL (XAMPP), all campus data in normalized tables

```
[User]
   │
   ▼
[Frontend (HTML/CSS/JS)]
   │
   ▼
[Spring Boot REST API] <───> [Python Chatbot API (Flask)]
   │
   ▼
[MySQL Database]
```

## 🛠️ Tech Stack
- **Frontend**: HTML5, CSS3, JavaScript, Font Awesome, Animate.css
- **Backend**: Java, Spring Boot, REST APIs
- **Chatbot**: Python, Flask, Flask-CORS, MySQL Connector, NLP
- **Database**: MySQL (XAMPP)
- **Maps**: OpenStreetMap, Leaflet.js, Geolocation API

## 📦 Project Structure
```
campus/
├── src/main/java/com/campusnav/...
├── src/main/java/com/campusnavai/campus/...
├── src/main/resources/static/
│   ├── index.html, about-us.html, ...
│   ├── css/
│   ├── js/
│   └── images/
├── chatbot_api.py
├── requirements.txt
├── database_setup.sql
├── ...
```

## ⚡ Setup & Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/campusnav-ai.git
   cd campusnav-ai
   ```
2. **Install Python dependencies**
   ```bash
   pip install -r requirements.txt
   ```
3. **Set up MySQL database**
   - Start XAMPP and MySQL
   - Create a database `campus_navigation`
   - Import `database_setup.sql` (and other .sql files if present) via phpMyAdmin
4. **Start the Python Chatbot API**
   ```bash
   python chatbot_api.py
   ```
5. **Start the Spring Boot backend**
   ```bash
   mvnd spring-boot:run
   # or
   mvn spring-boot:run
   ```
6. **Open the app in your browser**
   - [http://localhost:8080/](http://localhost:8080/)

## 💬 Usage
- Use the navigation cards to explore inside/outside navigation or ask the bot
- Try queries like "Where is CR 101?", "How do I reach Lab2?", etc.
- The chatbot will answer using real campus data

## 👥 Contribution
- Fork the repo, create a branch, and submit a pull request
- Please update documentation for any major changes

## 📝 License
MIT License

## 🙏 Credits
- Project by Sonali, Kunal Khati, Krishna Choudhary, Vipul
- Special thanks to faculty and contributors at Graphic Era Hill University

---

**For detailed local setup and team technical overview, see `LOCAL_SETUP.md` and `TEAM_TECHNICAL_OVERVIEW.md`.** 