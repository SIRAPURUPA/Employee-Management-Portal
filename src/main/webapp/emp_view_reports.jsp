<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Performance Reports</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f4f6f9;
        }
        .container{
        	width:1000px;
        	margin-left:270px;
        }
        .page-box {
            margin-top: 40px;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        table th {
            background-color: #2c3e50;
            color: white;
        }
        .small-action {
            padding: 4px 8px;
            font-size: 12px;
        }
    </style>
</head>

<body>

<jsp:include page="employee_navbar.jsp" />

<div class="container page-box">

    <h3 class="text-center mb-4">My Performance Reports</h3>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Report ID</th>
                <th>Title</th>
                <th>Date</th>
                <th style="width: 220px;">Actions</th>
            </tr>
        </thead>

        <tbody>
        <%
            String empId = (String) session.getAttribute("empId");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

                String sql = "SELECT * FROM performance_reports WHERE emp_id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, empId);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int reportId = rs.getInt("report_id");
                    String title = rs.getString("report_title");
                    String date = rs.getString("report_date");
        %>

        <tr>
            <td><%= reportId %></td>
            <td><%= title %></td>
            <td><%= date %></td>

            <td>

                <!-- Update -->
                <a href="emp_edit_report.jsp?reportId=<%= reportId %>"
                   class="btn btn-sm btn-warning small-action">Update</a>

                <!-- Download -->
                <a href="DownloadReport?reportId=<%= reportId %>"
                   class="btn btn-sm btn-primary small-action">Download</a>

                <!-- Delete -->
                <a href="DeleteReport?reportId=<%= reportId %>"
                   class="btn btn-sm btn-danger small-action"
                   onclick="return confirm('Are you sure you want to delete?')">Delete</a>

            </td>
        </tr>

        <%
                }

                rs.close();
                ps.close();
                con.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>

    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
