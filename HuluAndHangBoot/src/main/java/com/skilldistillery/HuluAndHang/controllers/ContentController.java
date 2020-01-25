package com.skilldistillery.HuluAndHang.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAOImpl;
import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.data.UserDAOImpl;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;
import com.skilldistillery.HuluAndHang.entities.User;

@Controller
public class ContentController {
	
	@Autowired
	private UserDAOImpl dao;	
	private List<Content> contents;
	private List<Genre> genres;
	private String userName;
	private User user;
	
	
	@RequestMapping(path = "movie.do")
	public String movieList(HttpSession session, Model model){
		contents = new ArrayList<Content>();
		genres = new ArrayList<Genre>();
		user = (User)session.getAttribute("user");
		genres = user.getGenres();
		for(Genre g : genres) {
			List<Content> temp = new ArrayList<Content>();
			temp = g.getContents();
			for(Content c : temp) {
				contents.add(c);
			}//for
		}//for
		userName = user.getFirstName();
		model.addAttribute("uName", userName);
		model.addAttribute("contents", contents);
		return "movieList";		
	}
}
