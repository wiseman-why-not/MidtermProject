package com.skilldistillery.HuluAndHang.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.HuluAndHang.entities.Content;

@Controller
public class ContentController {
	
	@RequestMapping(path = "movieList.do")
	public String home(Model model){
		Content films = null;
		model.addAttribute("films", films);
		return "movieList";
	}
}
