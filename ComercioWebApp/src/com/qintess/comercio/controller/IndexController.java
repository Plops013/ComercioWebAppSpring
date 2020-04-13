package com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.comercio.dao.GenericDao;
import com.qintess.comercio.model.Produto;

@Controller
public class IndexController {

	@Autowired
	GenericDao<Produto, Integer> dao;
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("produtos", dao.encontrarTodos(Produto.class));
		return "Index";
	}
	
	@RequestMapping("/nav")
	public String nav(){
		return "nav";
	}
	
}
