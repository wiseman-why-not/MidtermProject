package com.skilldistillery.HuluAndHang.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Season {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "content_id")
	private Integer contentId;
	
	@Column(name="season_number")
	private Integer seasonNumber;
	
//	@OneToMany(mappedBy="season")
//	private List<Episode> episodes;
	
//	@ManyToOne
//	@JoinColumn(name = "content_id")
//	private Content content;

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
	
//	public List<Episode> getEpisodes() {
//		return episodes;
//	}
//
//	public void setEpisodes(List<Episode> episodes) {
//		this.episodes = episodes;
//	}
//	
//	
//	public Content getContent() {
//		return content;
//	}
//
//	public void setContent(Content content) {
//		this.content = content;
//	}
	
	// ADDERS AND REMOVERS
	

	
//	public void addEpisode (Episode episode) {
//		if (episodes == null) {
//			episodes = new ArrayList<>();
//		}
//		if (!episodes.contains(episode)) {
//			episodes.add(episode);
//			
//		}
//			episode.setSeasonId(episode.getSeasonId());
//	}
//	
//	public void removeEpisode(Episode episode){
//		episode.setSeasonId(null);
//		if(episodes != null){
//			episodes.remove(episode);
//		}
//	
//	}
	

	// CONSTRUCTORS 

	public Season() {
		super();
	}

	@Override
	public String toString() {
		return "Season [id=" + id + ", contentId=" + contentId + ", seasonNumber=" + seasonNumber + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Season other = (Season) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}


}
