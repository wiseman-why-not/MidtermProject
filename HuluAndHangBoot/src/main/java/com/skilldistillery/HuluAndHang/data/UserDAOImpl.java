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
		

		return user;

	}

	@Override
	public User findByLogin(String username, String password) {
		String query = "SELECT user FROM User user WHERE user.username = :username AND user.userPassword = :password";
		try {
			return em.createQuery(query, User.class)
					  .setParameter("username", username)
					  .setParameter("password", password)
					  .getSingleResult();
		} catch(Exception e) {
			return null;
		}
	}

}
