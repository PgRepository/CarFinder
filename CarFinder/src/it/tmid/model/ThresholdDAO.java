package it.tmid.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


// Query per recupero percorsi da Database

public class ThresholdDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 


	public static ThresholdBean soglie(String targa,ThresholdBean threshold) throws InterruptedException{
		
		Statement stmt = null;
		String soglia1 = threshold.getSoglia1();    
		String soglia2 = threshold.getSoglia2();
		System.out.println("Soglia 1 "+soglia1);
		System.out.println("Soglia 2 "+soglia2);
		
		if ((Float.parseFloat(soglia1)>Float.parseFloat(soglia2)) || ((Float.parseFloat(soglia1)<0) || (Float.parseFloat(soglia2)<0))){
			System.out.println("soglie errate");
			threshold.setisValid(false);
			return threshold;
		}
		
		String querySoglie = "update members set soglia1 = "+soglia1+" , soglia2 = "+soglia2+" where targa = '"+targa+"'";
		try 
		{
			currentCon = ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			stmt.executeUpdate(querySoglie);
			
		} 

		catch (Exception ex) 
		{
			
			System.out.println("Si è verificato un problema! " + ex);
		} 


		finally 
		{
			if (rs != null)	{
				try {
					rs.close();
				} catch (Exception e) {}
				rs = null;
			}


			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {}
				stmt = null;
			}

			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}

				currentCon = null;
			}
		}
		threshold.setisValid(true);
		return threshold;

	}
}