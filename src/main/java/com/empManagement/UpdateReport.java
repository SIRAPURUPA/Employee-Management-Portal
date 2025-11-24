package com.empManagement;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateReport")
@MultipartConfig(maxFileSize = 10 * 1024 * 1024)
public class UpdateReport extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportId = request.getParameter("reportId");
        String title = request.getParameter("reportTitle");
        String date = request.getParameter("reportDate");

        Part filePart = request.getPart("reportFile");
        InputStream fileStream = null;

        boolean newFileUploaded = filePart != null && filePart.getSize() > 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

            PreparedStatement ps;

            if (newFileUploaded) {
                ps = con.prepareStatement(
                    "UPDATE performance_reports SET report_title=?, report_date=?, report_file=? WHERE report_id=?"
                );
                fileStream = filePart.getInputStream();
                ps.setBinaryStream(3, fileStream);
                ps.setString(4, reportId);

            } else {
                ps = con.prepareStatement(
                    "UPDATE performance_reports SET report_title=?, report_date=? WHERE report_id=?"
                );
                ps.setString(3, reportId);
            }

            ps.setString(1, title);
            ps.setString(2, date);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("emp_view_reports.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
