package com.skilldistillery.HuluAndHang.data;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	

	@PersistenceContext
	private EntityManager em;

	@Override
	public User find(int id) {

		User user = em.find(User.class, id);
		
		
		System.out.println("User info: " + user.getFirstName() + user.getLastName() + user.getUsername()
				+ user.getDescription() + user.getPhoneNumber() + user.getAge());

		return user;

	}

}
