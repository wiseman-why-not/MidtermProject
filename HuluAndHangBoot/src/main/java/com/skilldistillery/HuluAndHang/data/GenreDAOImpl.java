package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Genre;

@Service
@Transactional
public class GenreDAOImpl implements GenreDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	//EntityManagerFactory emf =
	//Persistence.createEntityManagerFactory("midterm");
	//EntityManager em = emf.createEntityManager();
	
	public Genre findById(int id) {
		// TODO Auto-generated method stub
		Genre genre = null;
		genre = em.find(Genre.class, id);
		return genre;
	}
	
	public List<Genre> findAll(){
		String jpql ="select g from Genre g";
		List<Genre> genres = em.createQuery(jpql, Genre.class)
		.getResultList();
		//em.close();
		return genres;
	}

}
