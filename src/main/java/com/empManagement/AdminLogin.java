package com.empManagement;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dataBase.FetchNameByMail;
import com.dataBase.InsertDetails;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = FetchNameByMail.getName(email);
        		
        InsertDetails id = new InsertDetails();
        int result = id.checkCredentials(email, password);

        if (result == 0) {
            request.setAttribute("emailError", "Email does not exist");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            return;
        }

        if (result == -1) {
            request.setAttribute("passwordError", "Incorrect password");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("name", fullName);

        response.sendRedirect("admin_dashboard.jsp");
    }
}
