package com.skilldistillery.HuluAndHang.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

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
	
	
	@Column(name="img_url")
	private String imageUrl;
	
	@Column(name="trailer_url")
	private String trailerUrl;
	
	@Column(name="format")
	private boolean format;
	
	@Column(name="release_date")
	private Integer releaseDate;

	
	@Column(name="create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	// CONSTRUCTORS
	
	
	public Content() {
		super();
	}

	public Content(int id, String title, String description, String imageUrl, String trailerUrl, boolean format,
			Integer releaseDate, LocalDateTime createDate) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.imageUrl = imageUrl;
		this.trailerUrl = trailerUrl;
		this.format = format;
		this.releaseDate = releaseDate;
		this.createDate = createDate;
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

	public boolean isFormat() {
		return format;
	}

	public void setFormat(boolean format) {
		this.format = format;
	}

	public Integer getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Integer releaseDate) {
		this.releaseDate = releaseDate;
	}

	public LocalDateTime getcreateDate() {
		return createDate;
	}

	public void setcreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	// TOSTRING AND HASH
	
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Content [id=").append(id).append(", title=").append(title).append(", description=")
				.append(description).append(", imageUrl=").append(imageUrl).append(", trailerUrl=").append(trailerUrl)
				.append(", format=").append(format).append(", releaseDate=").append(releaseDate).append(", createDate=")
				.append(createDate).append("]");
		return builder.toString();
	}

	
}
