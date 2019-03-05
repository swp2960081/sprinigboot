package com.entor.wxms.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class InfoContentCheck {

	private String id;
	private String pid;
	private String content;
	private String userid;
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
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
		return "InfoContentCheck [id=" + id + ", pid=" + pid + ", content=" + content + ", userid=" + userid
				+ ", applyTime=" + applyTime + ", advise=" + advise + ", state=" + state + ", checkedTime="
				+ checkedTime + "]";
	}
	
}
