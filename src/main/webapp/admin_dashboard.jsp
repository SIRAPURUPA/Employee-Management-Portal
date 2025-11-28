<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession, java.sql.*, java.io.IOException" %>

<%
    // Protect dashboard – only logged-in admins allowed
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null || sessionObj.getAttribute("name") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    String adminName = sessionObj.getAttribute("name").toString();
%>

<%
    int totalEmployees = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

        String query = "SELECT COUNT(*) FROM employee";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            totalEmployees = rs.getInt(1);
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Employee Management Portal</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .sidebar {
            width: 230px;
            height: 100vh;
            background: #343a40;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        .sidebar a:hover {
            background: #495057;
        }

        .content {
            margin-left: 230px;
            padding: 20px;
        }

        .topbar {
            background: white;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 0 5px rgba(0,0,0,0.15);
            font-size: 18px;
        }

        .card-container {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background: white;
            padding: 30px;
            flex: 1;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            text-align: center;
        }

        .card h3 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        .card p {
            font-size: 16px;
            margin-bottom: 15px;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 15px;
        }

        .btn:hover {
            background: #218838;
        }

        .btn-danger {
            background: #dc3545;
        }

        .btn-danger:hover {
            background: #b52a38;
        }
    </style>

</head>
<body>

    <%@ include file="admin_navbar.jsp" %>

    <!-- Main Content -->
    <div class="content">

        <!-- Top Bar -->
        <div class="topbar">
            Welcome, <strong><%= adminName %></strong>
        </div>

        <h2>Dashboard Overview</h2>

        <div class="card-container">

            <div class="card">
                <h3>Total Employees</h3>
                <p><%= totalEmployees %></p>
                <a href="view_employees.jsp" class="btn">View</a>
            </div>

            <div class="card">
                <h3>Add New Employee</h3>
                <p>Create a new employee record</p>
                <a href="add_employee.jsp" class="btn">Add Employee</a>
            </div>
            
            <div class="card">
                <h3>View Employee Reports</h3>
                <p>Rate and do comment</p>
                <a href="admin_view_reports.jsp" class="btn">View Reports</a>
            </div>

            <div class="card">
                <h3>Logout</h3>
                <p>Securely end your session</p>
                <a href="Logout" class="btn btn-danger">Logout</a>
            </div>

        </div>

    </div>

</body>
</html>
