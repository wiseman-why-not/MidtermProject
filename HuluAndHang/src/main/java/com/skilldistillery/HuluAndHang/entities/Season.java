package com.skilldistillery.HuluAndHang.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Season {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "content_id")
	private Integer contentId;
	
	@Column(name="season_number")
	private Integer seasonNumber;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public Integer getSeasonNumber() {
		return seasonNumber;
	}

	public void setSeasonNumber(Integer seasonNumber) {
		this.seasonNumber = seasonNumber;
	}

	public Season() {
		super();
	}

	@Override
	public String toString() {
		return "Season [id=" + id + ", contentId=" + contentId + ", seasonNumber=" + seasonNumber + "]";
	}
	
	
	
	

}
