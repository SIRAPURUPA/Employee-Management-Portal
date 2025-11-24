<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Prevent access without login
    if (session.getAttribute("empId") == null) {
        response.sendRedirect("employee_login.jsp");
        return;
    }

    String empId = (String) session.getAttribute("empId");
    String empName = (String) session.getAttribute("empName");
    String empEmail = (String) session.getAttribute("empEmail");
    String empDept = (String) session.getAttribute("empDept");
    String empRole = (String) session.getAttribute("empRole");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | Employee Management Portal</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }

        /* Push content to the right because of the sidebar */
        .content {
            margin-left: 260px;
            padding: 40px;
            display: flex;                 /* Enable flexbox */
            justify-content: center;       /* Center horizontally */
        }

        .profile-card {
            background: white;
            width: 60%;
            max-width: 650px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .profile-card h2 {
            margin-top: 0;
            color: #34495e;
        }

        hr {
            border: none;
            height: 2px;
            background: #34495e;
            margin-bottom: 20px;
        }

        .info-row {
            margin-bottom: 15px;
            font-size: 18px;
        }

        .label {
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>

<body>

<jsp:include page="employee_navbar.jsp" />

<div class="content">
    <div class="profile-card">
        <h2>My Profile</h2>
        <hr>

        <div class="info-row">
            <span class="label">Employee ID:</span> <%= empId %>
        </div>

        <div class="info-row">
            <span class="label">Full Name:</span> <%= empName %>
        </div>

        <div class="info-row">
            <span class="label">Email:</span> <%= empEmail %>
        </div>

        <div class="info-row">
            <span class="label">Department:</span> <%= empDept %>
        </div>

        <div class="info-row">
            <span class="label">Role:</span> <%= empRole %>
        </div>

    </div>
</div>

</body>
</html>
