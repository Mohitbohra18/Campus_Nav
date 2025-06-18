from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
import re
import json
from datetime import datetime

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Database configuration
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'campus_navigation',
    'port': 3306
}

def get_db_connection():
    """Create and return database connection"""
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        return connection
    except mysql.connector.Error as err:
        print(f"Error connecting to database: {err}")
        return None

def extract_room_code(query):
    """Extract room code from user query using regex patterns"""
    query = query.upper()
    
    # Common patterns for room codes
    patterns = [
        r'\b(LT|CR|LAB|AUD|LIB|CAF|ADM|GYM|MED)\s*(\d{1,3})\b',  # LT 201, CR 101, etc.
        r'\b(LECTURE\s*THEATRE|CLASSROOM|LABORATORY|AUDITORIUM|LIBRARY|CAFETERIA|ADMIN|GYMNASIUM|MEDICAL)\s*(\d{1,3})\b',  # Full names
        r'\b(\d{1,3})\s*(LT|CR|LAB|AUD|LIB|CAF|ADM|GYM|MED)\b',  # 201 LT, 101 CR, etc.
    ]
    
    for pattern in patterns:
        match = re.search(pattern, query)
        if match:
            if len(match.groups()) == 2:
                prefix, number = match.groups()
                # Convert full names to abbreviations
                name_mapping = {
                    'LECTURE THEATRE': 'LT',
                    'CLASSROOM': 'CR',
                    'LABORATORY': 'LAB',
                    'AUDITORIUM': 'AUD',
                    'LIBRARY': 'LIB',
                    'CAFETERIA': 'CAF',
                    'ADMIN': 'ADM',
                    'GYMNASIUM': 'GYM',
                    'MEDICAL': 'MED'
                }
                prefix = name_mapping.get(prefix, prefix)
                return f"{prefix} {number}"
    
    return None

def get_room_location(room_code):
    """Fetch room location from database"""
    connection = get_db_connection()
    if not connection:
        return None
    
    try:
        cursor = connection.cursor(dictionary=True)
        query = "SELECT * FROM classroom_locations WHERE room_code = %s"
        cursor.execute(query, (room_code,))
        result = cursor.fetchone()
        cursor.close()
        connection.close()
        return result
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return None

def get_floor_name(floor):
    try:
        floor_num = int(floor)
    except (ValueError, TypeError):
        return f"floor {floor}"
    if floor_num == -1:
        return "basement"
    elif floor_num == 0:
        return "ground floor"
    elif floor_num == 1:
        return "first floor"
    elif floor_num == 2:
        return "second floor"
    elif floor_num == 3:
        return "third floor"
    elif floor_num == 4:
        return "fourth floor"
    elif floor_num == 5:
        return "fifth floor"
    else:
        # fallback for higher floors
        suffix = 'th'
        if 10 <= floor_num % 100 <= 20:
            suffix = 'th'
        else:
            if floor_num % 10 == 1:
                suffix = 'st'
            elif floor_num % 10 == 2:
                suffix = 'nd'
            elif floor_num % 10 == 3:
                suffix = 'rd'
        return f"{floor_num}{suffix} floor"

def find_room(query):
    connection = get_db_connection()
    if not connection:
        return None
    try:
        cursor = connection.cursor(dictionary=True)
        # Normalize query for matching
        q = query.lower().replace(' ', '')
        # Try exact code match (case-insensitive, ignore spaces)
        cursor.execute("SELECT * FROM classroom_locations")
        rooms = cursor.fetchall()
        for room in rooms:
            code = (room['room_code'] or '').lower().replace(' ', '')
            name = (room['room_name'] or '').lower().replace(' ', '')
            if code in q or name in q:
                cursor.close()
                connection.close()
                return room
        # Try partial match (any word in query matches code or name)
        words = set(q.split())
        for room in rooms:
            code = (room['room_code'] or '').lower().replace(' ', '')
            name = (room['room_name'] or '').lower().replace(' ', '')
            for word in words:
                if word and (word in code or word in name):
                    cursor.close()
                    connection.close()
                    return room
        cursor.close()
        connection.close()
        return None
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        return None

def generate_response(room_data, original_query):
    if not room_data:
        return {
            "response": "I'm sorry, I couldn't find information about that place. Please check the name and try again.",
            "room_data": None,
            "confidence": 0.0
        }
    room_code = room_data['room_code']
    room_name = room_data['room_name']
    building = room_data['building']
    floor = room_data['floor']
    description = room_data['description']
    # Wing mapping
    wing = f"{building.lower()} wing" if building else "wing"
    floor_name = get_floor_name(floor)
    # Response
    response = f"{room_name} is at {floor_name} {wing} of the building."
    if description:
        response += f" {description}"
    return {
        "response": response,
        "room_data": room_data,
        "confidence": 0.95
    }

@app.route('/api/chatbot/query', methods=['POST'])
def chatbot_query():
    try:
        data = request.get_json()
        user_query = data.get('query', '').strip()
        if not user_query:
            return jsonify({
                "success": False,
                "response": "Please provide a query.",
                "room_data": None
            })
        # Find room by name or code
        room_data = find_room(user_query)
        if not room_data:
            return jsonify({
                "success": False,
                "response": "I couldn't find that place. Please try asking about a specific room or lab (e.g., 'Where is CR 101?' or 'Where is Lab2?').",
                "room_data": None
            })
        # Generate response
        result = generate_response(room_data, user_query)
        return jsonify({
            "success": True,
            "response": result["response"],
            "room_data": result["room_data"],
            "confidence": result["confidence"],
            "timestamp": datetime.now().isoformat()
        })
    except Exception as e:
        return jsonify({
            "success": False,
            "response": f"An error occurred: {str(e)}",
            "room_data": None
        })

@app.route('/api/chatbot/rooms', methods=['GET'])
def get_all_rooms():
    """Get list of all available rooms"""
    connection = get_db_connection()
    if not connection:
        return jsonify({"success": False, "rooms": []})
    
    try:
        cursor = connection.cursor(dictionary=True)
        query = "SELECT room_code, room_name, building, floor FROM classroom_locations ORDER BY room_code"
        cursor.execute(query)
        rooms = cursor.fetchall()
        cursor.close()
        connection.close()
        
        return jsonify({
            "success": True,
            "rooms": rooms
        })
    except mysql.connector.Error as err:
        return jsonify({
            "success": False,
            "rooms": [],
            "error": str(err)
        })

@app.route('/api/chatbot/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    connection = get_db_connection()
    if connection:
        connection.close()
        return jsonify({"status": "healthy", "database": "connected"})
    else:
        return jsonify({"status": "unhealthy", "database": "disconnected"})

if __name__ == '__main__':
    print("Starting Campus Navigation Chatbot API...")
    print("Make sure your MySQL database is running and the classroom_locations table is created.")
    app.run(debug=True, host='0.0.0.0', port=5000) 