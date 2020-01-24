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
import org.junit.jupiter.api.Test;

class ContentTest {

	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static Content content;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("midterm");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		content = em.find(Content.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		content = null;
	}

	@Test
	void test() {
		assertEquals("Joker", content.getTitle());
		assertEquals(2000, content.getReleaseDate());		
	}
	
	@Test
	void test2() {
		assertNotNull(content.getGenres());
		assertTrue(content.getGenres().size()>0);
		List<Genre> genres = new ArrayList<>();
		genres = content.getGenres();
		//System.out.println(genres.toString());
		assertEquals("Crime", genres.get(0).getName());		
	}
	
	

}
