<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume</title>

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #f8f9fa);
        margin: 0;
        padding: 0;
    }

    .resume-box {
        width: 70%;
        margin: 50px auto;
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 4px 25px rgba(0, 0, 0, 0.15);
        padding: 40px;
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(25px);}
        to {opacity: 1; transform: translateY(0);}
    }

    .header {
        text-align: center;
        border-bottom: 3px solid #007bff;
        padding-bottom: 15px;
    }

    .header h1 {
        margin: 0;
        color: #007bff;
        font-size: 34px;
    }

    .header p {
        color: #555;
        font-size: 15px;
        margin: 5px 0;
    }

    .section {
        margin-top: 30px;
    }

    .section h2 {
        color: #007bff;
        border-left: 5px solid #007bff;
        padding-left: 10px;
        margin-bottom: 10px;
        font-size: 20px;
    }

    .section p {
        margin: 0 0 10px 0;
        color: #333;
        line-height: 1.6;
    }

    .btn-container {
        text-align: center;
        margin-top: 30px;
    }

    .btn-container a {
        text-decoration: none;
        background: #007bff;
        color: white;
        padding: 10px 22px;
        border-radius: 8px;
        transition: 0.3s;
    }

    .btn-container a:hover {
        background: #0056b3;
    }
</style>
</head>

<body>

<div class="resume-box">
    <div class="header">
        <h1>${first_name} ${last_name}</h1>
        <p>${email}</p>
        <p>${phone_number}</p>
        <p>${address}</p>
    </div>

    <div class="section">
        <h2>Education</h2>
        <p>${education}</p>
    </div>

    <div class="section">
        <h2>Skills</h2>
        <p>${skills}</p>
    </div>

    <div class="section">
        <h2>Experience</h2>
        <p>${experience}</p>
    </div>

    <div class="section">
        <h2>Projects</h2>
        <p>${projects}</p>
    </div>

    <div class="section">
        <h2>Citizenship</h2>
        <p>${citizenship}</p>
    </div>

    <div class="btn-container">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
