package com.entor.wxms.entity;

public class PublicNumberTemplate {

	private String id;
	private String pid;
	private String tid;
	
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
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	@Override
	public String toString() {
		return "PublicNumberTemplate [id=" + id + ", pid=" + pid + ", tid=" + tid + "]";
	}
	
	
}
