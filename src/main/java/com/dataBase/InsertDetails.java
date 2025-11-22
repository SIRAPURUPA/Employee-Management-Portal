package com.dataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InsertDetails {
	
	String url = "jdbc:mysql://localhost:3306/employee_management";
	String uname = "root";
	String pwd = "admin";
	
	public String insertToAdmin(String fullName,String email,String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =  DriverManager.getConnection(url,uname,pwd);
			String query = "Insert into admin values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, fullName);
			ps.setString(3, password);
			ps.execute();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Inserted Successfully";
	}
	
	public int checkCredentials(String email, String password) {
	    int status = 0;

	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =  DriverManager.getConnection(url,uname,pwd);
			String query = "Select apwd from admin where amail=?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (!rs.next()) {
	            return 0;   // Email not found
	        }

	        String storedPass = rs.getString("apwd");

	        if (storedPass.equals(password)) {
	            return 1;   // Login success
	        } else {
	            return -1;  // Wrong password
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return 0;
	}

}
