package com.kite.ocm.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	
	public static Connection getConnection()
	{
		Connection con=null;
		
		
		try
		{
			
			Class.forName(DBUtilities.DRIVER_NAME);
			
			con=DriverManager.getConnection(DBUtilities.DRIVER_URL, DBUtilities.USERNAME,DBUtilities.PASSWORD);
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
		return  con;
	}

}
