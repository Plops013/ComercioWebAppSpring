package com.qintess.comercio.controller;

//import java.util.Enumeration;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.comercio.dao.GenericDao;
import com.qintess.comercio.model.Papel;
import com.qintess.comercio.model.Usuario;
import com.qintess.comercio.util.IniciaPapeis;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	GenericDao<Usuario, Integer> dao;
	
	@Autowired
	GenericDao<Papel, Integer> daoPapel;
	
	@Autowired
	IniciaPapeis papeis;
	
	@RequestMapping("/cadastrar")
	public String cadastrar(Model model) {
		papeis.criaPapeis();
		model.addAttribute("usuario", new Usuario());
		return "usuario/cadastrar";
	}
	
	@RequestMapping("/termos")
	public String termos() {
		return "usuario/termosDeUso";
	}
	
	@RequestMapping("/salvar")
	public String salvar(@ModelAttribute Usuario usuario){
		usuario.setPapel(
				(dao.encontrarPorId(Usuario.class, 1) != null)
				? daoPapel.encontrarPorId(Papel.class, 2) 
				: daoPapel.encontrarPorId(Papel.class, 1)) ;
		usuario.setSenha(usuario.getSenha());
		dao.persistir(usuario);
		return "redirect:/";
	}
	
//	@RequestMapping("/logar")
//	public String login() {
//		HttpSession sessao = new HttpServletRequest().getSession() ;
//		sessao.setAttribute("logado", "sim");;
//		return "/";
//	}
	
}
