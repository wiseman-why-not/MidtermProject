package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import com.skilldistillery.HuluAndHang.entities.Genre;

public interface GenreDAO {

	public Genre findById(int id);

	public List<Genre> findByName(String name);

	public List<Genre> findAll();

}
