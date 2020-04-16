package com.qintess.comercio.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	private AuthenticationManager authenticationManager;
	
	@Autowired
	IniciaPapeis papeis;
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "usuario/login";
	}
	
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
	public String registra(@ModelAttribute Usuario usuario,
						   RedirectAttributes redirectAtt,
						   HttpServletRequest req) {
		
		String senhaOriginal = usuario.getSenha();
		try {
			dao.encontrarTodos(Usuario.class)
				.stream()
				.filter(a -> a.getEmail().equals(usuario.getEmail()))
				.findFirst()
				.get();
			redirectAtt.addFlashAttribute("mensagemErro", "Usu�rio j� cadastrado no sistema");
			return "redirect:/login";
		} catch (Exception e) {
		}
		
		criaNovoCliente(usuario);
		
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(usuario.getEmail(), senhaOriginal);
	    authToken.setDetails(new WebAuthenticationDetails(req));
	     
	    Authentication authentication = authenticationManager.authenticate(authToken);
	     
	    SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
	}
	
	private void criaNovoCliente(Usuario usuario) {
		PasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String hashedPass = passEncoder.encode(usuario.getSenha());
		usuario.setSenha(hashedPass);
		usuario.setPapel(
				(dao.encontrarPorId(Usuario.class, 1) != null)
				? daoPapel.encontrarPorId(Papel.class, 2) 
				: daoPapel.encontrarPorId(Papel.class, 1)) ;
		dao.persistir(usuario);
	}
}
