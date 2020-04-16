package com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
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
	public String nav(Model model){
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		model.addAttribute("usuarioLogado", auth);
//		System.out.println(auth.getName());
//		System.out.println(auth.getDetails());
//		System.out.println(auth.getCredentials());
//		System.out.println(auth);
		return "nav";
	}
	
}
