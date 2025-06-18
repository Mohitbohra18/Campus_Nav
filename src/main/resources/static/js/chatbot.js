class CampusChatbot {
    constructor() {
        this.chatMessages = document.getElementById('chatMessages');
        this.messageInput = document.getElementById('messageInput');
        this.sendButton = document.getElementById('sendButton');
        this.statusIndicator = document.getElementById('statusIndicator');
        this.roomsGrid = document.getElementById('roomsGrid');
        
        this.isTyping = false;
        this.apiBaseUrl = '/api/chatbot';
        
        this.initializeEventListeners();
        this.checkHealth();
        this.loadAvailableRooms();
    }

    initializeEventListeners() {
        // Send message on button click
        this.sendButton.addEventListener('click', () => this.sendMessage());
        
        // Send message on Enter key
        this.messageInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                this.sendMessage();
            }
        });

        // Quick action buttons
        document.querySelectorAll('.quick-action-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                const query = btn.getAttribute('data-query');
                this.messageInput.value = query;
                this.sendMessage();
            });
        });

        // Room cards click events
        this.roomsGrid.addEventListener('click', (e) => {
            if (e.target.closest('.room-card')) {
                const roomCard = e.target.closest('.room-card');
                const roomCode = roomCard.querySelector('.room-code').textContent;
                this.messageInput.value = `Where is ${roomCode}?`;
                this.sendMessage();
            }
        });
    }

    async checkHealth() {
        try {
            const response = await fetch(`${this.apiBaseUrl}/health`);
            const data = await response.json();
            
            const statusDot = this.statusIndicator.querySelector('.status-dot');
            const statusText = this.statusIndicator.querySelector('.status-text');
            
            if (data.status === 'healthy' && data.database === 'connected') {
                statusDot.className = 'status-dot connected';
                statusText.textContent = 'Connected';
            } else {
                statusDot.className = 'status-dot disconnected';
                statusText.textContent = 'Disconnected';
            }
        } catch (error) {
            const statusDot = this.statusIndicator.querySelector('.status-dot');
            const statusText = this.statusIndicator.querySelector('.status-text');
            statusDot.className = 'status-dot disconnected';
            statusText.textContent = 'Service Unavailable';
        }
    }

    async loadAvailableRooms() {
        try {
            const response = await fetch(`${this.apiBaseUrl}/rooms`);
            const data = await response.json();
            
            if (data.success && data.rooms) {
                this.displayRooms(data.rooms);
            } else {
                this.roomsGrid.innerHTML = '<div class="loading-rooms">Failed to load rooms</div>';
            }
        } catch (error) {
            this.roomsGrid.innerHTML = '<div class="loading-rooms">Failed to load rooms</div>';
        }
    }

    displayRooms(rooms) {
        this.roomsGrid.innerHTML = '';
        
        rooms.forEach(room => {
            const roomCard = document.createElement('div');
            roomCard.className = 'room-card';
            roomCard.innerHTML = `
                <div class="room-code">${room.room_code}</div>
                <div class="room-name">${room.room_name}</div>
                <div class="room-location">${room.building}, ${room.floor}</div>
            `;
            this.roomsGrid.appendChild(roomCard);
        });
    }

    async sendMessage() {
        const message = this.messageInput.value.trim();
        if (!message || this.isTyping) return;

        // Add user message to chat
        this.addMessage(message, 'user');
        this.messageInput.value = '';
        this.sendButton.disabled = true;

        // Show typing indicator
        this.showTypingIndicator();

        try {
            const response = await fetch(`${this.apiBaseUrl}/query`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ query: message })
            });

            const data = await response.json();
            
            // Remove typing indicator
            this.hideTypingIndicator();
            
            // Add bot response
            if (data.success) {
                this.addMessage(data.response, 'bot');
            } else {
                this.addMessage(data.response || 'Sorry, I encountered an error. Please try again.', 'bot');
            }

        } catch (error) {
            this.hideTypingIndicator();
            this.addMessage('Sorry, I\'m having trouble connecting to the server. Please check your connection and try again.', 'bot');
        }

        this.sendButton.disabled = false;
        this.messageInput.focus();
    }

    addMessage(text, sender) {
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${sender}-message`;
        
        const currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        
        const iconClass = sender === 'bot' ? 'fas fa-robot' : 'fas fa-user';
        
        messageDiv.innerHTML = `
            <div class="message-content">
                <i class="${iconClass} message-icon"></i>
                <div class="message-text">
                    <p>${this.formatMessage(text)}</p>
                </div>
            </div>
            <div class="message-time">${currentTime}</div>
        `;
        
        this.chatMessages.appendChild(messageDiv);
        this.scrollToBottom();
    }

    formatMessage(text) {
        // Convert line breaks to HTML
        return text.replace(/\n/g, '<br>');
    }

    showTypingIndicator() {
        this.isTyping = true;
        const typingDiv = document.createElement('div');
        typingDiv.className = 'message bot-message typing-message';
        typingDiv.id = 'typingIndicator';
        
        typingDiv.innerHTML = `
            <div class="message-content">
                <i class="fas fa-robot message-icon"></i>
                <div class="typing-indicator">
                    <div class="typing-dot"></div>
                    <div class="typing-dot"></div>
                    <div class="typing-dot"></div>
                </div>
            </div>
        `;
        
        this.chatMessages.appendChild(typingDiv);
        this.scrollToBottom();
    }

    hideTypingIndicator() {
        this.isTyping = false;
        const typingIndicator = document.getElementById('typingIndicator');
        if (typingIndicator) {
            typingIndicator.remove();
        }
    }

    scrollToBottom() {
        this.chatMessages.scrollTop = this.chatMessages.scrollHeight;
    }
}

// Initialize chatbot when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new CampusChatbot();
});

// Add theme change observer for quick actions and message text
function updateChatbotThemeColors() {
    const isDark = document.body.classList.contains('dark-theme');
    document.querySelectorAll('.quick-action-btn').forEach(btn => {
        if (isDark) {
            btn.style.background = '#23233a';
            btn.style.color = '#bb66ff';
            btn.style.border = '1px solid #bb66ff';
        } else {
            btn.style.background = '#fff';
            btn.style.color = '#667eea';
            btn.style.border = '1px solid #667eea';
        }
    });
    document.querySelectorAll('.message-text').forEach(msg => {
        if (isDark) {
            msg.style.background = '#23233a';
            msg.style.color = '#f8f8f8';
        } else {
            msg.style.background = '';
            msg.style.color = '';
        }
    });
}
// Listen for theme changes
const observer = new MutationObserver(updateChatbotThemeColors);
observer.observe(document.body, { attributes: true, attributeFilter: ['class'] });
document.addEventListener('DOMContentLoaded', updateChatbotThemeColors); 