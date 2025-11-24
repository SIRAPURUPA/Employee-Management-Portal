<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Performance Report</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f5f5f5;
        }
        .container-box {
            margin-top: 60px;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            max-width: 550px;
        }

        /* Inline Alert Styling */
        .alert-inline {
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            padding: 5px 18px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 15px;
        }
    </style>
</head>

<body>

    <!-- EMPLOYEE NAVBAR -->
    <jsp:include page="employee_navbar.jsp" />

    <!-- Inline Alert -->
    <%
        String msg = (String) request.getAttribute("msg");
        String msgType = (String) request.getAttribute("msgType");
    %>

    <% if (msg != null) { %>
    <div class="alert-inline"
         style="
            background-color: <%= "success".equals(msgType) ? "#d4edda" : "#f8d7da" %>;
            color: <%= "success".equals(msgType) ? "#155724" : "#721c24" %>;
            border: 1px solid <%= "success".equals(msgType) ? "#c3e6cb" : "#f5c6cb" %>;
         ">
        <%= msg %>
    </div>

    <script>
        setTimeout(() => {
            const alertBox = document.querySelector(".alert-inline");
            if (alertBox) {
                alertBox.style.transition = "0.5s";
                alertBox.style.opacity = "0";
                setTimeout(() => alertBox.remove(), 500);
            }
        }, 3000);
    </script>
    <% } %>

    <!-- Form Container -->
    <div class="container d-flex justify-content-center">
        <div class="container-box">

            <div class="header text-center mb-3">
                <h2>Add Performance Report</h2>
                <p class="text-muted">Upload your PDF or text report</p>
            </div>

            <form action="AddReport" method="post" enctype="multipart/form-data">

                <!-- Employee ID -->
                <div class="mb-3">
                    <label class="form-label">Employee ID</label>
                    <input type="text" name="empId" class="form-control"
                           value="<%= session.getAttribute("empId") %>" readonly>
                </div>

                <!-- Employee Name -->
                <div class="mb-3">
                    <label class="form-label">Employee Name</label>
                    <input type="text" name="empName" class="form-control"
                           value="<%= session.getAttribute("empName") %>" readonly>
                </div>

                <!-- Report Title -->
                <div class="mb-3">
                    <label class="form-label">Report Title</label>
                    <input type="text" name="reportTitle" class="form-control"
                           placeholder="Enter title" required>
                </div>

                <!-- Report Date -->
                <div class="mb-3">
                    <label class="form-label">Report Date</label>
                    <input type="date" name="reportDate" class="form-control" required>
                </div>

                <!-- Upload File -->
                <div class="mb-3">
                    <label class="form-label">Upload Report (PDF or TXT)</label>
                    <input type="file" name="reportFile" class="form-control"
                           accept=".pdf,.txt" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Upload</button>
            </form>

        </div>
    </div>

</body>
</html>
