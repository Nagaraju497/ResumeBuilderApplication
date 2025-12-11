<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - If You Dare</title>
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

    /* Simplified Ghost */
    .ghost {
        position: absolute;
        font-size: 100px;
        top: 50%;
        left: -100px;
        animation: ghostFly 4s ease-in-out forwards;
        filter: drop-shadow(0 0 20px rgba(255, 255, 255, 0.5));
        z-index: 10;
    }

    @keyframes ghostFly {
        0% {
            left: -100px;
            transform: translateY(0px);
        }
        50% {
            left: 45%;
            transform: translateY(-50px);
        }
        100% {
            left: 45%;
            transform: translateY(0px);
        }
    }

    /* Login Container */
    .login-container {
        background: rgba(0, 0, 0, 0.9);
        backdrop-filter: blur(15px);
        padding: 40px 50px;
        border-radius: 15px;
        border: 2px solid #8b0000;
        box-shadow: 
            0 0 30px rgba(139, 0, 0, 0.5),
            inset 0 0 20px rgba(255, 0, 0, 0.2);
        width: 380px;
        text-align: center;
        position: relative;
        z-index: 1000;
        font-family: 'Creepster', cursive;
        opacity: 0;
        animation: fadeIn 0.5s 4.5s forwards;
    }

    @keyframes fadeIn {
        to {
            opacity: 1;
        }
    }

    .login-container::before {
        content: '⚰️';
        position: absolute;
        top: -20px;
        left: 50%;
        transform: translateX(-50%);
        font-size: 30px;
    }

    /* Form Styles */
    h2 {
        color: #ff0000;
        margin-bottom: 10px;
        font-size: 32px;
        font-weight: normal;
        text-shadow: 0 0 10px #ff0000, 0 0 20px #ff0000;
        letter-spacing: 2px;
    }

    .subtitle {
        color: #ccc;
        margin-bottom: 25px;
        font-size: 14px;
        font-family: 'Poppins', sans-serif;
    }

    input[type="text"], 
    input[type="password"] {
        width: 100%;
        padding: 15px 18px;
        margin: 12px 0 20px 0;
        border: 2px solid #8b0000;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s ease;
        background: rgba(0, 0, 0, 0.7);
        color: #fff;
        font-family: 'Poppins', sans-serif;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #ff0000;
        box-shadow: 0 0 20px rgba(255, 0, 0, 0.5);
        transform: scale(1.02);
        background: rgba(0, 0, 0, 0.9);
        outline: none;
    }

    input[type="submit"] {
        width: 100%;
        padding: 15px;
        background: linear-gradient(135deg, #8b0000, #dc143c);
        border: none;
        border-radius: 8px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.3s ease;
        letter-spacing: 1px;
        font-family: 'Creepster', cursive;
        margin-top: 10px;
        text-transform: uppercase;
    }

    input[type="submit"]:hover {
        transform: translateY(-3px);
        box-shadow: 0 0 30px rgba(255, 0, 0, 0.7);
        background: linear-gradient(135deg, #dc143c, #ff0000);
    }

    .footer {
        margin-top: 20px;
        font-size: 14px;
        color: #ccc;
        font-family: 'Poppins', sans-serif;
    }

    a {
        text-decoration: none;
        color: #ff4444;
        font-weight: 600;
        transition: 0.3s ease;
    }

    a:hover {
        color: #ff0000;
        text-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
    }

    /* Background elements */
    .background-ghost {
        position: absolute;
        font-size: 40px;
        opacity: 0.3;
        animation: float 10s infinite linear;
    }

    .background-ghost:nth-child(1) { top: 20%; left: 10%; animation-delay: 0s; }
    .background-ghost:nth-child(2) { top: 60%; left: 80%; animation-delay: 2s; }
    .background-ghost:nth-child(3) { top: 40%; left: 70%; animation-delay: 4s; }

    @keyframes float {
        0%, 100% {
            transform: translate(0, 0) rotate(0deg);
        }
        25% {
            transform: translate(50px, 30px) rotate(5deg);
        }
        50% {
            transform: translate(30px, 50px) rotate(0deg);
        }
        75% {
            transform: translate(-30px, 40px) rotate(-5deg);
        }
    }

    /* Flicker effect */
    @keyframes flicker {
        0%, 18%, 22%, 25%, 53%, 57%, 100% {
            opacity: 1;
        }
        20%, 24%, 55% {
            opacity: 0.3;
        }
    }

    .flicker {
        animation: flicker 3s infinite;
    }
</style>
</head>

<body>
    <!-- Background Ghosts -->
    <div class="background-ghost">👻</div>
    <div class="background-ghost">👻</div>
    <div class="background-ghost">👻</div>

    <!-- Main Ghost -->
    <div class="ghost">👻</div>

    <!-- Login Container -->
    <div class="login-container" id="loginForm">
        <h2 class="flicker">WELCOME, MORTAL</h2>
        <p class="subtitle">Your resume awaits... if you survive the login</p>
        <form action="loginServlet" method="post">
            <input type="text" name="name" placeholder="Enter Your Soul Name" required>
            <input type="password" name="password" placeholder="Whisper the Secret Word" required>
            <input type="submit" value="BEGIN YOUR DOOM">
        </form>

        <div class="footer">
            <p>New Soul? <a href="register.jsp">Summon an Account</a></p>
        </div>
    </div>

    <script>
        // Simple form validation and effects
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input[type="text"], input[type="password"]');
            
            // Add focus effects
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.boxShadow = '0 0 25px rgba(255, 0, 0, 0.7)';
                    this.style.borderColor = '#ff0000';
                });
                
                input.addEventListener('blur', function() {
                    this.style.boxShadow = '0 0 20px rgba(255, 0, 0, 0.3)';
                    this.style.borderColor = '#8b0000';
                });
            });

            // Form submission effect
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const submitBtn = document.querySelector('input[type="submit"]');
                submitBtn.style.transform = 'scale(0.95)';
                submitBtn.style.background = 'linear-gradient(135deg, #ff0000, #8b0000)';
                
                // You can add additional validation here
                const username = document.querySelector('input[name="name"]').value;
                const password = document.querySelector('input[name="password"]').value;
                
                if (!username || !password) {
                    e.preventDefault();
                    alert('The spirits require both soul name and secret word!');
                    submitBtn.style.transform = 'scale(1)';
                    submitBtn.style.background = 'linear-gradient(135deg, #8b0000, #dc143c)';
                }
            });
        });
    </script>
</body>
</html>