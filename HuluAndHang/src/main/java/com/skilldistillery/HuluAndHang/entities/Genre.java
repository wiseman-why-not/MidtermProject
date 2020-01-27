package com.skilldistillery.HuluAndHang.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

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
	@LazyCollection(LazyCollectionOption.FALSE)
	List<Content> contents;
	
	@ManyToMany(mappedBy="genres")
	@LazyCollection(LazyCollectionOption.FALSE)
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
	
	public void addUser(User user) {
		if (this.users == null) {
			this.users  = new ArrayList<>();
		}
		if(! this.users .contains(user)) {
			this.users .add(user);
			user.addGenre(this);
		}
	}
	
	public void removeUser(User user) {
		if (this.users  != null && this.users .contains(user)) {
			this.users.remove(user);
			user.removeGenre(this);
		}
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
