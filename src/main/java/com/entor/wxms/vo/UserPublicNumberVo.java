package com.entor.wxms.vo;

public class UserPublicNumberVo {

	private String id;
	private String userId;
	private String userName;
	private String pId;
	private String publicName;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getPublicName() {
		return publicName;
	}
	public void setPublicName(String publicName) {
		this.publicName = publicName;
	}
	@Override
	public String toString() {
		return "UserPublicNumberVo [id=" + id + ", userId=" + userId + ", userName=" + userName + ", pId=" + pId
				+ ", publicName=" + publicName + "]";
	}
	
	
}
