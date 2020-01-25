package com.skilldistillery.HuluAndHang.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.HuluAndHang.data.ContentDAO;
import com.skilldistillery.HuluAndHang.data.ContentDAOImpl;
import com.skilldistillery.HuluAndHang.entities.Content;

@Controller
public class ContentController {
	
	@Autowired
	private ContentDAOImpl dao;
	
	private List<Content> contents;
	
	@RequestMapping(path = "movie.do")
	public String movieList(Model model){
		contents = new ArrayList<Content>();
		dao = new ContentDAOImpl();
		contents = dao.findAll();
		model.addAttribute("contents", contents);
		return "movieList";		
	}
}
