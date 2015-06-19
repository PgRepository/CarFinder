package it.tmid.controller;

import it.tmid.model.UserBean;
import it.tmid.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;

//Servlet del Login

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, java.io.IOException {

		try
		{	    

			UserBean user = new UserBean();
			user.setTarga(request.getParameter("targa"));
			user.setPassword(request.getParameter("pw"));
			String usern = request.getParameter("targa");
			

			user = UserDAO.login(user);

			if (user.isValid())
			{

				HttpSession session = request.getSession(true);
				session.setAttribute("targa",usern);
				//Setto il cookie per avere il tempo sessione a 30 minuti
				session.setMaxInactiveInterval(30*60); 
				Cookie Targa = new Cookie("targa", usern);
				Targa.setMaxAge(30*60);
				response.addCookie(Targa);
				session.setAttribute("nome", user.getFirstName());
				session.setAttribute("cognome", user.getLastName());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("targa", user.getTarga());
				session.setAttribute("soglia1", user.getSoglia1());
				session.setAttribute("soglia2", user.getSoglia2());
				response.sendRedirect("index.jsp");
				
			}

			else {
				HttpSession session= request.getSession(true);
				session.setAttribute("login", 1);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/LoginPage.jsp");
				rd.include(request, response);
				session.setAttribute("login", 0);
			}
		} 


		catch (Throwable theException) 	    
		{
			System.out.println(theException); 
		}
	}
}