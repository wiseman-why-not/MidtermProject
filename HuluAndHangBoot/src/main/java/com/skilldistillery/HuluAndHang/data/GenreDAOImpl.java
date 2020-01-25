package com.skilldistillery.HuluAndHang.data;

import java.util.ArrayList;
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
	
//	EntityManagerFactory emf =
//	Persistence.createEntityManagerFactory("midterm");
//	EntityManager em = emf.createEntityManager();
	
	private Genre genre;
	List<Genre> genres;
	
	public Genre findById(int id) {
		// TODO Auto-generated method stub
		genre = null;
		genre = em.find(Genre.class, id);
		return genre;
	}
	
	public List<Genre> findAll(){
		String jpql ="select g from Genre g";
		genres = new ArrayList<Genre>();
		genres = em.createQuery(jpql, Genre.class)
		.getResultList();
		return genres;
	}

	public List<Genre> findByName(String name) {
		// TODO Auto-generated method stub
		String jpql ="select g from Genre g where g.name = :name";
		genres = new ArrayList<Genre>();
		genres = em.createQuery(jpql, Genre.class)
		.setParameter("name",name)
		.getResultList();
		return genres;	
	}

}
