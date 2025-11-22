package com.dataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FetchNameByMail {
	public static String getName(String email) {
	    String name = null;

	    String url = "jdbc:mysql://localhost:3306/employee_management";
	    String uname = "root";
	    String pwd = "admin";

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(url, uname, pwd);

	        String query = "SELECT aname FROM admin WHERE amail = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            name = rs.getString("aname");
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return name;   // null if not found
	}

}
