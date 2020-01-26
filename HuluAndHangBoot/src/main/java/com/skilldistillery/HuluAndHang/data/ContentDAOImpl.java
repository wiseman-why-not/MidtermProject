package com.skilldistillery.HuluAndHang.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.User;


@Service
@Transactional
public class ContentDAOImpl implements ContentDAO {

	@PersistenceContext
	private EntityManager em;
			
	@Override
	public Content findById(int id) {
		return em.find(Content.class, id);
	}
	
	public void createContent(Content content) {
		em.persist(content);
	}
	
	public List<Content> findByTitle(String title) {
		String jpql ="SELECT content from Content content where content.title = :title";
		return em.createQuery(jpql, Content.class)
		.setParameter("title",title)
		.getResultList();
	}
	
	public boolean deleteById(int id) {
		Content content = em.find(Content.class, id);
		em.remove(content);
		return !em.contains(content);
	}
	
	public Content updateById(int id, Content updateContent) {
		Content content = em.find(Content.class, id);
		content.setTitle(updateContent.getTitle());
		content.setDescription(updateContent.getDescription());
		content.setCreateDate(updateContent.getcreateDate());
		content.setFormat(updateContent.isFormat());
		content.setReleaseDate(updateContent.getReleaseDate());
		content.setImageUrl(updateContent.getImageUrl());
		content.setTrailerUrl(updateContent.getTrailerUrl());
		content.setGenres(updateContent.getGenres());		
		return content;	
	}
	
	
	
//	public void addGenre(int contentId, int genreId) {
//		Query query = em.createNativeQuery("insert into genre_content (content_id, genre_id) values (:contentId, :genreId);")
//		.setParameter("contentId",contentId)
//		.setParameter("genreId",genreId);
//		query.executeUpdate();
//		em.flush();
//	}
//	
//	public void removeGenre(int contentId, int genreId) {
//		Query query = em.createNativeQuery("delete from genre_content where content_id = :contentId and genre_id = :genreId")
//		.setParameter("contentId",contentId)
//		.setParameter("genreId",genreId);
//		em.flush();
//	}
	
	public List<Content> findAll(){
		String jpql ="SELECT content from Content content";
		return em.createQuery(jpql, Content.class)
		.getResultList();
	}
	
	public List<Content> search(String keyword){
		String jpql ="SELECT content from Content content where content.title like :key or content.description like :key";
		return em.createQuery(jpql, Content.class)
		.setParameter("key","%"+keyword+"%")
		.getResultList();
	}

	@Override
	public List<User> getUserListFromContent() {
		String query = "SELECT content FROM Content content JOIN FETCH contnent.users JOIN FETCH content.genres";
		return em.createQuery(query, User.class)
				.getResultList();
	}
	
	@Override
	public List<Content> getContentByGenreId(int genreId) {
		String query = "SELECT genre.contents FROM Genre genre WHERE genre.id = :genreId";
		return em.createQuery(query, Content.class).setParameter("genreId", genreId)
				.getResultList();
	}
	
	 

}
