package com.skilldistillery.HuluAndHang.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
<<<<<<< HEAD

=======
>>>>>>> b7d6016b29f8fda2b2cea5ba7fe42695feb26d9c
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.skilldistillery.HuluAndHang.entities.Content;

<<<<<<< HEAD

=======
@SpringBootTest
>>>>>>> b7d6016b29f8fda2b2cea5ba7fe42695feb26d9c
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
		dao = new ContentDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
		content = null;
	}

	@Test
	@Disabled
	void test() {
		fail("not yet impletment");
	}
	
	@Test
	@DisplayName("testing dao impl to database")
	void test1() {
		assertEquals("Joker", content.getTitle());
	}

}
