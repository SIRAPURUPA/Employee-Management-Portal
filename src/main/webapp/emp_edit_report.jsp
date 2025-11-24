<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
    String reportId = request.getParameter("reportId");
    String empId = "";
    String empName = "";
    String reportTitle = "";
    String reportDate = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

        String sql = "SELECT emp_id, emp_name, report_title, report_date FROM performance_reports WHERE report_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, reportId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            empId = rs.getString("emp_id");
            empName = rs.getString("emp_name");
            reportTitle = rs.getString("report_title");
            reportDate = rs.getString("report_date");
        }
        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Report</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<jsp:include page="employee_navbar.jsp" />

<div class="container mt-5">

    <div class="card shadow p-4" style="max-width: 600px; margin:auto;">
        <h3 class="text-center mb-3">Edit Performance Report</h3>

        <form action="UpdateReport" method="post" enctype="multipart/form-data">

            <input type="hidden" name="reportId" value="<%= reportId %>">

            <div class="mb-3">
                <label>Employee ID</label>
                <input type="text" class="form-control" value="<%= empId %>" readonly>
            </div>

            <div class="mb-3">
                <label>Employee Name</label>
                <input type="text" class="form-control" value="<%= empName %>" readonly>
            </div>

            <div class="mb-3">
                <label>Report Title</label>
                <input type="text" name="reportTitle" class="form-control"
                       value="<%= reportTitle %>" required>
            </div>

            <div class="mb-3">
                <label>Report Date</label>
                <input type="date" name="reportDate" class="form-control"
                       value="<%= reportDate %>" required>
            </div>

            <div class="mb-3">
                <label>Upload New File (optional)</label>
                <input type="file" name="reportFile" class="form-control" accept=".pdf,.txt">
                <small class="text-muted">Leave empty to keep existing file</small>
            </div>

            <button class="btn btn-primary w-100">Update Report</button>

        </form>
    </div>

</div>

</body>
</html>
