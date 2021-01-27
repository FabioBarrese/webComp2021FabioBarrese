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
@WebServlet("/Iscrizione")
public class Iscrizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Iscrizione() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("uname");
		String password = request.getParameter("psw");
		if (userName == null || password == null)
			response.sendRedirect("iscrizione.jsp");
		else {
			System.out.println(userName);
			System.out.println(password);
			boolean trovato = false;
			if (password.length() < 5 || userName.length() < 5) {
				response.getOutputStream().println(" USERNAME E PASSWORD DEVONO AVERE ALMENO 5 CARATTERI");
			} else {
				for (int i = 0; i < userName.length() && !trovato; i++) {
					char carattere = userName.charAt(i);
					if (carattere == 39)
						trovato = true;
				}
				if (trovato)
					response.sendRedirect("iscrizione.jsp");
				else {
					try {
						Utente ut = new Utente(userName, password);
						UtenteDAO.inserisciUtente(ut);
						HttpSession sessione = request.getSession();
						sessione.setAttribute("uname", userName);
						response.sendRedirect("indiceArticoli.html");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
						response.sendRedirect("iscrizione.jsp");
					} catch (SQLException e) {
						e.printStackTrace();
						response.sendRedirect("iscrizione.jsp");
					}
				}
			}
		}
	}

}
