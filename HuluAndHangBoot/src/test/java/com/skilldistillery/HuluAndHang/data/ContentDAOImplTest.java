package com.skilldistillery.HuluAndHang.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;


@SpringBootTest
class ContentDAOImplTest {

	private ContentDAOImpl dao;
	private Content content;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		
	}

	@BeforeEach
	void setUp() throws Exception {
		//dao = new ContentDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		//dao = null;
		//content = null;
	}

	@Test
	@DisplayName("testing content dao findById")
	void test1() {
		dao = new ContentDAOImpl();
		content = new Content();
		content = dao.findById(1);
		assertEquals("Joker", content.getTitle());		
	}
	
	@Test
	@DisplayName("testing content dao createContent")
	void test2() {
		dao = new ContentDAOImpl();
		content = new Content();
		content.setTitle("testing");
		dao.createContent(content);	
		List<Content> contents = new ArrayList<Content>();
		contents = dao.findByTitle("testing");
		assertEquals("testing",contents.get(0).getTitle());
	}
	
	@Test
	@DisplayName("testing content dao deleteById")
	void test3() {
		//dao = new ContentDAOImpl();
		//assertEquals(true, dao.deleteById(8));		
	}
	
	@Test
	@DisplayName("testing content dao updateById")
	void test4() {
		dao = new ContentDAOImpl();
		content = new Content();
		content.setTitle("updated");
		content.setDescription("desc");
		content.setImageUrl("img");
		content.setTrailerUrl("trailer");
		dao.updateById(6, content);
		content = dao.findById(6);
		assertEquals("updated",content.getTitle());
		assertEquals("desc", content.getDescription());
		assertEquals("img",content.getImageUrl());
		assertEquals("trailer", content.getTrailerUrl());		
	}
	
	@Test
	@DisplayName("testing content dao addGenre")
	void test5() {
		dao = new ContentDAOImpl();
		dao.addGenre(6, 2);
		content = dao.findById(6);
		List<Genre> genres = new ArrayList<Genre>();
		genres = content.getGenres();
		//System.out.println(genres.toString());
		assertEquals(2, genres.get(0).getId());
	}
	
	@Test
	@DisplayName("testing content dao removeGenre")
	void test6() {
		dao = new ContentDAOImpl();
		dao.removeGenre(6, 2);
		content = dao.findById(6);
		List<Genre> genres = new ArrayList<Genre>();
		genres = content.getGenres();
		//System.out.println(genres.toString());
		assertEquals(0, genres.size());
	}
	
	@Test
	@DisplayName("testing content dao findAll")
	void test7() {
		dao = new ContentDAOImpl();
		List<Content> contents = new ArrayList<Content>();
		contents = dao.findAll();
		assertEquals("Joker",contents.get(0).getTitle());
	}
	
	@Test
	@DisplayName("testing content dao search")
	void test8() {
		dao = new ContentDAOImpl();
		List<Content> contents = new ArrayList<Content>();
		contents = dao.search("jok");
		System.out.println(contents);
		assertEquals("Joker",contents.get(0).getTitle());
	}

}
