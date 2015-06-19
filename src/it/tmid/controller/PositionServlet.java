package it.tmid.controller;

import it.tmid.model.PositionBean;
import it.tmid.model.PositionDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PositionServlet
 */
@WebServlet("/PositionServlet")

public class PositionServlet extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		public void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, java.io.IOException {
			try
			{	    
				HttpSession session = request.getSession(true);
				PositionBean positions = new PositionBean();
				positions = PositionDAO.positions(positions);
				session.setAttribute("initposition", positions.getInitposition());
				session.setAttribute("finalposition", positions.getFinalposition());
				response.sendRedirect("Mappa.jsp");
				
			} 
			catch (Throwable theException) 	    
			{
				System.out.println(theException); 
			}
		}
}
	
