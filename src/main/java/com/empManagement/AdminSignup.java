package com.empManagement;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataBase.InsertDetails;

@WebServlet("/AdminSignup")
public class AdminSignup extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        System.out.println(fullName);
        System.out.println(email);
        System.out.println(password);
        System.out.println(confirmPassword);
        
        InsertDetails id = new InsertDetails();
        
        id.insertToAdmin(fullName, email, password);
        
        HttpSession session = request.getSession();
        session.setAttribute("name", fullName);
        
        response.sendRedirect("admin_dashboard.jsp");
    }
}
