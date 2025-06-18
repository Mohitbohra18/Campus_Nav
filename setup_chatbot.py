#!/usr/bin/env python3
"""
Setup script for Campus Navigation Chatbot
This script helps set up the Python dependencies and database for the chatbot.
"""

import subprocess
import sys
import os
import mysql.connector
from mysql.connector import Error

def print_banner():
    print("=" * 60)
    print("    CAMPUS NAVIGATION CHATBOT SETUP")
    print("=" * 60)
    print()

def check_python_version():
    """Check if Python version is compatible"""
    if sys.version_info < (3, 7):
        print("❌ Error: Python 3.7 or higher is required")
        print(f"Current version: {sys.version}")
        return False
    print(f"✅ Python version: {sys.version.split()[0]}")
    return True

def install_dependencies():
    """Install required Python packages"""
    print("📦 Installing Python dependencies...")
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
        print("✅ Dependencies installed successfully!")
        return True
    except subprocess.CalledProcessError as e:
        print(f"❌ Error installing dependencies: {e}")
        return False

def test_database_connection():
    """Test connection to MySQL database"""
    print("🔌 Testing database connection...")
    
    config = {
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'database': 'campus_navigation',
        'port': 3306
    }
    
    try:
        connection = mysql.connector.connect(**config)
        if connection.is_connected():
            print("✅ Database connection successful!")
            connection.close()
            return True
    except Error as e:
        print(f"❌ Database connection failed: {e}")
        print("\n📋 Please make sure:")
        print("   1. XAMPP is running")
        print("   2. MySQL service is started")
        print("   3. Database 'campus_navigation' exists")
        print("   4. User 'root' has access (no password)")
        return False

def setup_database():
    """Set up the classroom_locations table"""
    print("🗄️  Setting up database table...")
    
    config = {
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'database': 'campus_navigation',
        'port': 3306
    }
    
    try:
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()
        
        # Read and execute the SQL setup script
        with open('database_setup.sql', 'r') as file:
            sql_commands = file.read()
        
        # Split by semicolon and execute each command
        commands = sql_commands.split(';')
        for command in commands:
            command = command.strip()
            if command:
                cursor.execute(command)
        
        connection.commit()
        print("✅ Database table created successfully!")
        
        # Verify the table was created
        cursor.execute("SELECT COUNT(*) FROM classroom_locations")
        count = cursor.fetchone()[0]
        print(f"✅ Found {count} classroom records in database")
        
        cursor.close()
        connection.close()
        return True
        
    except Error as e:
        print(f"❌ Error setting up database: {e}")
        return False

def test_chatbot_api():
    """Test the chatbot API"""
    print("🤖 Testing chatbot API...")
    try:
        import requests
        response = requests.get('http://localhost:5000/api/chatbot/health', timeout=5)
        if response.status_code == 200:
            print("✅ Chatbot API is running!")
            return True
        else:
            print("❌ Chatbot API returned error status")
            return False
    except requests.exceptions.RequestException:
        print("❌ Chatbot API is not running")
        print("   Start it with: python chatbot_api.py")
        return False

def main():
    print_banner()
    
    # Check Python version
    if not check_python_version():
        return
    
    print()
    
    # Install dependencies
    if not install_dependencies():
        return
    
    print()
    
    # Test database connection
    if not test_database_connection():
        print("\n💡 To fix database issues:")
        print("   1. Start XAMPP Control Panel")
        print("   2. Start Apache and MySQL services")
        print("   3. Create database 'campus_navigation' in phpMyAdmin")
        print("   4. Run this script again")
        return
    
    print()
    
    # Setup database table
    if not setup_database():
        return
    
    print()
    print("🎉 Setup completed successfully!")
    print()
    print("📋 Next steps:")
    print("   1. Start your Spring Boot application")
    print("   2. Run: python chatbot_api.py")
    print("   3. Open: http://localhost:8080/ask-the-bot.html")
    print()
    print("🧪 Test the chatbot with queries like:")
    print("   - 'Where is LT 201?'")
    print("   - 'Tell me about CR 101'")
    print("   - 'How do I reach LAB 102?'")
    print()

if __name__ == "__main__":
    main() 