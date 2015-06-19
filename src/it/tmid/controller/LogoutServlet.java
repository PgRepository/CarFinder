package it.tmid.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Servlet del Logout

@WebServlet("/LogoutServlet")

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("JSESSIONID")){
					System.out.println("JSESSIONID="+cookie.getValue());
					break;
				}
			}
		}
		//Invalidamento della sessione se esiste
		HttpSession session = request.getSession(false);
		System.out.println("Targa="+session.getAttribute("targa"));
		session.setAttribute("login", 0);
		if(session != null){
			session.invalidate();
		}
		response.sendRedirect("LoginPage.jsp");
	}

}
