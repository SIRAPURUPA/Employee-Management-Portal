<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Signup | Employee Management Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .signup-container {
            background: #ffffff;
            width: 400px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #aaa;
        }
        .btn {
            width: 100%;
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background: #218838;
        }
        .error {
            color: #d8000c;
            background: #ffdddd;
            border-left: 4px solid #d8000c;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .success {
            color: #155724;
            background: #d4edda;
            border-left: 4px solid #28a745;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
        .login-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<script>
    function checkPasswordMatch() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        const message = document.getElementById("passwordMessage");

        if (confirmPassword.length === 0) {
            message.innerHTML = "";
            return;
        }

        if (password === confirmPassword) {
            message.style.color = "green";
            message.innerHTML = "✔ Passwords match";
        } else {
            message.style.color = "red";
            message.innerHTML = "✘ Passwords do not match";
        }
    }
</script>
<body>

<div class="signup-container">
    <h2>Admin Signup</h2>
    
    <form action="AdminSignup" method="post">
        <div class="form-group">
            <label for="fullName">Full Name</label>
            <input required type="text" id="fullName" name="fullName" placeholder="Enter full name">
        </div>
        
        <div class="form-group">
            <label for="email">Email</label>
            <input required type="email" id="email" name="email" placeholder="Enter email">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input required type="password" id="password" name="password" placeholder="Create password">
        </div>

       <div class="form-group">
    	<label for="confirmPassword">Confirm Password</label>
    	<input required type="password" id="confirmPassword" name="confirmPassword"
           placeholder="Re-enter password" onkeyup="checkPasswordMatch()">
    	<small id="passwordMessage" style="font-size: 14px;"></small>
	   </div>


        <button type="submit" class="btn">Sign Up</button>
    </form>

    <div class="login-link">
        Already have an account?
        <a href="admin_login.jsp">Login here</a>
    </div>

</div>

</body>
</html>