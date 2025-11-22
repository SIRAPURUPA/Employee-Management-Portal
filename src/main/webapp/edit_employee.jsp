<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>

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
        background:#28a745;
        color:white;
        border:none;
        font-size:16px;
        border-radius:5px;
        cursor:pointer;
    }
    button:hover{
        background:#1e7e34;
    }
</style>
</head>
<body>

<%@ include file="admin_navbar.jsp" %>

<div class="container">

    <h2>Edit Employee</h2>

    <form action="UpdateEmployee" method="post">

        <label>Employee ID</label>
        <input type="text" name="empId" value="<%= request.getParameter("empId") %>" readonly>

        <%
            String empId = request.getParameter("empId");
            String name="", email="", department="", role="";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

                PreparedStatement ps = con.prepareStatement(
                    "SELECT name, email, department, role FROM employee WHERE empId=?");

                ps.setString(1, empId);
                ResultSet rs = ps.executeQuery();

                if(rs.next()){
                    name = rs.getString("name");
                    email = rs.getString("email");
                    department = rs.getString("department");
                    role = rs.getString("role");
                }
            } catch(Exception e){
                e.printStackTrace();
            }
        %>

        <label>Name</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= email %>" required>

        <label>Department</label>
        <input type="text" name="department" value="<%= department %>" required>

        <label>Role</label>
        <input type="text" name="role" value="<%= role %>" required>

        <button type="submit">Update Employee</button>

    </form>

</div>

</body>
</html>
