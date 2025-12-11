<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creative Orange Resume</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(to right, #ff9966, #ff5e62);
    padding: 50px;
}
.resume-box {
    background: white;
    border-radius: 15px;
    padding: 40px;
    width: 60%;
    margin: auto;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
}
h2 {
    color: #ff5e00;
    margin-bottom: 15px;
    border-bottom: 2px solid #ff9966;
}
.section-title {
    color: #ff5e00;
    margin-top: 25px;
    font-weight: bold;
}
p {
    color: #333;
}

/* Button container styling */
.btn-container {
    text-align: center;
    margin-top: 30px;
}

/* Back to Dashboard button styling */
.btn-container a {
    text-decoration: none;
    background-color: #ff5e00;
    color: white;
    padding: 12px 25px;
    border-radius: 8px;
    font-weight: 500;
    transition: background 0.3s, transform 0.2s;
}

.btn-container a:hover {
    background-color: #e04c00;
    transform: translateY(-2px);
}
</style>
</head>
<body>
<div class="resume-box">
    <h2>${first_name} ${last_name}</h2>
    <p><b>Email:</b> ${email}</p>
    <p><b>Phone:</b> ${phone_number}</p>

    <h3 class="section-title">Skills</h3>
    <p>${skills}</p>

    <h3 class="section-title">Experience</h3>
    <p>${experience}</p>

    <h3 class="section-title">Projects</h3>
    <p>${projects}</p>

    <!-- Back to Dashboard Button -->
    <div class="btn-container">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </div>
</div>
</body>
</html>
