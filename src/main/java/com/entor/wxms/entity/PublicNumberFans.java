package com.entor.wxms.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class PublicNumberFans {

	private String id;
	private String pid;
	private int addFans;
	private int reduceFans;
	@JSONField(format="yyyy-MM-dd")
	private Date countDate;
	
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
	public int getAddFans() {
		return addFans;
	}
	public void setAddFans(int addFans) {
		this.addFans = addFans;
	}
	public int getReduceFans() {
		return reduceFans;
	}
	public void setReduceFans(int reduceFans) {
		this.reduceFans = reduceFans;
	}
	public Date getCountDate() {
		return countDate;
	}
	public void setCountDate(Date countDate) {
		this.countDate = countDate;
	}
	@Override
	public String toString() {
		return "PublicNumberFans [id=" + id + ", pid=" + pid + ", addFans=" + addFans + ", reduceFans=" + reduceFans
				+ ", countDate=" + countDate + "]";
	}
	
	
}
