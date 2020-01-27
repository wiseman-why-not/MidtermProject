package com.skilldistillery.HuluAndHang.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class User {

	// FIELDS

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Integer id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String username;

	@Column(name = "password")
	private String userPassword;

	@Column(name = "phone")
	private Long phoneNumber;

	private String email;

	private Integer age;

	@Column(name = "personal_description")
	private String description;

	@Column(name = "active")
	private Boolean isActive = true;

	@Column(name = "admin_privledges")
	private Boolean adminPrivleges = false;
	
	@ManyToMany(mappedBy = "users")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Content> contents;
	
	@ManyToMany
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinTable(name="user_genre",
	joinColumns = @JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="genre_id"))
	private List<Genre> genres;
	

	// GETTERS | SETTERS | METHODS | CONSTRUCTORS

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	public User() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Boolean getAdminPrivleges() {
		return adminPrivleges;
	}

	public void setAdminPrivleges(Boolean adminPrivleges) {
		this.adminPrivleges = adminPrivleges;
	}

	public void setId(Integer id) {
		this.id = id;

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}
	
	public void addContent(Content content) {
		if (contents == null) {
			contents = new ArrayList<>();
		}
		if(! contents.contains(content)) {
			contents.add(content);
			content.addUser(this);
		}
	}
	
	public void removeContent(Content content) {
		if (contents != null && contents.contains(content)) {
			contents.remove(content);
			content.removeUser(this);
		}
	}
	
	public void addGenre(Genre genre) {
		if (this.genres == null) {
			this.genres  = new ArrayList<>();
		}
		if(! this.genres .contains(genre)) {
			this.genres .add(genre);
			genre.addUser(this);
		}
	}
	
	public void removeGenre(Genre genre) {
		if (this.genres  != null && this.genres .contains(genre)) {
			this.genres.remove(genre);
			genre.removeUser(this);
		}
	}

	// toString

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
				+ ", userPassword=" + userPassword + ", phoneNumber=" + phoneNumber + ", email=" + email + ", age="
				+ age + ", description=" + description + ", isActive=" + isActive + ", adminPrivleges=" + adminPrivleges
				+ " genres" + this.genres + " contents" + this.contents + "]";
	}



}