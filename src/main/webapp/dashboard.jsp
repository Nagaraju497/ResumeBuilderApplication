<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ghostly Resume Dashboard</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Creepster&family=Poppins:wght@400;600;700&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0c0c0c, #1a1a2e, #16213e);
        min-height: 100vh;
        overflow-x: hidden;
        position: relative;
        color: #fff;
        padding: 20px;
    }

    /* Animated Ghost Background */
    .haunted-bg {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        background: 
            radial-gradient(circle at 20% 80%, rgba(139, 0, 0, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(178, 34, 34, 0.1) 0%, transparent 50%);
    }

    /* Floating Ghosts */
    .floating-ghost {
        position: absolute;
        font-size: 40px;
        animation: floatAround 20s infinite linear;
        filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.5));
        cursor: pointer;
        z-index: 1;
    }

    .floating-ghost:hover {
        animation-play-state: paused;
        transform: scale(1.5);
        filter: drop-shadow(0 0 20px #ff0000);
    }

    .ghost-1 { top: 10%; left: 5%; animation-delay: 0s; animation-duration: 25s; }
    .ghost-2 { top: 60%; left: 80%; animation-delay: 5s; animation-duration: 30s; }
    .ghost-3 { top: 30%; left: 90%; animation-delay: 10s; animation-duration: 20s; }
    .ghost-4 { top: 80%; left: 15%; animation-delay: 15s; animation-duration: 35s; }
    .ghost-5 { top: 40%; left: 70%; animation-delay: 7s; animation-duration: 28s; }

    @keyframes floatAround {
        0% {
            transform: translate(0, 0) rotate(0deg);
        }
        25% {
            transform: translate(100px, 50px) rotate(90deg);
        }
        50% {
            transform: translate(50px, 100px) rotate(180deg);
        }
        75% {
            transform: translate(-50px, 80px) rotate(270deg);
        }
        100% {
            transform: translate(0, 0) rotate(360deg);
        }
    }

    /* Main Dashboard Container */
    .dashboard-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
        position: relative;
        z-index: 2;
    }

    /* Header */
    .dashboard-header {
        text-align: center;
        margin-bottom: 50px;
        position: relative;
    }

    .dashboard-title {
        font-family: 'Creepster', cursive;
        font-size: 48px;
        color: #ff0000;
        text-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000;
        margin-bottom: 10px;
        animation: titleGlow 3s ease-in-out infinite;
    }

    @keyframes titleGlow {
        0%, 100% {
            text-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000;
        }
        50% {
            text-shadow: 0 0 30px #ff6b6b, 0 0 60px #ff0000;
        }
    }

    .dashboard-subtitle {
        color: #ccc;
        font-size: 18px;
        margin-bottom: 20px;
    }

    /* Dashboard Grid */
    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        margin-bottom: 40px;
    }

    /* Dashboard Cards */
    .dashboard-card {
        background: rgba(0, 0, 0, 0.8);
        backdrop-filter: blur(10px);
        border: 2px solid #8b0000;
        border-radius: 15px;
        padding: 30px;
        text-align: center;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
        cursor: pointer;
    }

    .dashboard-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 0, 0, 0.2), transparent);
        transition: left 0.5s ease;
    }

    .dashboard-card:hover::before {
        left: 100%;
    }

    .dashboard-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 40px rgba(255, 0, 0, 0.3);
        border-color: #ff0000;
    }

    .card-icon {
        font-size: 50px;
        margin-bottom: 20px;
        filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.5));
    }

    .card-title {
        font-family: 'Creepster', cursive;
        font-size: 24px;
        color: #ff6b6b;
        margin-bottom: 15px;
        text-shadow: 0 0 10px rgba(255, 107, 107, 0.5);
    }

    .card-description {
        color: #ccc;
        font-size: 14px;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .card-button {
        display: inline-block;
        padding: 12px 30px;
        background: linear-gradient(135deg, #8b0000, #dc143c);
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-family: 'Creepster', cursive;
        font-size: 16px;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        letter-spacing: 1px;
    }

    .card-button:hover {
        background: linear-gradient(135deg, #dc143c, #ff0000);
        transform: scale(1.05);
        box-shadow: 0 5px 20px rgba(255, 0, 0, 0.4);
    }

    /* Special Preview Button */
    .preview-card {
        grid-column: 1 / -1;
        background: linear-gradient(135deg, rgba(139, 0, 0, 0.3), rgba(220, 20, 60, 0.3));
        border: 2px solid #ff0000;
    }

    .preview-card .card-button {
        background: linear-gradient(135deg, #ff0000, #ff6b6b);
        font-size: 18px;
        padding: 15px 40px;
    }

    /* Ghost Cursor Trail */
    .ghost-cursor {
        position: fixed;
        width: 20px;
        height: 20px;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 50%;
        pointer-events: none;
        z-index: 9999;
        mix-blend-mode: difference;
        animation: cursorFloat 2s ease-in-out infinite;
    }

    @keyframes cursorFloat {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.5); }
    }

    /* Blood Drip Animation */
    .blood-drip {
        position: fixed;
        top: -50px;
        width: 3px;
        height: 50px;
        background: linear-gradient(to bottom, transparent, #ff0000);
        animation: bloodDrip 8s infinite linear;
        z-index: 1;
    }

    @keyframes bloodDrip {
        0% {
            transform: translateY(-50px);
            opacity: 0;
        }
        10% {
            opacity: 1;
        }
        90% {
            opacity: 1;
        }
        100% {
            transform: translateY(100vh);
            opacity: 0;
        }
    }

    /* Ghost Whisper Messages */
    .ghost-whisper {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: rgba(0, 0, 0, 0.9);
        border: 1px solid #8b0000;
        border-radius: 10px;
        padding: 15px;
        max-width: 300px;
        font-size: 14px;
        color: #ff6b6b;
        opacity: 0;
        transform: translateY(20px);
        transition: all 0.3s ease;
        z-index: 1000;
    }

    .ghost-whisper.show {
        opacity: 1;
        transform: translateY(0);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .dashboard-grid {
            grid-template-columns: 1fr;
        }
        
        .dashboard-title {
            font-size: 36px;
        }
        
        .dashboard-card {
            padding: 20px;
        }
    }

    /* Logout Section */
    .logout-section {
        text-align: center;
        margin-top: 50px;
        padding: 30px;
        background: rgba(0, 0, 0, 0.6);
        border-radius: 15px;
        border: 1px solid #8b0000;
    }

    .logout-button {
        display: inline-block;
        padding: 12px 30px;
        background: transparent;
        color: #ff4444;
        text-decoration: none;
        border: 2px solid #8b0000;
        border-radius: 8px;
        font-family: 'Creepster', cursive;
        font-size: 16px;
        transition: all 0.3s ease;
        margin: 0 10px;
    }

    .logout-button:hover {
        background: #8b0000;
        color: white;
        transform: scale(1.05);
    }
</style>
</head>
<body>
    <!-- Animated Background -->
    <div class="haunted-bg"></div>
    
    <!-- Floating Ghosts -->
    <div class="floating-ghost ghost-1">👻</div>
    <div class="floating-ghost ghost-2">👻</div>
    <div class="floating-ghost ghost-3">👻</div>
    <div class="floating-ghost ghost-4">👻</div>
    <div class="floating-ghost ghost-5">👻</div>
    
    <!-- Blood Drips -->
    <div class="blood-drip" style="left: 10%; animation-delay: 0s;"></div>
    <div class="blood-drip" style="left: 25%; animation-delay: 2s;"></div>
    <div class="blood-drip" style="left: 50%; animation-delay: 4s;"></div>
    <div class="blood-drip" style="left: 75%; animation-delay: 1s;"></div>
    <div class="blood-drip" style="left: 90%; animation-delay: 3s;"></div>
    
    <!-- Ghost Whisper Messages -->
    <div class="ghost-whisper" id="ghostMessage"></div>
    
    <!-- Ghost Cursor Trail -->
    <div class="ghost-cursor" id="ghostCursor"></div>

    <!-- Main Dashboard -->
    <div class="dashboard-container">
        <div class="dashboard-header">
            <h1 class="dashboard-title">RESUME GRAVEYARD</h1>
            <p class="dashboard-subtitle">Where dead resumes come back to life...</p>
        </div>

        <div class="dashboard-grid">
            <!-- Create Resume Card -->
            <div class="dashboard-card" onclick="navigateTo('createresume.jsp')">
                <div class="card-icon">📝</div>
                <h3 class="card-title">SUMMON RESUME</h3>
                <p class="card-description">Conjure a new resume from the depths of the underworld. Let the spirits guide your career path.</p>
                <a href="createresume.jsp" class="card-button">Begin Ritual</a>
            </div>

            <!-- View Resume Card -->
            <div class="dashboard-card" onclick="navigateTo('viewresume.jsp')">
                <div class="card-icon">👁️</div>
                <h3 class="card-title">VIEW RESUME SPIRIT</h3>
                <p class="card-description">Gaze upon your resume's spiritual form. See what the hiring managers will witness.</p>
                <a href="viewresume.jsp" class="card-button">Open Séance</a>
            </div>

            <!-- Download Resume Card -->
            <div class="dashboard-card" onclick="navigateTo('downloadresume.jsp')">
                <div class="card-icon">⤓</div>
                <h3 class="card-title">CAPTURE RESUME SOUL</h3>
                <p class="card-description">Download your resume's eternal soul in various formats for the mortal world.</p>
                <a href="downloadresume.jsp" class="card-button">Capture Soul</a>
            </div>

            <!-- Preview Resume Card -->
            <div class="dashboard-card preview-card">
                <div class="card-icon">🔮</div>
                <h3 class="card-title">PREVIEW RESUME VISION</h3>
                <p class="card-description">See your resume's final form before releasing it to the mortal realm of employers.</p>
                <form action="PreviewResume" method="post" style="display: inline;">
                    <button type="submit" class="card-button">Summon Vision</button>
                </form>
            </div>
        </div>

        <!-- Logout Section -->
        <div class="logout-section">
            <h3 style="color: #ff6b6b; margin-bottom: 15px; font-family: 'Creepster', cursive;">
                LEAVING SO SOON?
            </h3>
            <p style="color: #ccc; margin-bottom: 20px;">
                The spirits will miss your presence... but they understand mortal needs.
            </p>
            <a href="logout.jsp" class="logout-button">Return to Mortality</a>
        </div>
    </div>

    <script>
        // Ghost Cursor Trail
        document.addEventListener('mousemove', function(e) {
            const cursor = document.getElementById('ghostCursor');
            cursor.style.left = e.pageX + 'px';
            cursor.style.top = e.pageY + 'px';
            
            // Create trailing effect
            if (Math.random() > 0.95) {
                createGhostTrail(e.pageX, e.pageY);
            }
        });

        function createGhostTrail(x, y) {
            const trail = document.createElement('div');
            trail.style.position = 'fixed';
            trail.style.left = x + 'px';
            trail.style.top = y + 'px';
            trail.style.width = '10px';
            trail.style.height = '10px';
            trail.style.background = 'rgba(255, 255, 255, 0.5)';
            trail.style.borderRadius = '50%';
            trail.style.pointerEvents = 'none';
            trail.style.zIndex = '9998';
            trail.style.animation = 'fadeOut 1s forwards';
            
            document.body.appendChild(trail);
            
            setTimeout(() => {
                if (trail.parentNode) {
                    document.body.removeChild(trail);
                }
            }, 1000);
        }

        // Ghost Whisper Messages
        const messages = [
            "Your resume is looking... alive! 👻",
            "The spirits sense great potential in you!",
            "Beware of typos... they haunt forever!",
            "Your career path is being revealed...",
            "The hiring managers await your essence!",
            "Your skills are rising from the grave!",
            "The ghost of opportunities is near..."
        ];

        function showGhostMessage() {
            const messageDiv = document.getElementById('ghostMessage');
            const randomMessage = messages[Math.floor(Math.random() * messages.length)];
            
            messageDiv.textContent = randomMessage;
            messageDiv.classList.add('show');
            
            setTimeout(() => {
                messageDiv.classList.remove('show');
            }, 3000);
        }

        // Show random messages periodically
        setInterval(showGhostMessage, 10000);

        // Interactive card clicks
        function navigateTo(url) {
            showGhostMessage();
            setTimeout(() => {
                window.location.href = url;
            }, 500);
        }

        // Ghost interaction
        const ghosts = document.querySelectorAll('.floating-ghost');
        ghosts.forEach(ghost => {
            ghost.addEventListener('click', function() {
                this.style.animation = 'none';
                this.style.transform = 'scale(2)';
                this.style.filter = 'drop-shadow(0 0 30px #ff0000)';
                
                setTimeout(() => {
                    this.style.animation = '';
                    this.style.transform = '';
                    this.style.filter = '';
                }, 1000);
                
                showGhostMessage();
            });
        });

        // Page load effect
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(showGhostMessage, 2000);
            
            // Add fadeOut animation for cursor trail
            const style = document.createElement('style');
            style.textContent = `
                @keyframes fadeOut {
                    from { opacity: 1; transform: scale(1); }
                    to { opacity: 0; transform: scale(3); }
                }
            `;
            document.head.appendChild(style);
        });

        // Background interaction
        document.addEventListener('click', function(e) {
            if (e.target === document.querySelector('.haunted-bg')) {
                createRippleEffect(e.pageX, e.pageY);
            }
        });

        function createRippleEffect(x, y) {
            const ripple = document.createElement('div');
            ripple.style.position = 'fixed';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.style.width = '0px';
            ripple.style.height = '0px';
            ripple.style.border = '2px solid rgba(255, 0, 0, 0.3)';
            ripple.style.borderRadius = '50%';
            ripple.style.pointerEvents = 'none';
            ripple.style.zIndex = '1';
            ripple.style.animation = 'ripple 1s forwards';
            
            document.body.appendChild(ripple);
            
            setTimeout(() => {
                if (ripple.parentNode) {
                    document.body.removeChild(ripple);
                }
            }, 1000);
        }

        // Add ripple animation
        const rippleStyle = document.createElement('style');
        rippleStyle.textContent = `
            @keyframes ripple {
                to {
                    width: 200px;
                    height: 200px;
                    opacity: 0;
                    transform: translate(-100px, -100px);
                }
            }
        `;
        document.head.appendChild(rippleStyle);
    </script>
</body>
</html>