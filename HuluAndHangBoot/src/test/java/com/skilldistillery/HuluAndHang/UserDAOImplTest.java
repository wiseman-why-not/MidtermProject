package com.skilldistillery.HuluAndHang;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.skilldistillery.HuluAndHang.data.UserDAO;
import com.skilldistillery.HuluAndHang.data.UserDAOImpl;
import com.skilldistillery.HuluAndHang.entities.User;
@SpringBootTest
@RunWith(SpringRunner.class)
class UserDAOImplTest {
	
	private UserDAO dao;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {

		dao = new UserDAOImpl();
		user = dao.find(1);
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
		user = null;
	}

	@Test
	@Disabled
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test1() {
		assertEquals("steve", user.getFirstName());
	}
	
	@Test
	void testUpdateUser() {
		
		User user = dao.find(4);
		
		user.setFirstName("Wayne");
		
		assertTrue(dao.updateUser(user));
		
		
	}

}
