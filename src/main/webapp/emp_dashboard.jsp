<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Prevent access without login
    if (session.getAttribute("empName") == null) {
        response.sendRedirect("employee_login.jsp");
        return;
    }

    String empName = (String) session.getAttribute("empName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard | Employee Management Portal</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }

        .content {
    		margin-left: 300px;
    		padding: 30px;
		}


        /* Cards */
        .card-box {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            flex: 1;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.15);
        }

        .card h3 {
            margin-top: 0;
            font-size: 20px;
        }

        .card a {
            display: inline-block;
            margin-top: 12px;
            padding: 8px 14px;
            background: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .banner {
            background: linear-gradient(45deg, #1abc9c, #16a085);
            color: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 3px 6px #ccc;
            text-align: center;
        }

    </style>
</head>
<body>

<jsp:include page="employee_navbar.jsp" />

<div class="content">

    <h1 style="font-size: 32px; margin-bottom: 10px;">Welcome, <%= empName %> 👋</h1>
    <p style="color: #555; font-size: 18px; margin-bottom: 30px;">
        Here’s a quick overview of your performance and profile.
    </p>

    <!-- Dashboard Cards -->
    <div class="card-box">

        <!-- Profile -->
        <div class="card">
            <h3>My Profile</h3>
            <p>View your personal and work details.</p>
            <a href="emp_profile.jsp">View Profile →</a>
        </div>

        <!-- Add Report -->
        <div class="card" style="background: #ecf9ec;">
            <h3>Add Performance Report</h3>
            <p>Submit your performance update.</p>
            <a href="emp_add_report.jsp" style="background:#27ae60;">Add Report →</a>
        </div>

        <!-- View Reports -->
        <div class="card" style="background: #f7ecff;">
            <h3>My Reports</h3>
            <p>View all your submitted performance reports.</p>
            <a href="emp_view_reports.jsp" style="background:#8e44ad;">View Reports →</a>
        </div>

    </div>

    <!-- Motivational Banner -->
    <div class="banner">
        <h2>Your Growth Matters!</h2>
        <p style="font-size: 18px; margin-top: 8px;">Keep learning and achieving great results every day.</p>
    </div>

</div>

</body>
</html>
