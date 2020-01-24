package com.skilldistillery.HuluAndHang.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Content {

	// FIELDS
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="title")
	private String title;
	
	@Column(name="Description")
	private String description;
	
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="trailer_url")
	private String trailerUrl;
	
	@Column(name="imdb_url")
	private String imdbrUrl;
	
	@Column(name="format")
	private boolean format;

	
	// CONSTRUCTORS
	
	public Content() {
		super();
	}

	public Content(int id, String title, String description, String imageUrl, String trailerUrl, String imdbrUrl,
			boolean format) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.imageUrl = imageUrl;
		this.trailerUrl = trailerUrl;
		this.imdbrUrl = imdbrUrl;
		this.format = format;
	}

	// METHODS 
	
	// GETTERS AND SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public String getImdbrUrl() {
		return imdbrUrl;
	}

	public void setImdbrUrl(String imdbrUrl) {
		this.imdbrUrl = imdbrUrl;
	}

	public boolean isFormat() {
		return format;
	}

	public void setFormat(boolean format) {
		this.format = format;
	}

	// TOSTRING AND HASH
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Content [id=").append(id).append(", title=").append(title).append(", description=")
				.append(description).append(", imageUrl=").append(imageUrl).append(", trailerUrl=").append(trailerUrl)
				.append(", imdbrUrl=").append(imdbrUrl).append(", format=").append(format).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Content other = (Content) obj;
		if (id != other.id)
			return false;
		return true;
	}
	 
	
	
}