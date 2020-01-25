package com.skilldistillery.HuluAndHang.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAOImpl;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;

@Controller
public class ContentController {
	
	@Autowired
	private ContentDAOImpl dao;
	
	private List<Content> contents;
	private List<Genre> genres;
	
	@RequestMapping(path = "movie.do")
	public String movieList(@RequestParam Integer uid, String uName, Model model){
		contents = new ArrayList<Content>();
		genres = new ArrayList<Genre>();
		dao = new ContentDAOImpl();
		contents = dao.findAll();
		model.addAttribute("contents", contents);
		model.addAttribute("uid", uid);
		model.addAttribute("uName", uName);
		return "movieList";		
	}
}
