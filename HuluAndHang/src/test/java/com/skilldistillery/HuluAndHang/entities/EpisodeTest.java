package com.skilldistillery.HuluAndHang.entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class EpisodeTest {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("midterm");
	private EntityManager em;
	private Episode episode;
	
	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		//episode = em.find(Episode.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	@DisplayName("test episode mapping")
	void test1() {
		episode = new Episode();
		episode.setTitle("testing");
		//episode.setSeasonId(1);
		episode.setId(1);
		System.out.println("before episode persist");
		System.out.println(episode.toString());	
		/*em.persist(episode);
		episode = em.find(Episode.class, 1);
		System.out.println("after persist");
		System.out.println(episode.toString());
		assertEquals("testing", episode.getTitle());
		assertEquals(1, episode.getSeasonId());
		assertEquals(1, episode.getId());*/
	}

}
