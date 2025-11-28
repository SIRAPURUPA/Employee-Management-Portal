<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/employee_management";
    String user = "root";
    String pass = "admin";

    List<Map<String,String>> results = new ArrayList<>();

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);

        String query = "SELECT report_id, emp_id, emp_name, report_title, report_date, rating, admin_comment FROM performance_reports";
        ps = con.prepareStatement(query);

        rs = ps.executeQuery();

        while (rs.next()) {
            Map<String,String> row = new HashMap<>();
            row.put("report_id", rs.getString("report_id"));
            row.put("emp_id", rs.getString("emp_id"));
            row.put("emp_name", rs.getString("emp_name"));
            row.put("report_title", rs.getString("report_title"));
            row.put("report_date", rs.getString("report_date"));
            row.put("rating", rs.getString("rating"));
            row.put("admin_comment", rs.getString("admin_comment"));
            results.add(row);
        }

    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - View Reports</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        .modal-bg {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.4);
            display: none;
            justify-content: center;
            align-items: center;
        }
        .modal-box {
            background: white;
            padding: 20px;
            width: 450px;
            border-radius: 8px;
        }
    </style>
</head>

<body class="bg-light">

<jsp:include page="admin_navbar.jsp"/>

<div class="container mt-4" style="width: 1100px; padding-left: 110px">
    <h2 class="mb-4 text-center">Admin - View Performance Reports</h2>

    <div class="card shadow-sm">
        <div class="card-body">

            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Report Title</th>
                        <th>Date</th>
                        <th>Rating</th>
                        <th>Comment</th>
                        <th>Download</th>
                        <th>Rate</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    for (Map<String,String> r : results) {
                %>
                    <tr>
                        <td><%= r.get("emp_id") %></td>
                        <td><%= r.get("emp_name") %></td>
                        <td><%= r.get("report_title") %></td>
                        <td><%= r.get("report_date") %></td>
                        <td><%= r.get("rating") == null ? "-" : r.get("rating") %></td>
                        <td><%= r.get("admin_comment") == null ? "-" : r.get("admin_comment") %></td>

                        <td>
                            <a class="btn btn-sm btn-success"
                               href="DownloadReport?reportId=<%= r.get("report_id") %>">Download</a>
                        </td>

                        <td>
                            <button class="btn btn-warning btn-sm"
                                    onclick="openRating('<%= r.get("report_id") %>')">
                                Rate
                            </button>
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>

        </div>
    </div>
</div>


<!-- Rating Modal -->
<div class="modal-bg" id="ratingModal">
    <div class="modal-box">
        <h5>Add Rating & Comment</h5>
        <form action="RateReport" method="post">
            <input type="hidden" id="modalReportId" name="report_id">

            <label>Rating (1–5)</label>
            <input type="number" name="rating" min="1" max="5" class="form-control mb-2" required>

            <label>Comment</label>
            <textarea name="comment" class="form-control mb-3" required></textarea>

            <button class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="closeRating()">Cancel</button>
        </form>
    </div>
</div>

<script>
function openRating(reportId) {
    document.getElementById("modalReportId").value = reportId;
    document.getElementById("ratingModal").style.display = "flex";
}

function closeRating() {
    document.getElementById("ratingModal").style.display = "none";
}
</script>

</body>
</html>
