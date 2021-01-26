package com.webSite.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UtenteDAO {
	private static Connection connection;
	private static Statement st;
	
	private static void connessione() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://database-1.clvnyaziusxb.us-east-2.rds.amazonaws.com:3306/mydb";
		String uname = "admin";
		String password = "webcomputing";
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, uname, password);
		st = connection.createStatement();
	}
	/*
	public ArrayList<Utente> getAllStudents(){
		
	}
	*/
	
	private static void disconnessione() throws SQLException {
		st.close();
		connection.close();
	}
	public static Utente getUtente(String nome) throws SQLException, ClassNotFoundException {
		Utente ut = null;
		connessione();
		String query = "SELECT * FROM UTENTE WHERE NOME='"+nome+"'";
		ResultSet resSet = st.executeQuery(query);
		while(resSet.next()) {
			if(ut==null)
				ut = new Utente();
			ut.aggiorna(resSet.getString("nome"),resSet.getString("chiave"));
		}
		disconnessione();
		return ut;
	}
	
	public static void inserisciUtente(Utente ut) throws ClassNotFoundException, SQLException {
		connessione();
		String query = "INSERT INTO UTENTE (nome,chiave) VALUES ('"+ut.getNome()+"', '"+ut.getPassword()+"')";
		st.executeUpdate(query);
		
		disconnessione();
	}
	/*
	public void deleteStudent(Student student) {
		
	}
	*/
}
