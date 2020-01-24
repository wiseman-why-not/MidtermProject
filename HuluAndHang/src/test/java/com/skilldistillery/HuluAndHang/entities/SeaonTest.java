package com.skilldistillery.HuluAndHang.entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SeaonTest {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("midterm");
	private EntityManager em;
	private Season season;
	
	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		//season = em.find(Season.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	@DisplayName("test episode mapping")
	void test1() {
		season = new Season();
		season.setId(1);
		season.setContentId(1);
		season.setSeasonNumber(1);
		System.out.println("before season persist");
		System.out.println(season.toString());	
		/*em.persist(episode);
		episode = em.find(Episode.class, 1);
		System.out.println("after persist");
		System.out.println(episode.toString());
		assertEquals("testing", episode.getTitle());
		assertEquals(1, episode.getSeasonId());
		assertEquals(1, episode.getId());*/
	}

}
