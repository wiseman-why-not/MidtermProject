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
		return em.find(User.class, id);
	}

	@Override
	public User findByLogin(String username, String password) {
		String query = "SELECT user FROM User user JOIN FETCH user.contents WHERE user.username = :username AND user.userPassword = :password";
		try {
			return em.createQuery(query, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public User createUser(User user) {
		System.out.println(user);
		em.persist(user);
		System.out.println(user);
		return user;
	}

	@Override
	public boolean updateUser(User user) {
		User managedUser = em.find(User.class, user.getId());
		try {
			managedUser.setUsername(user.getUsername());
			managedUser.setAge(user.getAge());
			managedUser.setDescription(user.getDescription());
			managedUser.setEmail(user.getEmail());
			managedUser.setFirstName(user.getFirstName());
			managedUser.setLastName(user.getLastName());
			managedUser.setPhoneNumber(user.getPhoneNumber());
			managedUser.setUserPassword(user.getUserPassword());
			managedUser.setIsActive(user.getIsActive());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean checkUsernameavailability(String username) {
		String query = "SELECT user FROM User user WHERE user.username = :username";
		try {
			em.createQuery(query, User.class)
				.setParameter("username", username)
				.getSingleResult();
			return false;
		} catch (Exception e) {
			return true;
		}
	}
	
	

}
