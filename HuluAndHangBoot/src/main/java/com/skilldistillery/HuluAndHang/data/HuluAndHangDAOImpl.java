package com.skilldistillery.HuluAndHang.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.User;

@Service
@Transactional
public class HuluAndHangDAOImpl implements HuluAndHangDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public void find() {
	 System.out.println(em.find(User.class, 1));
	}

}
