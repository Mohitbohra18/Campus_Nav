package com.campusnavai.campus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/chatbot")
@CrossOrigin(origins = "*")
public class ChatbotController {

    private final RestTemplate restTemplate;
    private final String PYTHON_API_BASE_URL = "http://localhost:5000/api/chatbot";

    @Autowired
    public ChatbotController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @PostMapping("/query")
    public ResponseEntity<Map<String, Object>> handleChatbotQuery(@RequestBody Map<String, String> request) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // Forward the request to Python API
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);
            
            ResponseEntity<Map> pythonResponse = restTemplate.exchange(
                PYTHON_API_BASE_URL + "/query",
                HttpMethod.POST,
                entity,
                Map.class
            );
            
            // Return the Python API response
            return ResponseEntity.ok(pythonResponse.getBody());
            
        } catch (HttpClientErrorException e) {
            response.put("success", false);
            response.put("response", "Error communicating with chatbot service: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            
        } catch (ResourceAccessException e) {
            response.put("success", false);
            response.put("response", "Chatbot service is not available. Please make sure the Python API is running.");
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("response", "An unexpected error occurred: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @GetMapping("/rooms")
    public ResponseEntity<Map<String, Object>> getAvailableRooms() {
        Map<String, Object> response = new HashMap<>();
        
        try {
            ResponseEntity<Map> pythonResponse = restTemplate.getForEntity(
                PYTHON_API_BASE_URL + "/rooms",
                Map.class
            );
            
            return ResponseEntity.ok(pythonResponse.getBody());
            
        } catch (HttpClientErrorException e) {
            response.put("success", false);
            response.put("rooms", new Object[0]);
            response.put("error", "Error fetching rooms: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            
        } catch (ResourceAccessException e) {
            response.put("success", false);
            response.put("rooms", new Object[0]);
            response.put("error", "Chatbot service is not available");
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(response);
            
        } catch (Exception e) {
            response.put("success", false);
            response.put("rooms", new Object[0]);
            response.put("error", "An unexpected error occurred: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @GetMapping("/health")
    public ResponseEntity<Map<String, Object>> checkChatbotHealth() {
        Map<String, Object> response = new HashMap<>();
        
        try {
            ResponseEntity<Map> pythonResponse = restTemplate.getForEntity(
                PYTHON_API_BASE_URL + "/health",
                Map.class
            );
            
            return ResponseEntity.ok(pythonResponse.getBody());
            
        } catch (Exception e) {
            response.put("status", "unhealthy");
            response.put("python_api", "disconnected");
            response.put("error", e.getMessage());
            return ResponseEntity.ok(response);
        }
    }
} 