package com.empManagement;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dataBase.FetchNameByMail;

@WebServlet("/EmployeeLogin")
public class EmployeeLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Fetch Name using your utility class
        String empName = FetchNameByMail.getEmpName(email);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management",
                    "root",
                    "admin"
            );

            // Fetch complete employee details
            String sql = "SELECT * FROM employee WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String dbPassword = rs.getString("password");

                if (dbPassword.equals(password)) {

                    // Fetch details
                    String empId = rs.getString("empId");
                    String empDept = rs.getString("department");
                    String empRole = rs.getString("role");

                    // Create session
                    HttpSession session = request.getSession();
                    session.setAttribute("empId", empId);
                    session.setAttribute("empName", empName);
                    session.setAttribute("empEmail", email);
                    session.setAttribute("empDept", empDept);
                    session.setAttribute("empRole", empRole);

                    response.sendRedirect("emp_dashboard.jsp");

                } else {
                    // Password mismatch
                    request.setAttribute("passwordError", "Incorrect password!");
                    request.setAttribute("emailValue", email);
                    request.getRequestDispatcher("employee_login.jsp").forward(request, response);
                }

            } else {
                // Email not found
                request.setAttribute("empError", "Employee email does not exist!");
                request.getRequestDispatcher("employee_login.jsp").forward(request, response);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("dbError", "Database connection failed!");
            request.getRequestDispatcher("employee_login.jsp").forward(request, response);
        }
    }
}
