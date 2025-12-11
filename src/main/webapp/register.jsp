<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume Builder | Professional Registration</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&family=Dancing+Script:wght@400;500;600;700&display=swap');
    
    :root {
        --primary: #2563EB;
        --primary-dark: #1D4ED8;
        --primary-light: #3B82F6;
        --secondary: #64748B;
        --dark: #1E293B;
        --light: #F8FAFC;
        --border: #E2E8F0;
        --success: #10B981;
        --accent: #F59E0B;
        --gradient-1: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        --gradient-2: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        --gradient-3: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Inter', sans-serif;
    }
    
    body {
        background: linear-gradient(-45deg, #ff0080, #8000ff, #0080ff, #00ff80);
        background-size: 400% 400%;
        animation: gradient 8s ease infinite, pulse 4s ease infinite;
        color: var(--dark);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        overflow-x: hidden;
    }
    
    @keyframes gradient {
        0% {
            background-position: 0% 50%;
        }
        25% {
            background-position: 50% 100%;
        }
        50% {
            background-position: 100% 50%;
        }
        75% {
            background-position: 50% 0%;
        }
        100% {
            background-position: 0% 50%;
        }
    }
    
    @keyframes pulse {
        0% {
            filter: hue-rotate(0deg);
        }
        50% {
            filter: hue-rotate(90deg);
        }
        100% {
            filter: hue-rotate(0deg);
        }
    }
    
    .floating-shapes {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        overflow: hidden;
    }
    
    .shape {
        position: absolute;
        border-radius: 50%;
        opacity: 0.15;
        animation: float 15s infinite linear, colorChange 10s infinite alternate;
        filter: blur(10px);
    }
    
    .shape:nth-child(1) {
        width: 300px;
        height: 300px;
        background: #ff0080;
        top: 10%;
        left: 5%;
        animation-delay: 0s;
    }
    
    .shape:nth-child(2) {
        width: 200px;
        height: 200px;
        background: #8000ff;
        top: 60%;
        left: 80%;
        animation-delay: 3s;
    }
    
    .shape:nth-child(3) {
        width: 250px;
        height: 250px;
        background: #0080ff;
        top: 40%;
        left: 10%;
        animation-delay: 6s;
    }
    
    .shape:nth-child(4) {
        width: 180px;
        height: 180px;
        background: #00ff80;
        top: 70%;
        left: 60%;
        animation-delay: 9s;
    }
    
    .shape:nth-child(5) {
        width: 220px;
        height: 220px;
        background: #ffff00;
        top: 20%;
        left: 70%;
        animation-delay: 12s;
    }
    
    @keyframes float {
        0% {
            transform: translateY(0) rotate(0deg) scale(1);
        }
        33% {
            transform: translateY(-30px) rotate(120deg) scale(1.1);
        }
        66% {
            transform: translateY(20px) rotate(240deg) scale(0.9);
        }
        100% {
            transform: translateY(0) rotate(360deg) scale(1);
        }
    }
    
    @keyframes colorChange {
        0% {
            background-color: #ff0080;
        }
        25% {
            background-color: #8000ff;
        }
        50% {
            background-color: #0080ff;
        }
        75% {
            background-color: #00ff80;
        }
        100% {
            background-color: #ffff00;
        }
    }
    
    .disco-lights {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -2;
        overflow: hidden;
        opacity: 0.3;
    }
    
    .light-beam {
        position: absolute;
        width: 100%;
        height: 2px;
        background: white;
        animation: lightSweep 5s infinite linear;
        box-shadow: 0 0 20px 5px rgba(255, 255, 255, 0.7);
    }
    
    .light-beam:nth-child(1) {
        top: 20%;
        animation-delay: 0s;
    }
    
    .light-beam:nth-child(2) {
        top: 40%;
        animation-delay: 1s;
    }
    
    .light-beam:nth-child(3) {
        top: 60%;
        animation-delay: 2s;
    }
    
    .light-beam:nth-child(4) {
        top: 80%;
        animation-delay: 3s;
    }
    
    @keyframes lightSweep {
        0% {
            transform: translateX(-100%);
            opacity: 0;
        }
        10% {
            opacity: 1;
        }
        90% {
            opacity: 1;
        }
        100% {
            transform: translateX(100%);
            opacity: 0;
        }
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    
    .header {
        padding: 30px 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        animation: fadeInDown 1s ease;
    }
    
    .logo {
        display: flex;
        align-items: center;
        gap: 12px;
    }
    
    .logo-icon {
        width: 50px;
        height: 50px;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary);
        font-weight: bold;
        font-size: 24px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    
    .logo-text {
        font-size: 28px;
        font-weight: 700;
        color: white;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
    .tagline {
        color: rgba(255, 255, 255, 0.8);
        font-size: 16px;
        font-weight: 400;
        margin-top: 4px;
    }
    
    .main-content {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 0;
    }
    
    .form-container {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        padding: 50px;
        width: 100%;
        max-width: 500px;
        animation: fadeInUp 1s ease;
        border: 1px solid rgba(255, 255, 255, 0.3);
    }
    
    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
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
    
    .form-header {
        margin-bottom: 30px;
        text-align: center;
    }
    
    .form-header h1 {
        font-size: 32px;
        font-weight: 700;
        color: var(--dark);
        margin-bottom: 10px;
    }
    
    .form-header p {
        color: var(--secondary);
        font-size: 16px;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        font-weight: 500;
        color: var(--dark);
    }
    
    .form-control {
        width: 100%;
        padding: 14px 16px;
        border: 1px solid var(--border);
        border-radius: 10px;
        font-size: 16px;
        transition: all 0.3s ease;
        background: white;
    }
    
    .form-control:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        transform: translateY(-2px);
    }
    
    .btn {
        width: 100%;
        padding: 16px;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }
    
    .btn-primary {
        background: var(--primary);
        color: white;
        margin-bottom: 20px;
        box-shadow: 0 4px 15px rgba(37, 99, 235, 0.3);
    }
    
    .btn-primary:hover {
        background: var(--primary-dark);
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4);
    }
    
    .login-section {
        text-align: center;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid var(--border);
    }
    
    .login-section p {
        color: var(--secondary);
        font-size: 15px;
    }
    
    .login-section a {
        color: var(--primary);
        text-decoration: none;
        font-weight: 500;
        transition: all 0.2s ease;
    }
    
    .login-section a:hover {
        text-decoration: underline;
    }
    
    .footer {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border-top: 1px solid rgba(255, 255, 255, 0.2);
        padding: 20px 0;
        margin-top: auto;
    }
    
    .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .copyright {
        color: rgba(255, 255, 255, 0.8);
        font-size: 14px;
    }
    
    /* Unique Signature Stamp Design */
    .signature-stamp {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        position: relative;
    }
    
    .stamp-circle {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        background: linear-gradient(135deg, #ff0080, #8000ff);
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        animation: pulse 3s infinite;
        border: 3px solid rgba(255, 255, 255, 0.5);
    }
    
    @keyframes pulse {
        0% {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        50% {
            box-shadow: 0 5px 25px rgba(255, 0, 128, 0.6);
        }
        100% {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
    }
    
    .stamp-circle::before {
        content: '';
        position: absolute;
        width: 110px;
        height: 110px;
        border-radius: 50%;
        border: 2px dashed rgba(255, 255, 255, 0.7);
    }
    
    .signature-name {
        font-family: 'Dancing Script', cursive;
        font-size: 28px;
        font-weight: 700;
        color: white;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        letter-spacing: 1px;
        transform: rotate(-5deg);
    }
    
    .stamp-dots {
        position: absolute;
        width: 100%;
        height: 100%;
        border-radius: 50%;
    }
    
    .stamp-dots::before {
        content: '';
        position: absolute;
        width: 8px;
        height: 8px;
        background: white;
        border-radius: 50%;
        top: 10px;
        left: 50%;
        transform: translateX(-50%);
        box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
    }
    
    .stamp-dots::after {
        content: '';
        position: absolute;
        width: 8px;
        height: 8px;
        background: white;
        border-radius: 50%;
        bottom: 10px;
        left: 50%;
        transform: translateX(-50%);
        box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
    }
    
    .signature-label {
        margin-top: 8px;
        font-size: 12px;
        color: rgba(255, 255, 255, 0.8);
        font-weight: 500;
        letter-spacing: 1px;
    }
    
    .features {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 16px;
        margin: 30px 0;
    }
    
    .feature {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 12px;
        border-radius: 8px;
        background: rgba(37, 99, 235, 0.05);
        transition: all 0.2s ease;
    }
    
    .feature:hover {
        background: rgba(37, 99, 235, 0.1);
        transform: translateY(-2px);
    }
    
    .feature-icon {
        width: 24px;
        height: 24px;
        background: var(--primary);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 12px;
    }
    
    .feature-text {
        font-size: 14px;
        color: var(--dark);
        font-weight: 500;
    }
    
    .password-strength {
        height: 6px;
        background: rgba(0, 0, 0, 0.1);
        border-radius: 3px;
        margin-top: 8px;
        overflow: hidden;
    }
    
    .strength-bar {
        height: 100%;
        width: 0;
        border-radius: 3px;
        transition: all 0.3s ease;
    }
    
    .strength-weak {
        background: #EF4444;
        width: 33%;
    }
    
    .strength-medium {
        background: #F59E0B;
        width: 66%;
    }
    
    .strength-strong {
        background: #10B981;
        width: 100%;
    }
    
    @media (max-width: 768px) {
        .form-container {
            padding: 30px 20px;
        }
        
        .features {
            grid-template-columns: 1fr;
        }
        
        .header {
            flex-direction: column;
            gap: 15px;
            text-align: center;
        }
        
        .footer-content {
            flex-direction: column;
            gap: 20px;
        }
        
        .stamp-circle {
            width: 100px;
            height: 100px;
        }
        
        .stamp-circle::before {
            width: 90px;
            height: 90px;
        }
        
        .signature-name {
            font-size: 22px;
        }
    }
</style>
</head>
<body>
    <div class="disco-lights">
        <div class="light-beam"></div>
        <div class="light-beam"></div>
        <div class="light-beam"></div>
        <div class="light-beam"></div>
    </div>
    
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    
    <div class="container">
        <div class="header">
            <div class="logo">
                <div class="logo-icon">R</div>
                <div>
                    <div class="logo-text">ResumeBuilder</div>
                    <div class="tagline">Craft your professional story</div>
                </div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="form-container">
                <div class="form-header">
                    <h1>Create Your Account</h1>
                    <p>Join thousands of professionals building standout resumes</p>
                </div>
                
                <form action="Registeruser" method="post" id="registrationForm">
                    <div class="form-group">
                        <label for="name">Username</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Enter your username" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Create a secure password" required>
                        <div class="password-strength">
                            <div class="strength-bar" id="passwordStrength"></div>
                        </div>
                    </div>
                    
                    <div class="features">
                        <div class="feature">
                            <div class="feature-icon">✓</div>
                            <div class="feature-text">Professional Templates</div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon">✓</div>
                            <div class="feature-text">ATS-Friendly Formatting</div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon">✓</div>
                            <div class="feature-text">Easy Export Options</div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon">✓</div>
                            <div class="feature-text">Career Tips & Guidance</div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">
                        Create Account
                    </button>
                </form>
                
                <div class="login-section">
                    <p>Already have an account? <a href="login.jsp">Sign in here</a></p>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div class="footer-content">
                <div class="copyright">© 2025 ResumeBuilder. All rights reserved.</div>
                <div class="signature-stamp">
                    <div class="stamp-circle">
                        <div class="stamp-dots"></div>
                        <div class="signature-name">nagaraju</div>
                    </div>
                    <div class="signature-label">DESIGNER</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Password strength indicator
        const passwordInput = document.getElementById('password');
        const strengthBar = document.getElementById('passwordStrength');
        
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;
            
            // Check password length
            if (password.length >= 8) strength++;
            
            // Check for mixed case
            if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength++;
            
            // Check for numbers
            if (password.match(/([0-9])/)) strength++;
            
            // Check for special characters
            if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength++;
            
            // Update strength bar
            strengthBar.className = 'strength-bar';
            if (password.length > 0) {
                if (strength < 2) {
                    strengthBar.classList.add('strength-weak');
                } else if (strength < 4) {
                    strengthBar.classList.add('strength-medium');
                } else {
                    strengthBar.classList.add('strength-strong');
                }
            }
        });
        
        // Form validation
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            const username = document.getElementById('name').value;
            const password = document.getElementById('password').value;
            
            // Simple validation
            if (username.length < 3) {
                alert('Username must be at least 3 characters long');
                e.preventDefault();
                return;
            }
            
            if (password.length < 6) {
                alert('Password must be at least 6 characters long');
                e.preventDefault();
                return;
            }
            
            // If validation passes, form will submit normally
        });
        
        // Add floating animation to features
        document.querySelectorAll('.feature').forEach((feature, index) => {
            feature.style.animationDelay = `${index * 0.1}s`;
        });
    </script>
</body>
</html>