package com.skilldistillery.HuluAndHang.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO dao;
	
	
	@RequestMapping(path = "user.do")
	public String userPage(HttpSession session) {
		return "userDisplay";
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
}
