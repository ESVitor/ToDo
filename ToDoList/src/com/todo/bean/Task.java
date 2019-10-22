package com.todo.bean;

import java.util.Date;

/**
 * Class that creates the Task Objects.
 * Will be called always when a task should be created, updated or deleted.
 * 
 *  @author Ennio
 *  @since October/2019
 *  @version 0.0.1
 */
public class Task {
	private int id;
	private int userId;
	private String description;
	private Date lastUpDated;
	private String text;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getLastUpDated() {
		return lastUpDated;
	}
	public void setLastUpDated(Date lastUpDated) {
		this.lastUpDated = lastUpDated;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}	
}
