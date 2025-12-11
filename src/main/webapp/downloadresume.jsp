<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download Resume</title>
<style>
/* --- RESET & BASE --- */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
body {
    height: 100vh;
    background: linear-gradient(135deg, #141E30, #243B55);
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    color: white;
}

/* --- ANIMATED BACKGROUND --- */
body::before, body::after {
    content: "";
    position: absolute;
    width: 200%;
    height: 200%;
    top: -50%;
    left: -50%;
    background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
    animation: moveBackground 15s infinite linear;
}
@keyframes moveBackground {
    0% { transform: translate(0, 0) rotate(0deg); }
    100% { transform: translate(25%, 25%) rotate(360deg); }
}

/* --- MAIN CONTAINER --- */
.download-box {
    position: relative;
    z-index: 2;
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(15px);
    padding: 60px 80px;
    border-radius: 25px;
    text-align: center;
    box-shadow: 0 10px 40px rgba(0,0,0,0.5);
    animation: fadeIn 1.2s ease-in-out;
}
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

/* --- HEADING --- */
.download-box h1 {
    font-size: 32px;
    margin-bottom: 20px;
    background: linear-gradient(90deg, #00C9FF, #92FE9D);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
.download-box p {
    color: #ddd;
    margin-bottom: 35px;
    font-size: 15px;
}

/* --- BUTTONS --- */
button, a.btn {
    display: inline-block;
    text-decoration: none;
    background: linear-gradient(90deg, #00C9FF, #92FE9D);
    color: #111;
    font-weight: 600;
    padding: 14px 30px;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    font-size: 16px;
}
button:hover, a.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(0, 201, 255, 0.6);
}

/* --- SECONDARY BUTTON --- */
a.link {
    display: inline-block;
    margin-top: 25px;
    color: #00C9FF;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}
a.link:hover {
    color: #92FE9D;
}

/* --- GLOW EFFECT --- */
button::before, a.btn::before {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.6) 10%, transparent 10.01%);
    transform: translate(-50%, -50%) scale(0);
    transition: transform 0.4s, opacity 0.4s;
    opacity: 0;
}
button:hover::before, a.btn:hover::before {
    transform: translate(-50%, -50%) scale(1);
    opacity: 1;
}

/* --- BACK BUTTON --- */
a.back {
    display: inline-block;
    margin-top: 40px;
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    background: rgba(255,255,255,0.15);
    padding: 10px 25px;
    border-radius: 8px;
    border: 1px solid rgba(255,255,255,0.3);
    transition: 0.3s;
}
a.back:hover {
    background: rgba(255,255,255,0.3);
    transform: scale(1.05);
}

/* --- FLOATING ORBS --- */
.orb {
    position: absolute;
    border-radius: 50%;
    opacity: 0.15;
    animation: float 8s infinite ease-in-out;
}
.orb:nth-child(1) {
    width: 180px;
    height: 180px;
    background: #00C9FF;
    top: 10%;
    left: 10%;
    animation-delay: 0s;
}
.orb:nth-child(2) {
    width: 250px;
    height: 250px;
    background: #92FE9D;
    bottom: 15%;
    right: 15%;
    animation-delay: 2s;
}
.orb:nth-child(3) {
    width: 120px;
    height: 120px;
    background: #ffafbd;
    top: 60%;
    left: 25%;
    animation-delay: 4s;
}
@keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
}
</style>
</head>
<body>
    <!-- Floating animated elements -->
    <div class="orb"></div>
    <div class="orb"></div>
    <div class="orb"></div>

    <!-- Main content -->
    <div class="download-box">
        <h1>Download Your Resume</h1>
        <p>Ready to showcase your professional story? Download or preview your resume instantly.</p>

        <!-- PDF Download -->
        <form action="downloadresume" method="post">
            <button type="submit">⬇ Download Resume (PDF)</button>
        </form>

        <!-- Preview -->
        <br>
        <a href="PreviewResume" target="_blank" class="btn">👁 Preview Resume</a>

        <!-- Back -->
        <br><br>
        <a href="dashboard.jsp" class="back">← Back to Dashboard</a>
    </div>
</body>
</html>
