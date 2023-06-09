package com.my.pet;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppConfig implements WebMvcConfigurer {
	@Value("${attachPath}")
	private String attachPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("res/**").addResourceLocations("WEB-INF/res/"); 
		registry.addResourceHandler("attach/**").addResourceLocations("file:///" + attachPath + "/");
	}
}