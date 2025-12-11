<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professional Gray Resume</title>
<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: #f0f0f0;
    padding: 40px;
}

.resume-box {
    background: #fff;
    width: 60%;
    margin: auto;
    border-left: 8px solid #555;
    border-radius: 10px;
    padding: 30px 40px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.2);
}

h2 {
    color: #333;
    margin-bottom: 10px;
    border-bottom: 2px solid #555;
    padding-bottom: 8px;
}

.section-title {
    font-weight: bold;
    color: #555;
    margin-top: 20px;
    border-bottom: 1px solid #ddd;
}

p {
    color: #333;
    margin: 8px 0;
}

/* Button container */
.btn-container {
    text-align: center;
    margin-top: 30px;
}

/* Button style */
.btn-container a {
    display: inline-block;
    text-decoration: none;
    background: #555;
    color: white;
    padding: 12px 25px;
    border-radius: 6px;
    font-weight: 500;
    transition: background 0.3s, transform 0.2s;
}

.btn-container a:hover {
    background: #333;
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

    <h3 class="section-title">Address</h3>
    <p>${address}</p>

    <h3 class="section-title">Citizenship</h3>
    <p>${citizenship}</p>

    <!-- Added Back Button -->
    <div class="btn-container">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </div>
</div>
</body>
</html>
