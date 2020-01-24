package com.skilldistillery.HuluAndHang;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.HuluAndHang.data.HuluAndHangDAO;
import com.skilldistillery.HuluAndHang.data.HuluAndHangDAOImpl;

@SpringBootTest
class HuluAndHangBootApplicationTests {

	@Test
	void contextLoads() {
		HuluAndHangDAO doa = new  HuluAndHangDAOImpl();
		doa.find();
	}

}
