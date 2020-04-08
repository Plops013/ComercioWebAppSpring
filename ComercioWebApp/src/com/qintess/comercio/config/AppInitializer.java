package com.qintess.comercio.config;

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

}
