package com.entor.wxms.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class InfoContent {

	private String id;
	private String pid;
	private String content;
	private String tid;
	private String userid;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
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
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "InfoContent [id=" + id + ", pid=" + pid + ", content=" + content + ", tid=" + tid + ", userid=" + userid
				+ ", createTime=" + createTime + "]";
	}
	
	
}
