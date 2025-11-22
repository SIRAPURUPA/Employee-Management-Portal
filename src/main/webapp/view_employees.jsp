<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .content {
            margin-left: 260px;
            padding: 20px;
        }

        .table-wrapper {
            margin-top: 20px;
            max-height: 400px;
            overflow-y: auto;
            border: 1px solid #ccc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        table th {
            background-color: #34495e;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        table tr:nth-child(even) {
            background: #f2f2f2;
        }

        .search-box, .filter-box {
            padding: 8px;
            margin-right: 10px;
        }

        .action-btn {
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
        }

        .edit {
            background-color: #27ae60;
        }

        .delete {
            background-color: #e74c3c;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<%@ include file="admin_navbar.jsp" %>

<div class="content">

    <h2>All Employees</h2>

    <!-- Search + Filter Form -->
    <form method="get">
        <input type="text" name="search" placeholder="Search by name or email" class="search-box"
               value="<%= request.getParameter("search") == null ? "" : request.getParameter("search") %>">

        <select name="department" class="filter-box">
            <option value="">All Departments</option>
            <option value="HR">HR</option>
            <option value="IT">IT</option>
            <option value="Finance">Finance</option>
        </select>

        <button type="submit">Apply</button>
    </form>

    <div class="table-wrapper">
        <table>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>

            <%
                String url = "jdbc:mysql://localhost:3306/employee_management";
                String uname = "root";
                String pwd = "admin";

                String search = request.getParameter("search");
                if (search == null) search = "";

                String departmentFilter = request.getParameter("department");
                if (departmentFilter == null) departmentFilter = "";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, uname, pwd);

                    String query = "SELECT * FROM employee WHERE (name LIKE ? OR email LIKE ?)";

                    if (!departmentFilter.isEmpty()) {
                        query += " AND department = ?";
                    }

                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, "%" + search + "%");
                    ps.setString(2, "%" + search + "%");

                    if (!departmentFilter.isEmpty()) {
                        ps.setString(3, departmentFilter);
                    }

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString("empId") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("department") %></td>
                <td><%= rs.getString("role") %></td>

                <td>
                    <a href="edit_employee.jsp?empId=<%= rs.getString("empId") %>" class="action-btn edit">Edit</a>
                    <a href="DeleteEmployee?empId=<%= rs.getString("empId") %>"
   						onclick="return confirm('Are you sure you want to delete this employee?');"
   						class="action-btn delete">
   					Delete
					</a>
                </td>
            </tr>

            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error loading employees!</p>");
                    e.printStackTrace();
                }
            %>
        </table>
    </div>

</div>

</body>
</html>
