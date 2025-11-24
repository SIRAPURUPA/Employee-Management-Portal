package com.empManagement;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddReport")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 12
)
public class AddReport extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("empId") == null) {
                response.sendRedirect("employee_login.jsp");
                return;
            }

            String empId = (String) session.getAttribute("empId");
            String empName = (String) session.getAttribute("empName");

            String reportTitle = request.getParameter("reportTitle");
            String reportDate = request.getParameter("reportDate");

            Part reportPart = request.getPart("reportFile");

            if (reportPart == null || reportPart.getSize() == 0) {
                request.setAttribute("msg", "Please upload a file!");
                request.setAttribute("msgType", "error");
                request.getRequestDispatcher("emp_add_report.jsp").forward(request, response);
                return;
            }

            InputStream fileInputStream = reportPart.getInputStream();

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

            String sql = "INSERT INTO performance_reports (emp_id, emp_name, report_title, report_date, report_file) VALUES (?, ?, ?, ?, ?)";

            ps = con.prepareStatement(sql);
            ps.setString(1, empId);
            ps.setString(2, empName);
            ps.setString(3, reportTitle);
            ps.setString(4, reportDate);
            ps.setBlob(5, fileInputStream);

            int rows = ps.executeUpdate();

            // clean temp file to avoid WARN
            try { reportPart.delete(); } catch (Exception ignored) {}

            if (rows > 0) {
                request.setAttribute("msg", "Report Uploaded Successfully!");
                request.setAttribute("msgType", "success");
            } else {
                request.setAttribute("msg", "Failed to Upload Report");
                request.setAttribute("msgType", "error");
            }

            request.getRequestDispatcher("emp_add_report.jsp").forward(request, response);
            return;

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error: " + e.getMessage());
            request.setAttribute("msgType", "error");
            request.getRequestDispatcher("emp_add_report.jsp").forward(request, response);
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignore) {}
            try { if (con != null) con.close(); } catch (Exception ignore) {}
        }
    }
}
