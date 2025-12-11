<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logged Out Successfully</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }

    /* Disco Animated Background */
    @keyframes disco {
        0% { background: linear-gradient(135deg, #667eea, #764ba2); }
        20% { background: linear-gradient(135deg, #f093fb, #f5576c); }
        40% { background: linear-gradient(135deg, #4facfe, #00f2fe); }
        60% { background: linear-gradient(135deg, #43e97b, #38f9d7); }
        80% { background: linear-gradient(135deg, #fa709a, #fee140); }
        100% { background: linear-gradient(135deg, #667eea, #764ba2); }
    }

    body {
        animation: disco 8s infinite alternate;
        background-size: 400% 400%;
    }

    .logout-container {
        background: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(10px);
        padding: 50px 40px;
        border-radius: 20px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        text-align: center;
        max-width: 450px;
        width: 100%;
        animation: fadeInUp 0.6s ease-out;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .success-icon {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #4CAF50, #45a049);
        border-radius: 50%;
        margin: 0 auto 25px;
        display: flex;
        align-items: center;
        justify-content: center;
        animation: scaleIn 0.5s ease-out 0.2s both;
    }

    .success-icon::before {
        content: '✓';
        font-size: 40px;
        color: white;
        font-weight: bold;
    }

    @keyframes scaleIn {
        from {
            transform: scale(0);
        }
        to {
            transform: scale(1);
        }
    }

    h3 {
        color: #333;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 15px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .message {
        color: #555;
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 30px;
    }

    .btn {
        padding: 12px 30px;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        text-decoration: none;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 160px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }

    .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.6);
    }

    /* Floating Animation */
    .floating {
        animation: floating 3s ease-in-out infinite;
    }

    @keyframes floating {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-10px); }
    }
</style>
</head>
<body>
    <div class="logout-container">
        <div class="success-icon floating"></div>
        <h3>Logged Out Successfully!</h3>
        <p class="message">
            You have been securely logged out of your account. 
            Thank you for using our Resume Builder service.
        </p>

        <!-- Only Login Button -->
        <a href="login.jsp" class="btn">🔐 Login Again</a>
    </div>

    <script>
        // Auto redirect after 20 seconds
        setTimeout(() => {
            const redirectConfirm = confirm('You have been logged out. Would you like to go to the login page?');
            if (redirectConfirm) {
                window.location.href = 'login.jsp';
            }
        }, 20000);
    </script>
</body>
</html>
