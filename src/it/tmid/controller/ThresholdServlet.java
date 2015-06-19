package it.tmid.controller;

import it.tmid.model.ThresholdBean;
import it.tmid.model.ThresholdDAO;

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

@WebServlet("/ThresholdServlet")

public class ThresholdServlet extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, java.io.IOException {
		try
		{	    
			HttpSession session = request.getSession(true);
			ThresholdBean threshold = new ThresholdBean();
			threshold.setSoglia1(request.getParameter("soglia1"));
			threshold.setSoglia2(request.getParameter("soglia2"));
			threshold = ThresholdDAO.soglie((String)session.getAttribute("targa"),threshold);
			if (threshold.getisValid()==true){
				session.setAttribute("soglia1", threshold.getSoglia1());
				session.setAttribute("soglia2", threshold.getSoglia2());
				System.out.println("Settaggio soglie andato a buon fine");
				session.setAttribute("so", 2);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Soglie.jsp");
				rd.include(request, response);
				session.setAttribute("so", 0);
			}
			else{
				session.setAttribute("so", 1);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Soglie.jsp");
				rd.include(request, response);
				session.setAttribute("so", 0);
			}
		} 
		catch (Throwable theException) 	    
		{
			System.out.println(theException); 
		}
	}
}