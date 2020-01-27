package com.skilldistillery.HuluAndHang.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAO;
import com.skilldistillery.HuluAndHang.data.GenreDAO;
import com.skilldistillery.HuluAndHang.entities.Content;

@Controller
public class ContentController {

	@Autowired
	private ContentDAO dao;
	@Autowired
	private GenreDAO genreDAO;

	@RequestMapping(path = "movie.do")
	public String movieList(HttpSession session, Model model) {
//		list all films in the movielist.jsp page. DO NOT EDIT
		model.addAttribute("contents", dao.findAll());
//		need to list all genres for my filter by genre button		
		model.addAttribute("genres", genreDAO.findAll());
		return "movieList";
	}

	@RequestMapping(path = "filterByGenre.do")
	public String listOfFilmsByGenre(@RequestParam("genreName") String genreName, Model model) {
		model.addAttribute("contents", dao.filterByGenre(genreName));
		return "movieList";
	}

	@RequestMapping(path = "bykeyword.do")
	public String searchByKeyword(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("contents", dao.search(keyword));
		return "movieList";
	}

	@RequestMapping(path = "movieDisplay.do")
	public String movieDisplay(@RequestParam("title") String title, Model model) {
		Content content = dao.findByTitle(title);
		model.addAttribute("content", content);
		return "movieDisplay";
	}

	@RequestMapping(path = "movieLike.do")
	public String movieLike(@RequestParam Integer mid, Integer userId, Model model) {
		Content content = dao.findById(mid);
		model.addAttribute("content", content);
		return "movieLike";
	}

	@RequestMapping(path = "movieDislike.do")
	public String movieDislist(@RequestParam Integer mid, Integer userId, Model model) {
		Content content = dao.findById(mid);
		model.addAttribute("content", content);
		return "movieDislike";
	}

}
