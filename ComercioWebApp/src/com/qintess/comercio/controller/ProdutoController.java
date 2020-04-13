package com.qintess.comercio.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qintess.comercio.dao.GenericDao;
import com.qintess.comercio.model.Produto;

@Controller
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	GenericDao<Produto, Integer> dao;

	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("produtos", dao.encontrarTodos(Produto.class));
		model.addAttribute("produto", new Produto());
		return "/produto/Create";
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable(name="id") int id, Model model) {
		Produto produto = dao.encontrarPorId(Produto.class,  id);
		model.addAttribute("produto", produto);
		return "/produto/Index";
	}

	@RequestMapping("/salva")
	public String salva(@ModelAttribute Produto produto,
			RedirectAttributes redirectAttributes,
			@RequestParam(required = false, value="imagem") MultipartFile imagem
			) {
			try {
			if(imagem != null && imagem.getSize() > 0) {
				produto.setImagemProd(imagem.getBytes());
			}
			if(produto.getId() == 0) {
				dao.persistir(produto);
				redirectAttributes.addFlashAttribute("mensagemSucesso", " Produto Cadastrado Com Sucesso! ");
			} else {
				dao.atualizar(produto);
				redirectAttributes.addFlashAttribute("mensagemSucesso", " Produto Alterado Com Sucesso! ");	}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("mensagemErro", "Erro Grave: " + e.getMessage());
		}
		return "redirect:/produto/";
	}

	@RequestMapping("/deleta/{id}")
	public String deleta(@PathVariable(name="id") int id, RedirectAttributes redirectAttributes) {
		Produto produto = dao.encontrarPorId(Produto.class,  id);
		dao.deletar(produto);
		redirectAttributes.addFlashAttribute("mensagemSucesso", "Produto Excluido! ");
		return "redirect:/produto/";
	}

	@RequestMapping("/altera/{id}")
	public String carregaAltera(@PathVariable(name="id") int id, Model model, RedirectAttributes redirectAttributes) {
		try {
			Produto produto = dao.encontrarPorId(Produto.class, id);
			byte[] encodeBase64 = Base64.getEncoder().encode(produto.getImagemProd());
			String base64Encoded;
			base64Encoded = new String(encodeBase64, "UTF-8");
			model.addAttribute("produtos", dao.encontrarTodos(Produto.class));
			model.addAttribute("produto", produto);
			model.addAttribute("imagem64", base64Encoded);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("mensagemErro", "Erro Grave: " + e.getMessage());
		}	
		return "/produto/Create";
	}
}
