
function redirectWithToken(page) {
    let token = new URLSearchParams(window.location.search).get('token');

    if (!token) {
        // Si le token n'est pas dans l'URL, le récupérer depuis localStorage
        token = localStorage.getItem('token');
    }

    if (token) {
        window.location.href = `${page}?token=${token}`;
    } else {
        console.error('Token is missing or invalid');
    }
}



let currentUserId;
let usersList = [];
let currentUserName; // Variable pour stocker le nom de l'utilisateur actuel
let activeRecipientId = null;  // Variable globale pour stocker l'ID du destinataire actif


function getParams() {
    const params = new URLSearchParams(window.location.search);
    const token = params.get('token');

    console.log("Token:", token);

    if (!token) {
        console.error("Token is missing or invalid");
        return;
    }

    // Définir un délai d'attente (timeout)
    const fetchWithTimeout = (url, options, timeout = 5000) => {
        return Promise.race([
            fetch(url, options),
            new Promise((_, reject) =>
                setTimeout(() => reject(new Error('Timeout')), timeout)
            )
        ]);
    };

    fetchWithTimeout("http://172.16.1.148:8000/api/me", {
        method: "GET",
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        }
    }, 5000) // Timeout de 5 secondes
    .then(response => {
        if (response.status === 200) {
            return response.json();
        } else {
            window.location.replace("http://localhost/AROSAJE/Front/LoginPage/login.html");
            throw new Error(`Unauthorized or failed request with status ${response.status}`);
        }
    })
    .then(data => {
        // Récupérer et afficher l'ID et le nom de l'utilisateur
        currentUserId = data.user.id_user; 
        currentUserName = `${data.user.prenom} ${data.user.nom}`;
        console.log("Current User ID:", currentUserId);
        console.log("Current User Name:", currentUserName);
    
        // Vérifier si l'utilisateur a un type "admin" (user_type == 4)
        if (data.user.user_type === 4) {
            // Ajouter l'onglet Admin avant le bouton de déconnexion
            const navbarLinks = document.querySelector('.navbar-links');
            const logoutLink = document.getElementById('logout');
    
            const adminLink = document.createElement('a');
            adminLink.href = "javascript:void(0);";
            adminLink.innerHTML = '<i class="fas fa-cogs"></i> Admin';
            adminLink.onclick = function() {
                redirectWithToken('../AdminPage/admin.html');
            };
    
            // Insérer avant le bouton de déconnexion
            navbarLinks.insertBefore(adminLink, logoutLink);
        }
    
        // Charger les conversations existantes
        loadUserChats(currentUserId);
    })
    .catch(error => {
        console.error("Request failed:", error);
        notyf.error("Impossible de contacter le serveur.");
    });
}





async function getUsers() {
    try {
        const response = await fetch('http://172.16.1.148:8000/api/users/alluser');
        if (response.ok) {
            const userData = await response.json();
            usersList = userData;
        } else {
            console.error('Erreur de chargement des données:', response.status);
        }
    } catch (error) {
        console.error('Erreur lors de la récupération des utilisateurs:', error);
    }
}

function findUserNameById(userId) {
    const user = usersList.find(u => u.id_user === userId);
    return user ? `${user.prenom} ${user.nom}` : 'Nom inconnu';
}

function loadUserChats(currentUserId) {
    document.getElementById('loadingConversations').style.display = 'block';

    fetch(`http://172.16.1.148:8000/api/chats/${currentUserId}`)
    .then(response => {
        if (!response.ok) throw new Error('Failed to load chats');
        return response.json();
    })
    .then(chats => {
        displayChats(chats);
        
        // Ouvrir automatiquement la première conversation s'il y en a
        if (chats.length > 0) {
            const firstChat = chats[0];
            const firstChatRecipientId = firstChat.id_recipient === currentUserId ? firstChat.id_user : firstChat.id_recipient;
            const firstChatRecipientName = findUserNameById(firstChatRecipientId);
            
            openChat(firstChatRecipientId, firstChatRecipientName); // Ouvrir la première conversation
        }
    })
    .catch(error => {
        console.error("Error loading chats:", error);
    })
    .finally(() => {
        document.getElementById('loadingConversations').style.display = 'none';
    });
}

function displayChats(chats) {
    const conversationsList = document.querySelector('.conversationsList ul');
    conversationsList.innerHTML = '';

    chats.forEach(chat => {
        const listItem = document.createElement('li');
        
        let displayName = (chat.id_recipient === currentUserId) ? findUserNameById(chat.id_user) : chat.name_recipient;
        
        listItem.onclick = () => openChat(chat.id_recipient === currentUserId ? chat.id_user : chat.id_recipient, displayName);

        const conversationItem = document.createElement('div');
        conversationItem.className = 'conversation-item';
        conversationItem.innerHTML = `
            <span>${displayName}</span>
            <span class="chat-title" style="font-size: smaller; display: block;">${chat.title}</span>
            <span class="last-message">${chat.lastMessage || ''}</span>
        `;

        listItem.appendChild(conversationItem);
        conversationsList.appendChild(listItem);
    });
}

function openChat(recipientId, recipientName) {
    document.getElementById('chatWithUser').textContent = `Chat avec ${recipientName}`;
    activeRecipientId = recipientId;  // Stocker l'ID du destinataire actif
    loadMessages(activeRecipientId);  // Charger les messages pour le destinataire sélectionné

    const sendMessageBtn = document.getElementById('sendMessageBtn');
    const messageInput = document.getElementById('messageInput');

    sendMessageBtn.onclick = () => {
        const message = messageInput.value.trim();
        if (message) {
            postMessage(message);
            messageInput.value = ''; 
        }
    };

    messageInput.addEventListener('keydown', (event) => {
        if (event.key === 'Enter') {
            const message = messageInput.value.trim();
            if (message) {
                postMessage(message);
                messageInput.value = '';
            }
        }
    });
}


function loadMessages(recipientId) {
    fetch(`http://172.16.1.148:8000/api/chatHistorical?id_user=${currentUserId}&id_destinataire=${recipientId}`)
    .then(response => {
        if (!response.ok) throw new Error('Failed to load messages');
        return response.json();
    })
    .then(messages => {
        displayMessages(messages);
    })
    .catch(error => {
        console.error("Error loading messages:", error);
    });
}


function postMessage(message) {
    const data = {
        id_user: currentUserId,
        id_destinataire: activeRecipientId, 
        message: message,
        image: 'l'
    };

    fetch('http://172.16.1.148:8000/api/postMessages', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => {
        if (response.ok) {
            loadMessages(activeRecipientId); 
        } else {
            return response.json().then(errorData => {
                throw new Error(`Erreur lors de l'envoi du message: ${JSON.stringify(errorData)}`);
            });
        }
    })
    .catch(error => {
        console.error("Error sending message:", error);
    });
}


function displayMessages(messages) {
    const messagesContainer = document.getElementById('messagesContainer');
    messagesContainer.innerHTML = '';

    // Tri des messages par ordre croissant d'ID ou de timestamp, si disponible
    messages.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp)); // Assurez-vous d'utiliser le bon champ pour trier les messages

    messages.forEach(message => {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message ' + (message.id_user === currentUserId ? 'sender' : 'received');
        messageDiv.textContent = message.message;
        messagesContainer.appendChild(messageDiv);
    });

    // Faire défiler automatiquement vers le bas pour voir le dernier message
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
}

function getToken() {
    let token = new URLSearchParams(window.location.search).get('token');
    if (!token) {
        token = localStorage.getItem('token');
    }
    return token;
}

function checkOrCreateChat(recipientId, plantName, recipientName) {
    fetch(`http://172.16.1.148:8000/api/chats/${currentUserId}`)
    .then(response => {
        if (!response.ok) throw new Error('Failed to load chats');
        return response.json();
    })
    .then(chats => {
        const existingChat = chats.find(chat => chat.id_recipient === recipientId || chat.id_user === recipientId);

        if (existingChat) {
            // Le chat existe déjà, rediriger vers la page du tchat
            console.log('Chat exists, redirecting...');
            window.location.href = `../TchatPage/tchat.html?token=${getToken()}&recipientId=${recipientId}`;
        } else {
            // Créer un nouveau chat
            createChat(recipientId, plantName, recipientName);
        }
    })
    .catch(error => {
        console.error('Error checking or creating chat:', error);
    });
}

// Fonction pour créer un nouveau tchat
function createChat(recipientId, plantName, recipientName) {
    const data = {
        id_user: currentUserId,
        id_recipient: recipientId,
        title: plantName,
        name_recipient: recipientName
    };

    fetch('http://172.16.1.148:8000/api/chats/insert', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => {
        if (response.status === 201) {
            console.log('Chat created successfully');
            window.location.href = `../TchatPage/tchat.html?token=${getToken()}&recipientId=${recipientId}`;
        } else {
            return response.json().then(errorData => {
                throw new Error(`Erreur lors de la création du tchat: ${JSON.stringify(errorData)}`);
            });
        }
    })
    .catch(error => {
        console.error('Error creating chat:', error);
    });
}


// Charger la liste des utilisateurs dès le début
getUsers();

document.querySelectorAll('.contacter-btn').forEach(button => {
    button.addEventListener('click', function() {
        const recipientId = button.getAttribute('data-recipient-id');
        const plantName = button.getAttribute('data-plant-name');
        const recipientName = button.getAttribute('data-recipient-name');
        checkOrCreateChat(recipientId, plantName, recipientName); // Vérifier ou créer le tchat
    });
});

// Initialiser les paramètres lors du chargement de la page
document.addEventListener("DOMContentLoaded", getParams);