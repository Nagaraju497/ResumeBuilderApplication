<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Resume</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(to right, #83a4d4, #b6fbff);
    padding: 40px;
    margin: 0;
}
.container {
    width: 55%;
    margin: auto;
    background: #fff;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}
h2 {
    text-align: center;
    color: #333;
    margin-bottom: 25px;
}
label {
    font-weight: 600;
    color: #333;
}
input, textarea, select {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
}
input[type="submit"] {
    background-color: #007BFF;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 16px;
    padding: 12px;
    border-radius: 8px;
    transition: 0.3s ease;
}
input[type="submit"]:hover {
    background-color: #0056b3;
}
</style>
</head>

<body>
<div class="container">
    <h2>Create Your Resume</h2>
    <form action="SaveResume" method="post">

        <label>First Name:</label>
        <input type="text" name="first_name" required>

        <label>Last Name:</label>
        <input type="text" name="last_name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Phone Number:</label>
        <input type="text" name="phone_number" required>

        <label>Address:</label>
        <textarea name="address" rows="2" required></textarea>

        <label>Education:</label>
        <textarea name="education" rows="3" required></textarea>

        <label>Skills:</label>
        <textarea name="skills" rows="3" required></textarea>

        <label>Experience:</label>
        <textarea name="experience" rows="3"></textarea>

        <label>Projects:</label>
        <textarea name="projects" rows="3"></textarea>

        <label>Citizenship:</label>
        <input type="text" name="citizenship">

        <label>Select Resume Template:</label>
        <select name="template" required>
            <option value="template1">Modern Blue</option>
            <option value="template2">Professional Gray</option>
            <option value="template3">Creative Orange</option>
        </select>

        <input type="submit" value="Save Resume">
    </form>
</div>
</body>
</html>
