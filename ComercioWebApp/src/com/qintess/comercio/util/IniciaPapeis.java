package com.qintess.comercio.util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qintess.comercio.dao.GenericDao;
import com.qintess.comercio.model.Papel;

@Component
public class IniciaPapeis {

	@Autowired
	private  GenericDao<Papel, Integer> dao;

	public void criaPapeis() {
		if (verificaPapel()) {
			Papel adm = new Papel("Administrador");
			Papel cliente = new Papel("Cliente");
			dao.persistir(adm);
			dao.persistir(cliente);
			System.out.println("Papeis Criados Com Sucesso!");
		} else {
			System.out.println("Papeis ja criados.");
		}
	}

	private boolean verificaPapel() {
		return (dao.encontrarTodos(Papel.class).size() == 0) ? true: false;
	}

}
