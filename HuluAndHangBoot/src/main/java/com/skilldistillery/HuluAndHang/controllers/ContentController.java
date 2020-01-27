package com.skilldistillery.HuluAndHang.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAO;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class ContentController {

	@Autowired
	private ContentDAO dao;
	
	@Autowired
	private UserDAO userDao;

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

	@RequestMapping(path = "movieDisplay.do")
	public String movieDisplay(@RequestParam("title") String title, Model model, HttpSession session) {
		Content content = dao.findByTitle(title);
		User user = (User) session.getAttribute("user");
		model.addAttribute("content", content);
		model.addAttribute("user", user);
		return "movieDisplay";
	}

	@RequestMapping(path = "movieLike.do")
	public String movieLike(@RequestParam Integer mid, Integer userId, Model model) {
		userDao.addFilmToFavorites(mid, userId);
		Content content = dao.findById(mid);
		User user = userDao.find(userId);
		model.addAttribute("content", content);
		model.addAttribute("user", user);
		return "movieDisplay";
	}

	@RequestMapping(path = "movieDislike.do")
	public String movieDislist(@RequestParam Integer mid, Integer userId, Model model) {		
		userDao.removeFilmFromFavorites(mid, userId);
		User user = userDao.find(userId);
		Content content = dao.findById(mid);
		model.addAttribute("content", content);
		model.addAttribute("user", user);
		return "movieDisplay";
	}

}
