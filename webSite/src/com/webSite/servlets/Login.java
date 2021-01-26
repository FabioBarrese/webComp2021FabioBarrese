package com.webSite.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("uname");
		String password = request.getParameter("psw");
		if (userName == null || password == null) {
			response.sendRedirect("login.jsp");
		} else {
			System.out.println(userName);
			System.out.println(password);
			boolean trovato = false;
			for (int i = 0; i < userName.length() && !trovato; i++) {
				char carattere = userName.charAt(i);
				if (carattere == 39)
					trovato = true;
			}
			if (trovato)
				response.sendRedirect("login.jsp");
			else {
				try {
					Utente ut = UtenteDAO.getUtente(userName);
					if (ut == null || !password.equals(ut.getPassword()) || !userName.equals(ut.getNome()))
						response.sendRedirect("login.jsp");
					else {
						HttpSession sessione = request.getSession();
						sessione.setAttribute("uname", userName);
						response.sendRedirect("indiceArticoli.html");
					}
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					response.sendRedirect("login.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
					response.sendRedirect("login.jsp");
				}
			}
		}
	}

}
