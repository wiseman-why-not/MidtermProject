package com.skilldistillery.HuluAndHang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class HuluAndHangBootApplication extends SpringBootServletInitializer {
	  @Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(HuluAndHangBootApplication.class);
	  }
	  public static void main(String[] args) {
	    SpringApplication.run(HuluAndHangBootApplication.class, args);
	  }
	}