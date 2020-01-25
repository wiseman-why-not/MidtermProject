package com.skilldistillery.HuluAndHang.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
//import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.User;


@Service
@Transactional
public class ContentDAOImpl implements ContentDAO{
	
	/* if running spring boot use the @PersistenceContext
	 */

	@PersistenceContext
	private EntityManager em;
	
//	EntityManagerFactory emf =
//	Persistence.createEntityManagerFactory("midterm");
//	EntityManager em = emf.createEntityManager();
	
	private Content content;
	List<Content> contents;
			
	@Override
	public Content findById(int id) {
		content = null;
		content = em.find(Content.class, id);
		return content;
	}
	
	public void createContent(Content content) {
//		em.getTransaction().begin();
		em.persist(content);
//		em.flush();
//		em.getTransaction().commit();
	}
	
	public List<Content> findByTitle(String title) {
		// TODO Auto-generated method stub
		String jpql ="select c from Content c where c.title = :title";
		contents = new ArrayList<Content>();
		contents = em.createQuery(jpql, Content.class)
		.setParameter("title",title)
		.getResultList();
		return contents;	
	}
	
	public boolean deleteById(int id) {
		content = em.find(Content.class, id);
//		em.getTransaction().begin();
		em.remove(content);
		em.flush();
//		em.getTransaction().commit();
		boolean status = !em.contains(content);
		return status;	
	}
	
	public Content updateById(int id, Content updateContent) {
		content = em.find(Content.class, id);
//		em.getTransaction().begin();
		content.setTitle(updateContent.getTitle());
		content.setDescription(updateContent.getDescription());
		content.setCreateDate(updateContent.getcreateDate());
		content.setFormat(updateContent.isFormat());
		content.setReleaseDate(updateContent.getReleaseDate());
		content.setImageUrl(updateContent.getImageUrl());
		content.setTrailerUrl(updateContent.getTrailerUrl());
		content.setGenres(updateContent.getGenres());		
		em.flush();
//		em.getTransaction().commit();
		return content;	
	}
	
	
	
	public void addGenre(int contentId, int genreId) {
		// TODO Auto-generated method stub
		Query query = em.createNativeQuery("insert into genre_content (content_id, genre_id) values (:contentId, :genreId);")
		.setParameter("contentId",contentId)
		.setParameter("genreId",genreId);
//		em.getTransaction().begin();
		query.executeUpdate();
		em.flush();
//		em.getTransaction().commit();
	}
	
	public void removeGenre(int contentId, int genreId) {
		// TODO Auto-generated method stub
		Query query = em.createNativeQuery("delete from genre_content where content_id = :contentId and genre_id = :genreId")
		.setParameter("contentId",contentId)
		.setParameter("genreId",genreId);
//		em.getTransaction().begin();
		query.executeUpdate();
		em.flush();
//		em.getTransaction().commit();
	}
	
	public List<Content> findAll(){
		String jpql ="select c from Content c";
		contents = new ArrayList<Content>();
		contents = em.createQuery(jpql, Content.class)
		.getResultList();
		return contents;
	}
	
	public List<Content> search(String key){
		String jpql ="select c from Content c where c.title like :key or c.description like :key";
		contents = new ArrayList<Content>();
		contents = em.createQuery(jpql, Content.class)
		.setParameter("key","%"+key+"%")
		.getResultList();
		return contents;
	}

	@Override
	public List<User> getUserListFromContent() {
		String query = "SELECT content FROM Content JOIN FETCH cotnent.users JOIN FETCH content.genres";
		List<User> users = em.createQuery(query, User.class)
				.getResultList();
		
		return users;
	}
	
	 

}
