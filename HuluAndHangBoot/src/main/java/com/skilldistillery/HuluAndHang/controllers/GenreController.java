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
	
	@RequestMapping(path="filterByGenre.do")
	public String filterByGenre(Model model) {
	// need to return to a page that just shows the list of film
	// page will look very similar to movieList.jsp
	// separate page now, but will attempt to make into one page.
	return "WEB-INF/FIXME.jsp";
	}


}
