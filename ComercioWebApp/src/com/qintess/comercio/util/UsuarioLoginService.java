package com.qintess.comercio.util;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.qintess.comercio.dao.GenericDao;
import com.qintess.comercio.model.Usuario;

@Service
public class UsuarioLoginService implements UserDetailsService {

	@Autowired
	private GenericDao<Usuario, Integer> dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = null;
		UserBuilder builder = null;
		try {
			usuario = dao.encontrarTodos(Usuario.class).stream()
							.filter(x -> x.getEmail().equals(username))
							.findFirst()
							.get();
			if(usuario != null) {
				builder = User.withUsername(username);
				builder.password(usuario.getSenha());
				String papel = usuario.getPapel().getNome();
				builder.roles(papel);
				System.out.println("usuario diferente de null: " + builder.build().toString());
			}
		} catch (Exception e) {
			System.out.println("caiu no catch");
			throw new UsernameNotFoundException("Usu�rio n�o encontrado!");
		}
		return builder.build();
	}

}
