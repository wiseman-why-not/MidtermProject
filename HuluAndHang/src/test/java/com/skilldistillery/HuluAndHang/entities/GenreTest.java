package com.skilldistillery.HuluAndHang.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


public class GenreTest {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("midterm");
	private EntityManager em;
	private Genre genre;
	
	
	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		//genre = em.find(Genre.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	@DisplayName("test1 genre mapping")
	void test1() {
		//genre = new Genre();
		//genre.setId(1);
		//genre.setName("testing");
		//System.out.println("before genre persist");
		//System.out.println(genre.toString());	
		//em.persist(genre);
		genre = em.find(Genre.class, 1);
		//System.out.println("find genre");
		//System.out.println(genre.toString());
		assertEquals("Action", genre.getName());
		assertEquals(1, genre.getId());		
	}
	

}
