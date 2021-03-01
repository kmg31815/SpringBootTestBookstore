package com.example.first.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.first.interceptor.MessageInterceptor;

@Configuration
public class InterceptorWebMvcConfig implements WebMvcConfigurer {
	
	private MessageInterceptor messageInterceptor;
	
	public InterceptorWebMvcConfig(MessageInterceptor messageInterceptor) {
		this.messageInterceptor = messageInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(messageInterceptor).addPathPatterns("/search", "/update", "/delete", "/insert", "/logout");
	}
	
}
