package com.qintess.comercio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.comercio.dao.GenericDao;
import com.qintess.comercio.model.Produto;

@Controller
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	GenericDao<Produto, Long> dao;
	
	@RequestMapping("/")
	public String carrega() {
		return "/produto/Index";
	}
	
	@RequestMapping("/novo")
	public String cadastro(Model model) {
		model.addAttribute("produto", new Produto());
		return "/produto/Create";
	}
	
	@RequestMapping("/novo/salva")
	public String salva(@ModelAttribute Produto produto) {
		dao.persistir(produto);
		return "redirect:/produto";
	}
	
}
