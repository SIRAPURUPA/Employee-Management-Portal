package com.empManagement;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RateReport")
public class RateReport extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportId = request.getParameter("report_id");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee_management", "root", "admin"
            );

            String sql = "UPDATE performance_reports SET rating=?, admin_comment=? WHERE report_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, rating);
            ps.setString(2, comment);
            ps.setString(3, reportId);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin_view_reports.jsp?msg=RatedSuccessfully");
    }
}
