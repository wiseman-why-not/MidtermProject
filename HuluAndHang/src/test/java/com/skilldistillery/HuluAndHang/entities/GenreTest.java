package com.skilldistillery.HuluAndHang.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


public class GenreTest {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("midterm");
	private static  EntityManager em;
	private Genre genre;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		em = emf.createEntityManager();
		
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
		em.close();
	}
	
	
	@BeforeEach
	void setUp() throws Exception {
		genre = em.find(Genre.class, 5);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		//em.close();
		//emf.close();
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
		//genre = em.find(Genre.class, 1);
		//System.out.println("find genre");
		//System.out.println(genre.toString());
		assertEquals("Crime", genre.getName());
		assertEquals(5, genre.getId());		
	}
	
	@Test
	void test2() {
		assertNotNull(genre.getContents());
		assertTrue(genre.getContents().size()>0);
		List<Content> contents = new ArrayList<Content>();
		contents = genre.getContents();
		//System.out.println(genres.toString());
		assertEquals("Joker", contents.get(0).getTitle());
	
		
		
	}
	

}
