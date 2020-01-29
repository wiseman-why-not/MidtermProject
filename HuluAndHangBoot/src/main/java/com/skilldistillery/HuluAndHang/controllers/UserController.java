package com.skilldistillery.HuluAndHang.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.HuluAndHang.data.ContentDAO;
import com.skilldistillery.HuluAndHang.data.GenreDAO;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private GenreDAO genreDao;
	
	@Autowired
	private ContentDAO contentDao;
	
	
//	@RequestMapping(path = "user.do")
//	public String userPage(HttpSession session, Model model) {
//		if(session.getAttribute("user") == null) {
//			return "index";
//		}
//		List<Genre> genres = genreDao.findAll();
//		User user = dao.find(((User)session.getAttribute("user")).getId());
//		model.addAttribute("genres", genres);
//		model.addAttribute("user", user);
//		return "userDisplay";
//	}
	
	@RequestMapping(path = "user.do")
	public String userPage(HttpSession session, Model model) {
		List<Genre> genres = genreDao.findAll();
		
		User adminUser = (User) session.getAttribute("user");
		if (adminUser.getAdminPrivleges() && adminUser != null) {
			model.addAttribute("users", dao.findAll());
			model.addAttribute("contents", contentDao.findAll());
			return "adminPage";
		}
		else if(session.getAttribute("user") == null) {
			return "index";
		}
		model.addAttribute("genres", genres);
		model.addAttribute("user", dao.find(((User)session.getAttribute("user")).getId()));
		return "userDisplay";
	}
	
	@RequestMapping(path = "deactivate.do")
	public String deactivateUser(HttpSession session, Model model, Integer userId) {
		dao.deactivateAccount(userId);
		model.addAttribute("users", dao.findAll());
		return "adminPage";
	}
	@RequestMapping(path = "reactivate.do")
	public String reactivateUser(HttpSession session, Model model, Integer userId) {
		dao.reactivateAccount(userId);
		model.addAttribute("users", dao.findAll());
		return "adminPage";
	}

	@RequestMapping(path = { "/", "home.do" })
	public String loginPage(HttpSession session){
		if(session.getAttribute("user") == null) {
			return "index";
		} else {
			return "redirect:user.do";
		}
	}
	
	@RequestMapping(path = "create.do")
	public String createUser(){
		return "createUser";
	}
	
	@RequestMapping(path = "addUser.do")
	public String addUserToDB(User user, HttpSession session){
		boolean avaible = dao.checkUsernameavailability(user.getUsername());
		if(avaible) {
			session.setAttribute("user", dao.createUser(user));
			return "redirect:user.do";
		} else {
			return "createUser";
		}
	}
	
	@RequestMapping(path = "login.do")
	public String checkLoginInfo(String password, String userName,  HttpSession session){
		User user = dao.findByLogin(userName, password);
		if(user == null) {
			return "index";
		} else {
			session.setAttribute("user", user);
			return "redirect:user.do";
		}
	}
	
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("user", null);
		return "redirect:home.do";
	}
	
	@RequestMapping(path = "updateDescription.do")
	public String updateUserDescription(String description, HttpSession session) {
		User user = (User)session.getAttribute("user");
		dao.updateUserDescription(user, description);
		session.setAttribute("user", dao.find(user.getId()));
		return "redirect:user.do";
	}
	
	@RequestMapping(path = "deleteFilmFromHome.do")
	public String deleteFilmFromHome(int filmId,  HttpSession session) {
		dao.removeFilmFromFavorites(filmId, ((User)session.getAttribute("user")).getId());
		session.setAttribute("user", dao.find(((User)session.getAttribute("user")).getId()));
		return "redirect:user.do";
	}
	
	@RequestMapping(path = "addGenre.do")
	public String addGenreToFavorite(int genreId,  HttpSession session) {
		dao.addGenreToFavorites(genreId, ((User)session.getAttribute("user")).getId());
		session.setAttribute("user", dao.find(((User)session.getAttribute("user")).getId()));
		return "redirect:user.do";
	}
	
	@RequestMapping(path = "removeGenre.do")
	public String removeGenreFromFavorite(int genreId,  HttpSession session) {
		dao.removeGenreFromFavorites(genreId, ((User)session.getAttribute("user")).getId());
		session.setAttribute("user", dao.find(((User)session.getAttribute("user")).getId()));
		return "redirect:user.do";
	}
}
