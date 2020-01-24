package com.skilldistillery.HuluAndHang.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Content;

@Service
@Transactional
public class ContentDAOImpl implements ContentDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Content findById(int id) {

		return em.find(Content.class, id);
	}

}
