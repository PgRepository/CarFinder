package it.tmid.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

// Query per recupero percorsi da Database

public class PositionDAO {

	static Connection currentCon = null;
	static ResultSet rs = null; 

	public static PositionBean positions(PositionBean pos){

		Statement stmt = null;
		String queryPos1 = "select startpos from positions";
		String queryPos2 = "select endpos from positions";
		try 
		{
			currentCon = ConnectionManager.getConnection();
			stmt=currentCon.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(queryPos1);
			for (int i=0;i<5; i++){
				rs.next();
				pos.addListinit(rs.getString("startpos"));
			}

			rs = stmt.executeQuery(queryPos2);
			for (int i=0;i<5; i++){
				rs.next();
				pos.addListfinal(rs.getString("endpos"));
			}

			int randomNum = 0 + (int)(Math.random()*4);
			pos.setInitposition(pos.getListinit().get(randomNum));
			pos.setFinalposition(pos.getListfinal().get(randomNum));		
			System.out.println("Percorso di partenza random:"+ pos.getListinit().get(randomNum));
			System.out.println("Percorso di arrivo random:"+pos.getListfinal().get(randomNum));

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

		return pos;

	}
}