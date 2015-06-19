//Servlet per la Registrazione dell'Utente

package it.tmid.controller;


import it.tmid.model.UserBean;
import it.tmid.model.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewUserServlet
 */

@WebServlet("/RegistrationServlet")

public class RegistrationServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, java.io.IOException {
		try
		{	    
			UserBean user = new UserBean();
			user.setFirstName(request.getParameter("fname"));
			user.setLastName(request.getParameter("lname"));
			user.setEmail(request.getParameter("email"));
			user.setTarga(request.getParameter("targa"));
			user.setPassword(request.getParameter("pass"));

			user = UserDAO.record(user);

			if (user.isValid())
			{
				HttpSession session= request.getSession(true);
				System.out.println("Registrazione andata a buon fine");
				session.setAttribute("login", 2);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/LoginPage.jsp");
				rd.include(request, response);
				session.setAttribute("login", 0);
			} 
			else {
				HttpSession session= request.getSession(true);
				session.setAttribute("reg", 1);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/RegistPage.jsp");
				rd.include(request, response);
				session.setAttribute("reg", 0);
			}
		} 
		catch (Throwable theException) 	    
		{
			System.out.println(theException); 
		}
	}
}
