#!/usr/bin/env python3
"""
Test script for Campus Navigation Chatbot
This script tests the chatbot API functionality.
"""

import requests
import json
import time

def test_chatbot_api():
    """Test the chatbot API endpoints"""
    base_url = "http://localhost:5000/api/chatbot"
    
    print("🧪 Testing Campus Navigation Chatbot API")
    print("=" * 50)
    
    # Test 1: Health Check
    print("\n1. Testing Health Check...")
    try:
        response = requests.get(f"{base_url}/health")
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Health Check: {data}")
        else:
            print(f"❌ Health Check Failed: {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Health Check Error: {e}")
        return False
    
    # Test 2: Get Available Rooms
    print("\n2. Testing Get Available Rooms...")
    try:
        response = requests.get(f"{base_url}/rooms")
        if response.status_code == 200:
            data = response.json()
            if data.get('success') and data.get('rooms'):
                print(f"✅ Found {len(data['rooms'])} rooms")
                for room in data['rooms'][:3]:  # Show first 3 rooms
                    print(f"   - {room['room_code']}: {room['room_name']}")
            else:
                print(f"❌ No rooms found: {data}")
        else:
            print(f"❌ Get Rooms Failed: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"❌ Get Rooms Error: {e}")
    
    # Test 3: Test Queries
    test_queries = [
        "Where is LT 201?",
        "Tell me about CR 101",
        "How do I reach LAB 102?",
        "What's the location of AUD 001?",
        "Where is the library?",
        "Invalid room XYZ 999"
    ]
    
    print("\n3. Testing Chatbot Queries...")
    for i, query in enumerate(test_queries, 1):
        print(f"\n   Test {i}: '{query}'")
        try:
            response = requests.post(
                f"{base_url}/query",
                json={"query": query},
                headers={"Content-Type": "application/json"}
            )
            
            if response.status_code == 200:
                data = response.json()
                if data.get('success'):
                    print(f"   ✅ Response: {data['response'][:100]}...")
                else:
                    print(f"   ⚠️  No match: {data['response']}")
            else:
                print(f"   ❌ Query Failed: {response.status_code}")
                
        except requests.exceptions.RequestException as e:
            print(f"   ❌ Query Error: {e}")
        
        time.sleep(0.5)  # Small delay between requests
    
    print("\n" + "=" * 50)
    print("🎉 Chatbot API Testing Completed!")
    print("\n📋 Next Steps:")
    print("   1. Start your Spring Boot application")
    print("   2. Open: http://localhost:8080/ask-the-bot.html")
    print("   3. Test the chatbot interface")
    
    return True

def test_spring_boot_integration():
    """Test the Spring Boot integration"""
    print("\n🔗 Testing Spring Boot Integration...")
    print("=" * 50)
    
    base_url = "http://localhost:8080/api/chatbot"
    
    # Test Spring Boot health endpoint
    try:
        response = requests.get(f"{base_url}/health")
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Spring Boot Health: {data}")
        else:
            print(f"❌ Spring Boot Health Failed: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"❌ Spring Boot not running: {e}")
        print("   Start Spring Boot with: mvn spring-boot:run")
        return False
    
    # Test query through Spring Boot
    try:
        response = requests.post(
            f"{base_url}/query",
            json={"query": "Where is LT 201?"},
            headers={"Content-Type": "application/json"}
        )
        
        if response.status_code == 200:
            data = response.json()
            if data.get('success'):
                print(f"✅ Spring Boot Query: {data['response'][:100]}...")
            else:
                print(f"⚠️  Spring Boot Query: {data['response']}")
        else:
            print(f"❌ Spring Boot Query Failed: {response.status_code}")
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Spring Boot Query Error: {e}")
    
    return True

if __name__ == "__main__":
    print("🚀 Starting Chatbot Integration Tests")
    print("Make sure the Python API is running: python chatbot_api.py")
    print()
    
    # Test Python API
    if test_chatbot_api():
        # Test Spring Boot integration if Python API is working
        test_spring_boot_integration()
    
    print("\n✨ All tests completed!") 