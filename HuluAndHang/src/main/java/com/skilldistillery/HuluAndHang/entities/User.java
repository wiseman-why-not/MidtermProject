package com.skilldistillery.HuluAndHang.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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

	private String userName;

	@Column(name = "password")
	private String userPassword;

	@Column(name = "phone")
	private Integer phoneNumber;
	
	private String email;
	
	private Integer age;
	
	@Column(name = "personal_description")
	private String description;

	@Column(name = "active")
	private Boolean isActive = true;

	@Column(name = "admin_privleges")
	private Boolean adminPrivleges = false;

	// GETTERS | SETTERS | METHODS | CONSTRUCTORS

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Integer getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Integer phoneNumber) {
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
	
	

	// toString

	public String getUsername() {
		return userName;
	}

	public void setUsername(String username) {
		this.userName = username;
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

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + userName
				+ ", userPassword=" + userPassword + ", phoneNumber=" + phoneNumber + ", email=" + email + ", age="
				+ age + ", description=" + description + ", isActive=" + isActive + ", adminPrivleges=" + adminPrivleges
				+ "]";
	}

}