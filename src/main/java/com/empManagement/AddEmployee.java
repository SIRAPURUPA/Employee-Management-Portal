package com.empManagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dataBase.AddEmpDetails;

@WebServlet("/AddEmployee")
public class AddEmployee extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String empId = request.getParameter("empId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String role = request.getParameter("role");

        String password = empId;  // Employee ID = Password

        boolean result = AddEmpDetails.insertEmployee(empId, name, email, department, role, password);

        if (result) {

            response.setContentType("text/html");
            response.getWriter().println(
                "<script type='text/javascript'>"
                + "alert('Employee Added Successfully!');"
                + "window.location='add_employee.jsp';"
                + "</script>"
            );

        } else {

            response.setContentType("text/html");
            response.getWriter().println(
                "<script type='text/javascript'>"
                + "alert('Failed to Add Employee!');"
                + "window.location='add_employee.jsp';"
                + "</script>"
            );
        }
    }
}
