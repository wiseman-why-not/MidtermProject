package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import com.skilldistillery.HuluAndHang.entities.Genre;

public interface GenreDAO {
	
Genre findById(int id);

Genre findByName(String name);
	
List<Genre> findAll();

}
