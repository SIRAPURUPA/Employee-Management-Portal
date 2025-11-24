<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Login | Employee Management Portal</title>
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
        .login-container {
            background: #ffffff;
            width: 350px;
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
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #aaa;
        }
        .note {
            font-size: 12px;
            color: #555;
            margin-top: 5px;
        }
        .btn {
            width: 100%;
            background: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background: #0056b3;
        }
        .error-msg {
            color: #d8000c;
            font-size: 13px;
            margin-top: 3px;
        }
        .switch-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }
        .switch-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
    
</head>
<body>

<div class="login-container">
    <h2>Employee Login</h2>

    <form method="post" action="EmployeeLogin">
        <div class="form-group">
            <label for="email">Employee Email</label>
            <input required type="text" id="email" name="email" placeholder="Enter Employee Email">
            <div class="error-msg">${empError}</div>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input required type="password" id="password" name="password" placeholder="Enter password">
            <div class="note">* Your default password is your Employee ID</div>
            <div class="error-msg">${passwordError}</div>
        </div>

        <button type="submit" class="btn">Login</button>

        <div class="switch-link">
            Admin Login?  
            <a href="admin_login.jsp">Click Here</a>
        </div>
    </form>

</div>

</body>
</html>
