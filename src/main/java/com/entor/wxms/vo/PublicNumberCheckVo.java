package com.entor.wxms.vo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class PublicNumberCheckVo {

	private String id;
	private String pId;
	private String publicName;
	private String userId;
	private String userName;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date applyTime;
	private String advise;
	private int state;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date checkedTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public String getAdvise() {
		return advise;
	}
	public void setAdvise(String advise) {
		this.advise = advise;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getCheckedTime() {
		return checkedTime;
	}
	public void setCheckedTime(Date checkedTime) {
		this.checkedTime = checkedTime;
	}
	@Override
	public String toString() {
		return "PublicNumberCheckVo [id=" + id + ", pId=" + pId + ", publicName=" + publicName + ", userId=" + userId
				+ ", userName=" + userName + ", applyTime=" + applyTime + ", advise=" + advise + ", state=" + state
				+ ", checkedTime=" + checkedTime + "]";
	}
	
	
	
}
