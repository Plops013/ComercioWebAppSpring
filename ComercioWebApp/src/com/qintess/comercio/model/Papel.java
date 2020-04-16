package com.qintess.comercio.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Papel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 15)
	private String nome;
	
	@OneToMany(mappedBy = "papel")
	private List<Usuario> usuarios = new ArrayList<>();
	
	public Papel() {}
	public Papel(String nome) {
		this.nome = nome;
	}

	public void addUsuario(Usuario usuario){
		this.usuarios.add(usuario);
	}
	
	public void removeUsuario(Usuario usuario) {
		this.usuarios.remove(usuario);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
