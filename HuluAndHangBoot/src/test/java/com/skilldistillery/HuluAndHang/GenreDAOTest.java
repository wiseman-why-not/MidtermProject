package com.skilldistillery.HuluAndHang;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.HuluAndHang.data.GenreDAOImpl;
import com.skilldistillery.HuluAndHang.entities.Genre;

class GenreDAOTest {
	
	private Genre genre;
	private GenreDAOImpl genreDao;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}
	
	
	@BeforeEach
	void setUp() throws Exception {
		//em = emf.createEntityManager();
		//genre = em.find(Genre.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		//em.close();
		//emf.close();
	}
	
	@Test
	@DisplayName("test1 GenreDAO findById")
	void test1() {
		genreDao = new GenreDAOImpl();
		genre = new Genre();
		genre = genreDao.findById(1);
		assertEquals("Action", genre.getName());
		assertEquals(1, genre.getId());	
		List<Genre> genres = new ArrayList<Genre>();
		genres = genreDao.findAll();
		assertEquals("Action",genres.get(0).getName());
		//System.out.println(genres.toString());
	}
	
	@Test
	@DisplayName("test2 GenreDAO findAll")
	void test2() {
		genreDao = new GenreDAOImpl();
		List<Genre> genres = new ArrayList<Genre>();
		genres = genreDao.findAll();
		assertEquals("Action",genres.get(0).getName());
		//System.out.println(genres.toString());
	}
	
	@Test
	@DisplayName("test3 GenreDAO findByName")
	void test3() {
		genreDao = new GenreDAOImpl();
		List<Genre> genres = new ArrayList<Genre>();
		genres = genreDao.findByName("Action");
		assertEquals("Action",genres.get(0).getName());
		//System.out.println(genres.toString());
	}

	

}
