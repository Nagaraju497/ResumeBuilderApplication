<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied - Invalid Credentials</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Creepster&family=Poppins:wght@400;600&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0c0c0c, #1a1a2e, #16213e);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
        position: relative;
        color: #fff;
    }

    /* Haunted background elements */
    .haunted-bg {
        position: absolute;
        width: 100%;
        height: 100%;
        background: 
            radial-gradient(circle at 20% 80%, rgba(139, 0, 0, 0.3) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(178, 34, 34, 0.2) 0%, transparent 50%);
        z-index: 1;
    }

    /* Floating ghost error */
    .error-ghost {
        position: absolute;
        top: 20%;
        left: 50%;
        transform: translateX(-50%);
        font-size: 120px;
        animation: floatError 3s ease-in-out infinite;
        filter: drop-shadow(0 0 20px rgba(255, 0, 0, 0.5));
        z-index: 2;
    }

    /* Main error container */
    .error-container {
        background: rgba(0, 0, 0, 0.9);
        backdrop-filter: blur(15px);
        padding: 50px;
        border-radius: 20px;
        border: 3px solid #8b0000;
        box-shadow: 
            0 0 50px rgba(139, 0, 0, 0.6),
            inset 0 0 30px rgba(255, 0, 0, 0.2);
        text-align: center;
        max-width: 500px;
        position: relative;
        z-index: 3;
        animation: errorPulse 2s infinite;
    }

    /* Error text styles */
    .error-title {
        font-family: 'Creepster', cursive;
        font-size: 42px;
        color: #ff0000;
        margin-bottom: 20px;
        text-shadow: 0 0 15px #ff0000;
        letter-spacing: 3px;
    }

    .error-subtitle {
        font-size: 18px;
        color: #ccc;
        margin-bottom: 30px;
        line-height: 1.6;
    }

    /* Navigation buttons */
    .nav-buttons {
        display: flex;
        gap: 20px;
        justify-content: center;
        margin-top: 30px;
    }

    .ghost-btn {
        padding: 15px 30px;
        font-family: 'Creepster', cursive;
        font-size: 16px;
        text-decoration: none;
        border-radius: 10px;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 2px;
        position: relative;
        overflow: hidden;
    }

    .btn-primary {
        background: linear-gradient(135deg, #8b0000, #dc143c);
        color: white;
        border: 2px solid #ff0000;
    }

    .btn-secondary {
        background: transparent;
        color: #ff4444;
        border: 2px solid #8b0000;
    }

    .ghost-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(255, 0, 0, 0.4);
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #dc143c, #ff0000);
    }

    .btn-secondary:hover {
        background: rgba(139, 0, 0, 0.2);
    }

    /* Error code display */
    .error-code {
        margin-top: 25px;
        padding: 15px;
        background: rgba(139, 0, 0, 0.3);
        border-radius: 8px;
        border: 1px solid #8b0000;
        font-family: monospace;
        font-size: 14px;
        color: #ff6b6b;
    }

    /* Warning symbol */
    .warning-symbol {
        font-size: 60px;
        margin-bottom: 20px;
        animation: warningFlash 1.5s infinite;
        filter: drop-shadow(0 0 10px #ff0000);
    }

    /* Animations */
    @keyframes floatError {
        0%, 100% {
            transform: translateX(-50%) translateY(0px);
        }
        50% {
            transform: translateX(-50%) translateY(-20px);
        }
    }

    @keyframes errorPulse {
        0%, 100% {
            box-shadow: 
                0 0 50px rgba(139, 0, 0, 0.6),
                inset 0 0 30px rgba(255, 0, 0, 0.2);
        }
        50% {
            box-shadow: 
                0 0 70px rgba(255, 0, 0, 0.8),
                inset 0 0 40px rgba(255, 0, 0, 0.3);
        }
    }

    @keyframes warningFlash {
        0%, 100% {
            opacity: 1;
            transform: scale(1);
        }
        50% {
            opacity: 0.7;
            transform: scale(1.1);
        }
    }

    /* Floating particles */
    .blood-drop {
        position: absolute;
        width: 8px;
        height: 12px;
        background: rgba(139, 0, 0, 0.7);
        border-radius: 50% 50% 50% 50% / 60% 60% 40% 40%;
        animation: bloodDrip 8s infinite linear;
        z-index: 1;
    }

    .blood-drop:nth-child(1) { left: 10%; animation-delay: 0s; }
    .blood-drop:nth-child(2) { left: 25%; animation-delay: 2s; }
    .blood-drop:nth-child(3) { left: 50%; animation-delay: 4s; }
    .blood-drop:nth-child(4) { left: 75%; animation-delay: 1s; }
    .blood-drop:nth-child(5) { left: 90%; animation-delay: 3s; }

    @keyframes bloodDrip {
        0% {
            transform: translateY(-100px) rotate(0deg);
            opacity: 0;
        }
        10% {
            opacity: 1;
        }
        90% {
            opacity: 1;
        }
        100% {
            transform: translateY(100vh) rotate(360deg);
            opacity: 0;
        }
    }

    /* Ghostly text effect */
    .ghost-text {
        position: relative;
        display: inline-block;
    }

    .ghost-text::after {
        content: 'Invalid Credentials';
        position: absolute;
        top: 0;
        left: 0;
        color: rgba(255, 255, 255, 0.1);
        z-index: -1;
        transform: translate(5px, 5px);
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .error-container {
            margin: 20px;
            padding: 30px;
        }
        
        .error-title {
            font-size: 32px;
        }
        
        .nav-buttons {
            flex-direction: column;
            align-items: center;
        }
        
        .ghost-btn {
            width: 200px;
        }
    }

    /* Access denied stamp */
    .denied-stamp {
        position: absolute;
        top: -30px;
        right: -30px;
        width: 120px;
        height: 120px;
        background: #8b0000;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transform: rotate(15deg);
        border: 5px solid #ff0000;
        box-shadow: 0 0 20px rgba(255, 0, 0, 0.5);
    }

    .denied-stamp::before {
        content: 'DENIED';
        color: white;
        font-family: 'Creepster', cursive;
        font-size: 16px;
        font-weight: bold;
        letter-spacing: 1px;
    }
</style>
</head>
<body>
    <!-- Background elements -->
    <div class="haunted-bg"></div>
    
    <!-- Blood drops -->
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    
    <!-- Error ghost -->
    <div class="error-ghost">👻</div>
    
    <!-- Main error container -->
    <div class="error-container">
        <!-- Access denied stamp -->
        <div class="denied-stamp"></div>
        
        <!-- Warning symbol -->
        <div class="warning-symbol">⚠️</div>
        
        <!-- Error title -->
        <h1 class="error-title ghost-text">ACCESS DENIED</h1>
        
        <!-- Error message -->
        <div class="error-subtitle">
            <p>The spirits have rejected your credentials!</p>
            <p style="margin-top: 10px; font-size: 16px; color: #ff6b6b;">
                Invalid username or password detected in the haunted realm.
            </p>
        </div>
        
        <!-- Error code -->
        <div class="error-code">
            ERROR: 0xGH05T_4CC3SS_D3N13D<br>
            TIMESTAMP: <%= new java.util.Date() %>
        </div>
        
        <!-- Navigation buttons -->
        <div class="nav-buttons">
            <a href="register.jsp" class="ghost-btn btn-primary">
                🧟‍♂️ Try Again
            </a>
            <a href="login.jsp" class="ghost-btn btn-secondary">
                ↩️ Back to Login
            </a>
        </div>
        
        <!-- Additional message -->
        <div style="margin-top: 25px; font-size: 12px; color: #888;">
            <p>If you've forgotten your mortal credentials,<br>contact the realm administrator.</p>
        </div>
    </div>

    <script>
        // Add some interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            const errorContainer = document.querySelector('.error-container');
            
            // Add mouse move tilt effect
            document.addEventListener('mousemove', function(e) {
                const xAxis = (window.innerWidth / 2 - e.pageX) / 25;
                const yAxis = (window.innerHeight / 2 - e.pageY) / 25;
                errorContainer.style.transform = `rotateY(${xAxis}deg) rotateX(${yAxis}deg)`;
            });
            
            // Add click effect
            errorContainer.addEventListener('click', function() {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 150);
            });
            
            // Random ghost sounds (visual feedback)
            const buttons = document.querySelectorAll('.ghost-btn');
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.filter = 'brightness(1.3) drop-shadow(0 0 15px #ff0000)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.filter = 'brightness(1) drop-shadow(0 0 5px #ff0000)';
                });
            });
            
            // Error message typewriter effect
            const errorMsg = document.querySelector('.error-subtitle p');
            const originalText = errorMsg.textContent;
            errorMsg.textContent = '';
            let i = 0;
            
            function typeWriter() {
                if (i < originalText.length) {
                    errorMsg.textContent += originalText.charAt(i);
                    i++;
                    setTimeout(typeWriter, 50);
                }
            }
            
            // Start typewriter after a delay
            setTimeout(typeWriter, 1000);
        });
    </script>
</body>
</html>