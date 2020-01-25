package com.skilldistillery.HuluAndHang.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Genre {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="name")
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ManyToMany(mappedBy="genres")
	List<Content> contents;
	
	@ManyToMany(mappedBy="genres")
	List<User> users;

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	public Genre() {
		super();
	}
	
	
	public List<Content> addContent(Content content) {
		if (this.contents == null) {
			contents = new ArrayList<Content>();
		}
		if(! contents.contains(content)) {
			contents.add(content);
			content.addGenre(this);
		}
		return contents;
	}
	
	public List<Content> removeContent(Content content) {
		if (contents != null && contents.contains(content)) {
			contents.remove(content);
			content.removeGenre(this);
		}
		return contents;
	}
		
		

	@Override
	public String toString() {
		return "Genre [id=" + id + ", name=" + name + "]";
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
		Genre other = (Genre) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	

}
