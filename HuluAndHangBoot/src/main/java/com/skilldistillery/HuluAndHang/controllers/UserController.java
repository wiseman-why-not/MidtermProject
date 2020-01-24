package com.skilldistillery.HuluAndHang.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.HuluAndHang.data.HuluAndHangDAO;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "/")
	public String login(){
		return "index";
	}
	
	@RequestMapping(path = "login.do")
	public String checkLoginInfo(String password, String userName, Model model){
		User user = dao.findByLogin(userName, password);
		if(user == null) {
			return "index";
		} else {
			model.addAttribute("user", user);	
			return "home";
		}
	}
	
	@RequestMapping(path = "home.do")
	public String home(Model model){
		model.addAttribute("user", dao.find(1));
		return "home";
	}
}
