package com.empManagement;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteReport")
public class DeleteReport extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportId = request.getParameter("reportId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management", "root", "admin");

            String sql = "DELETE FROM performance_reports WHERE report_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, reportId);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("emp_view_reports.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
