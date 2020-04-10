package com.qintess.comercio.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() { //Configura componentes externos tipo hibernate
		return new Class[] {
				HibernateConfig.class
		};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { //Configura o mvc do spring
		return new Class[] {
				WebMvcConfig.class
		};
	}

	@Override
	protected String[] getServletMappings() { //Configura o mapeamento do servlet
		return new String[] {
				"/"
		};
	}
	
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter	= new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		return new Filter[] {characterEncodingFilter};
	}

}
