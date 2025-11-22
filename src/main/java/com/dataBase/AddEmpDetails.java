package com.dataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddEmpDetails {
	static String url = "jdbc:mysql://localhost:3306/employee_management";
	static String user = "root";
	static String pwd = "admin";
	
	public static boolean insertEmployee(String eid,String ename,String email,String edept,String erole, String epwd) {
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pwd);

        String query = "INSERT INTO employee VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, eid);
        ps.setString(2, ename);
        ps.setString(3, email);
        ps.setString(4, edept);
        ps.setString(5, erole);
        ps.setString(6, epwd);
        
        int rows = ps.executeUpdate();
        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
	}
}
