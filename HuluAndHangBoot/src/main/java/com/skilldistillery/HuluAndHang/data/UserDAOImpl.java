package com.skilldistillery.HuluAndHang.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Content;
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
		String query = "SELECT user FROM User user WHERE user.username = :username AND user.userPassword = :password";
		try {
			User user = em.createQuery(query, User.class)
					.setParameter("username", username)
					.setParameter("password", password)
					.getSingleResult();
			user.getContents();
			user.getGenres();
			return user;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
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

	@Override
	public boolean updateUserDescription(User user, String description) {
		try {
			User managedUser = em.find(User.class, user.getId());
			System.out.println(managedUser);
			System.out.println(description);
			managedUser.setDescription(description);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public boolean removeFilmFromFavorites(int filmId, int userId) {
		try {
			Content content = em.find(Content.class, filmId);
			User managedUser = em.find(User.class, userId);
			managedUser.removeContent(content);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
