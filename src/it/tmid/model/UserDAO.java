package it.tmid.model;

import java.sql.*;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class UserDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
	
	
	
   public static UserBean login(UserBean bean) {
	
      Statement stmt = null;    
      String targa = bean.getTarga();    
      String password = bean.getPassword();   
      String searchQuery =
            "select * from members where targa='"
                     + targa
                     + "'"
                     +"and pass='"
                     + password
                     +"'"; 
   System.out.println("La tua targa è " + targa);          
   System.out.println("La tua password è " + password);
   System.out.println("Query effettuata: "+searchQuery);
     
   try 
   {
      
      currentCon = ConnectionManager.getConnection();
      stmt=currentCon.createStatement();
      rs = stmt.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // Se l'utente non esiste setta isValid a false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 
	        
      //se l'utente esiste setta isValid a true
      else if (more) 
      {
               
         System.out.println("Welcome " + rs.getString("first_name"));
         bean.setFirstName(rs.getString("first_name"));
         bean.setLastName(rs.getString("last_name"));
         bean.setEmail(rs.getString("email"));
         bean.setTarga(rs.getString("targa"));
         bean.setSoglia1(rs.getFloat("soglia1"));
         bean.setSoglia2(rs.getFloat("soglia2"));
         bean.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
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

return bean;
	
   }
   
   public static UserBean record(UserBean bean) {
  
	   Statement stmt = null;    
	   String firstName = bean.getFirstName();    
	   String lastName = bean.getLastName(); 
	   String email = bean.getEmail();
	   String targa = bean.getTarga();    
	   String password = bean.getPassword();
	   int c=0;
	   for(int i=0;i<email.length();i++){
		   if (email.charAt(i)=='.' || email.charAt(i)=='@'){
			   c+=1;
		   }
		      
	   }
	   if(c<2 || email.equals("@.") || email.equals(".@")){
		   bean.setValid(false);
		   
		   return bean;
	   }
	   String insertQuery =
			   "insert into members(first_name, last_name, email, pass, targa) VALUES ('"
					   + firstName
					   + "','"
					   + lastName
					   + "','"
					   + email
					   + "','"
					   + password
					   + "','"
					   + targa
					   + "')";
	   String searchQuery =
			   "select * from members where targa='"
					   + targa
					   + "'";
	   System.out.println("Il tuo nome è " + firstName);
	   System.out.println("Il tuo cognome è " + lastName);
	   System.out.println("La tua mail è " + email);
	   System.out.println("La tua targa è " + targa);
	   System.out.println("La tua password è " + password);
	   System.out.println("Query effettuata: "+insertQuery);

   try 
   {
   
	  currentCon = ConnectionManager.getConnection();
	  stmt=currentCon.createStatement();	  
	  rs = stmt.executeQuery(searchQuery);
      boolean more = rs.next();
         
      // Se l'utente esiste setto isValid a false
      if (more) 
      {
         System.out.println("Sei già registrato, effettua il login");
         bean.setValid(false);
      } 
	        
      // Se l'utente non esiste setto isValid a true
      else if (!more) 
      {    	
    	  stmt.executeUpdate(insertQuery);
    	  bean.setFirstName(firstName);
    	  bean.setLastName(lastName);
    	  bean.setEmail(email);
    	  bean.setUserName(targa);
    	  bean.setPassword(password);
    	  bean.setValid(true);
    	  sendEmail(firstName,email);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Registrazione fallita: Si è verificato un problema! " + ex);
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

   return bean;
	
   }
   
   public static UserBean changepass(UserBean bean) {

		Statement stmt = null;
		String queryPass = "update members set pass = '"+bean.getPasswordNuova()+"' where targa = '"+bean.getTarga()+"'";
		String searchUser =
	            "select * from members where targa='"
	                     + bean.getTarga()
	                     + "' and pass='"+bean.getPassword()+"'";
		System.out.println("Query di ricerca in esecuzione: "+searchUser);
		System.out.println("Query di settaggio in esecuzione: "+queryPass);
		
		try 
		{
			currentCon = ConnectionManager.getConnection();
			stmt=currentCon.createStatement();
			rs = stmt.executeQuery(searchUser);
		    boolean more = rs.next();
		    
		     if (more) 
		      {
		    	 stmt.executeUpdate(queryPass);
		    	 System.out.println("Cambio password andato a buon fine");
		    	 bean.setValid(true);
		        
		      } 
			        
		      else if (!more) 
		      {    	
		    	  System.out.println("Password vecchia errata, riprova");
		    	  bean.setValid(false);
		      }
			
			
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

		return bean;

	}
   
   public static void sendEmail(String nome,String to)
   {
       final String username = "alfadaprogetti@gmail.com";
       final String password = "CIAOciao";
       Properties props = new Properties();
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.port", "587");
       Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
           }
         });

       try {

           Message message = new MimeMessage(session);
           message.setFrom(new InternetAddress("alfadaprogetti@gmail.com"));
           message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
           message.setSubject("ALFADA PROGETTI - Registrazione Utente");
           message.setText("Salve "+nome+";"
               + "\n\n La registrazione è andata a buon fine!");
           Transport.send(message);
           System.out.println("Done");

       } 

       catch (MessagingException e) 
       {
           
           System.out.println("Username o Password della casella mail non sono corretti !");
       }
   }
}