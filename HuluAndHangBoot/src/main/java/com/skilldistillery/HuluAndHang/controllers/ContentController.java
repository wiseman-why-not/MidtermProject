package com.skilldistillery.HuluAndHang.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAO;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.data.GenreDAO;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class ContentController {

	@Autowired
	private ContentDAO dao;
	
	@Autowired
	private UserDAO userDao;
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

	@RequestMapping(path = "byKeyword.do")
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
	
	@RequestMapping(path = "userHang.do")
	public String userHang(@RequestParam Integer id, Model model) {		
		User user = userDao.find(id);
		model.addAttribute("user", user);
		return "userHang";
	}

}
