package com.empManagement;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DownloadReport")
public class DownloadReport extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportId = request.getParameter("reportId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

            String sql = "SELECT report_title, report_file FROM performance_reports WHERE report_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, reportId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String title = rs.getString("report_title");
                InputStream fileData = rs.getBinaryStream("report_file");

                // Always download
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition",
                        "attachment; filename=\"" + title + ".txt\"");

                byte[] buffer = new byte[4096];
                int bytesRead;

                while ((bytesRead = fileData.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }

                fileData.close();
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
