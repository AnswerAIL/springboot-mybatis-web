package com.answer.springboot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.answer.springboot.mybatis.web.service", "com.answer.springboot.mybatis.web.controller"})
@MapperScan(basePackages = {"com.answer.springboot.mybatis.web.dao"})
public class SpringbootMybatisWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootMybatisWebApplication.class, args);
	}
}
