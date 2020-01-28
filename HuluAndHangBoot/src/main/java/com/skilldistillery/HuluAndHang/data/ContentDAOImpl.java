package com.skilldistillery.HuluAndHang.data;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.HuluAndHang.entities.Content;
import com.skilldistillery.HuluAndHang.entities.Genre;
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
	
	public Content findByTitle(String title) {
		String jpql ="SELECT content from Content content where content.title = :title";
		return em.createQuery(jpql, Content.class)
		.setParameter("title",title)
		.getSingleResult();
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
		String query = "SELECT content FROM Content JOIN FETCH content.users JOIN FETCH content.genres";
		List<User> users = em.createQuery(query, User.class)
				.getResultList();		
		return users;
	}
	
	@Override
	public List<Content> getContentByGenreId(int genreId) {
		String query = "SELECT genre.contents FROM Genre genre WHERE genre.id = :genreId";
		return em.createQuery(query, Content.class).setParameter("genreId", genreId)
				.getResultList();
	}
	
	@Override
	public List<Content> filterByGenre(String genreName) {
		try {
			String query = "SELECT genre FROM Genre genre WHERE genre.name = :genreName";
			Genre genre = em.createQuery(query, Genre.class).setParameter("genreName", genreName).getSingleResult();
			List<Content> filteredContent = findAll();
			return filteredContent.stream().filter(x -> x.getGenres().contains(genre)).collect(Collectors.toList());
		} catch (Exception e) {
			return null;
		}
		
	}

}
