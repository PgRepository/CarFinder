package it.tmid.model;

import java.sql.*;



public class ConnectionManager {

	static Connection con;
	static String url;

	public static Connection getConnection()
	{
		// Connessione al Database
		try
		{
			String url = "jdbc:postgresql://ec2-107-20-178-83.compute-1.amazonaws.com:5432/dfukin326rbi01?user=scfscrouebjfrz&password=qtrw1F-37VvBkLESZ00y93ri-k&ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory"; 


			Class.forName("org.postgresql.Driver");

			try
			{            	
				con = DriverManager.getConnection(url,"scfscrouebjfrz","qtrw1F-37VvBkLESZ00y93ri-k"); 


			}

			catch (SQLException ex)
			{
				ex.printStackTrace();
			}
		}

		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}

		return con;
	}
}
