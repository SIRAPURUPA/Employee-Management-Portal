<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee | Admin</title>
<style>
    body{
        font-family: Arial, sans-serif;
        margin:0;
        padding:0;
        background:#f5f5f5;
    }
    .container{
        width:450px;
        background:white;
        margin:60px auto;
        padding:25px;
        box-shadow:0 0 10px rgba(0,0,0,0.1);
        border-radius:8px;
    }
    h2{
        text-align:center;
        margin-bottom:20px;
    }
    label{
        font-weight:bold;
    }
    input, select{
        width:100%;
        padding:10px;
        margin-top:5px;
        margin-bottom:15px;
        border:1px solid #aaa;
        border-radius:5px;
    }
    button{
        width:100%;
        padding:10px;
        background:#007bff;
        color:white;
        border:none;
        font-size:16px;
        border-radius:5px;
        cursor:pointer;
    }
    button:hover{
        background:#0056b3;
    }
    .success{
        color:green;
        text-align:center;
        margin-bottom:10px;
    }
</style>
</head>
<body>

<div class="container">
	<%@ include file="admin_navbar.jsp" %>
    <h2>Add Employee</h2>

    <form action="AddEmployee" method="post">

        <label>Employee ID</label>
        <input type="text" name="empId" required>

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Department</label>
        <input type="text" name="department" required>

        <label>Role</label>
        <input type="text" name="role" required>

        <button type="submit">Add Employee</button>

    </form>

</div>

</body>
</html>
