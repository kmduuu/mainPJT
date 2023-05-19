package com.baseball;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.baseball")
public class YagurouteApplication {

	public static void main(String[] args) {
		SpringApplication.run(YagurouteApplication.class, args);
	}

}
