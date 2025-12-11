<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume Saved</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(to right, #e0f7fa, #ffffff);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: #fff;
        padding: 40px 60px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        text-align: center;
        width: 400px;
    }

    h2 {
        color: #2e8b57;
        margin-bottom: 10px;
    }

    p {
        color: #555;
        margin-bottom: 30px;
        font-size: 16px;
    }

    .success-icon {
        font-size: 60px;
        color: #2ecc71;
        margin-bottom: 15px;
    }

    a {
        text-decoration: none;
        background-color: #0077b6;
        color: white;
        padding: 10px 25px;
        border-radius: 6px;
        font-weight: bold;
        transition: background 0.3s ease;
    }

    a:hover {
        background-color: #005f8d;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="success-icon">✔️</div>
        <h2>Resume Saved Successfully!</h2>
        <p>Your resume details have been stored in the database.</p>
        <a href="dashboard.jsp">Go Back to Dashboard</a>
    </div>
</body>
</html>
