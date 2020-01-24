package com.skilldistillery.HuluAndHang.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.HuluAndHang.data.GenreDAO;

public class GenreController {
	
	@Autowired
	private GenreDAO dao;
	
	@RequestMapping(path="/")
	public String index(Model model) {
	return "WEB-INF/index.jsp";
	}
	


}
