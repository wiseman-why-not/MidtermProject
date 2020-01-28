package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import com.skilldistillery.HuluAndHang.entities.User;

public interface UserDAO {

	public User find(int id);

	public User findByLogin(String username, String password);
	
	public boolean checkUsernameavailability(String username);

	public User createUser(User user);

	public boolean updateUser(User user);
	
	public List<User> findAll();
	
//	public List<User> findByFavoriteContent(int contentId);
  
	public boolean updateUserDescription(User user, String description);
	
	public boolean removeFilmFromFavorites(int filmId, int userId);
	
	public boolean addFilmToFavorites(int filmdId, int userId);
	
	public boolean removeGenreFromFavorites(int genreId, int userId);
	
	public boolean addGenreToFavorites(int genreId, int userId);

	boolean deactivateAccount(Integer userId);

	boolean reactivateAccount(Integer userId);

}
