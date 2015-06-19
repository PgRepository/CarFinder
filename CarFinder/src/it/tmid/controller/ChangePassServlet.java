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

@WebServlet("/ChangePassServlet")

public class ChangePassServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, java.io.IOException {
		try
		{	    
			HttpSession session = request.getSession(true);
			UserBean user = new UserBean();
			user.setPassword(request.getParameter("pw"));
			user.setPasswordNuova(request.getParameter("pw2"));
			user.setTarga((String)session.getAttribute("targa"));
			
			System.out.println(session.getAttribute("targa"));
			
			user = UserDAO.changepass(user);
			
			if (user.isValid()){
				session.setAttribute("cp", 2);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Utente.jsp");
				rd.include(request, response);
				session.setAttribute("cp", 0);
			}
			else{
				session.setAttribute("cp", 1);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Utente.jsp");
				rd.include(request, response);
				session.setAttribute("cp", 0);
			}
		
			
		} 
		catch (Throwable theException) 	    
		{
			System.out.println(theException); 
		}
	}
}