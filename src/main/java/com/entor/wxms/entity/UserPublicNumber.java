package com.entor.wxms.entity;

public class UserPublicNumber {

	private String id;
	private String userId;
	private String pId;
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}


	@Override
	public String toString() {
		return "UserPublicNumber [id=" + id + ", userId=" + userId + ", pId=" + pId + "]";
	}

	
}
