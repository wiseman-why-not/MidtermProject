package com.skilldistillery.HuluAndHang.data;

import com.skilldistillery.HuluAndHang.entities.User;

public interface UserDAO {
	
	public User find(int id);
	
	public User findByLogin(String username, String password);
	
}
