package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.User;

public interface ContentDAO {

	public Content findById(int id);
	
	public void createContent(Content content);
	
	public List<Content> findByTitle(String title);
	
	public boolean deleteById(int id);
	
	public Content updateById(int id, Content updateContent);
	
//	public void addGenre(int contentId, int genreId);
//	
//	public void removeGenre(int contentId, int genreId);
	
	public List<Content> findAll();
	
	public List<Content> search(String keyword);
	
	public List<User> getUserListFromContent();
	
	public List<Content> getContentByGenreId(int genreId);
	
}
