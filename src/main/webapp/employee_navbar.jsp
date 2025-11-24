<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Panel</title>

    <style>
        /* Sidebar Styles */
        .sidebar {
            width: Auto;
            height: 100vh;
            background: #2c3e50;
            padding: 20px;
            position: fixed;
            left: 0;
            top: 0;
            color: white;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            display: block;
            padding: 12px 15px;
            margin: 10px 0;
            background: #34495e;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .sidebar a:hover {
            background: #1abc9c;
        }

        .sidebar .btn-danger {
            background: #e74c3c !important;
        }

        .sidebar .btn-danger:hover {
            background: #c0392b !important;
        }

        /* Page content when sidebar is present */
        .content {
            margin-left: 260px;
            padding: 25px;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Employee Panel</h2>

        <a href="emp_dashboard.jsp">Dashboard</a>
        <a href="emp_profile.jsp">My Profile</a>
        <a href="emp_add_report.jsp">Add Performance Report</a>
        <a href="emp_view_reports.jsp">View My Reports</a>

        <a href="LogoutEmp" class="btn-danger">Logout</a>
    </div>

</body>
</html>
