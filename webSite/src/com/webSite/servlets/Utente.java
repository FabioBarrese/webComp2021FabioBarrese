package com.webSite.servlets;

public class Utente {
	private String nome;
	private String password;
	
	public Utente() {
		nome="default";
		password="default";
	}
	
	public Utente(String nome , String password) {
		this.nome=nome;
		this.password=password;
	}
	
	public void aggiorna(String nome,String password) {
		this.nome=nome;
		this.password=password;
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getPassword() {
		return password;
	}

}
