package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Genre;

@Service
@Transactional
public class GenreDAOImpl implements GenreDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	public Genre findById(int id) {
		return em.find(Genre.class, id);
	}
	
	public List<Genre> findAll(){
		String jpql ="select genre from Genre genre";
		return em.createQuery(jpql, Genre.class)
		.getResultList();
	}

	public List<Genre> findByName(String name) {
		String jpql ="SELECT genre from Genre genre where genre.name = :name";
		return em.createQuery(jpql, Genre.class)
		.setParameter("name",name)
		.getResultList();
	}
	
	
}
