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
	
	public List<User> findByFavoriteContent(int contentId);
  
	public boolean updateUserDescription(User user, String description);

}
