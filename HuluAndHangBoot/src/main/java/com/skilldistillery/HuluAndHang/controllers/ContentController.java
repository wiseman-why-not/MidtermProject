package com.skilldistillery.HuluAndHang.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAO;

@Controller
public class ContentController {

	@Autowired
	private ContentDAO dao;

	@RequestMapping(path = "movie.do")
	public String movieList(HttpSession session, Model model) {
//		list all films in the movielist.jsp page. DO NOT EDIT
		model.addAttribute("contents", dao.findAll());
		return "movieList";
	}
	
	@RequestMapping(path = "filterByGenre.do")
	public String listOfFilmsByGenre(@RequestParam("genreId") Integer genreId, Model model) {
		
		model.addAttribute("contents", dao.getContentByGenreId(genreId));
		return "movieList";
	}
	
	@RequestMapping(path = "bykeyword.do")
	public String searchByKeyword(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("contents", dao.search(keyword));
		return "movieList";
	}
}
