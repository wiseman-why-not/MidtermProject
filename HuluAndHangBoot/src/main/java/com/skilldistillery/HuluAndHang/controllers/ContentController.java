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
import com.skilldistillery.HuluAndHang.data.ContentDAOImpl;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.data.UserDAOImpl;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class ContentController {
	
	@Autowired
	private ContentDAO dao;
	
	@Autowired	
	private UserDAO userDao;
	
	private List<Content> contents;
	private List<Genre> genres;
	private List<User> users;
	private String userName;
	private User user;
	private Content content;
	private Integer userId;
	
	
	@RequestMapping(path = "movie.do")
	public String movieList(HttpSession session, Model model){
		contents = new ArrayList<Content>();
		user = (User)session.getAttribute("user");
		contents = dao.findAll();
		userName = user.getFirstName().toUpperCase();
		model.addAttribute("userName", userName);
		model.addAttribute("contents", contents);
		model.addAttribute("user", user);
		return "movieList";		
	}
	
	@RequestMapping(path = "movieDisplay.do")
	public String movieDisplay(@RequestParam Integer mid, Integer userId, Model model){
		content = dao.findById(mid);
		user = userDao.find(userId);
		userName = user.getFirstName().toUpperCase();
		model.addAttribute("userName", userName);
		model.addAttribute("content", content);	
		model.addAttribute("user", user);
		return "movieDisplay";		
	}
	
	@RequestMapping(path = "movieLike.do")
	public String movieLike(@RequestParam Integer mid, Integer userId, Model model){
		content = dao.findById(mid);
		user = userDao.find(userId);
		user.addContent(content);
		user.setContents(user.getContents());
		userName = user.getFirstName().toUpperCase();
		users = new ArrayList<User>();
		users = userDao.findByFavoriteContent(content.getId());
		model.addAttribute("userName", userName);
		model.addAttribute("user", user);
		model.addAttribute("users", users);
		model.addAttribute("content", content);
		return "movieLike";		
	}
	
	@RequestMapping(path = "movieDislike.do")
	public String movieDislist(@RequestParam Integer mid, Integer userId, Model model){
		content = dao.findById(mid);
		user = userDao.find(userId);
		user.removeContent(content);
		user.setContents(user.getContents());
		userName = user.getFirstName().toUpperCase();
		contents = user.getContents();
		model.addAttribute("userName", userName);
		model.addAttribute("user", user);
		model.addAttribute("content", content);
		model.addAttribute("contents", contents);
		return "movieDislike";	
	}
		@RequestMapping(path = "returnUserDisplay.do")
		public String returnUserDisplay(HttpSession session, Model model) {
			user = (User)session.getAttribute("user");
			model.addAttribute("user", user);
			return "userDisplay";
		}
		
		@RequestMapping(path = "returnMovieList.do")
		public String returnMovieList(HttpSession session, Model model) {
			contents = new ArrayList<Content>();
			user = (User)session.getAttribute("user");
			contents = dao.findAll();
			userName = user.getFirstName().toUpperCase();
			model.addAttribute("userName", userName);
			model.addAttribute("contents", contents);
			model.addAttribute("user", user);
			return "movieList";
		}
	}

