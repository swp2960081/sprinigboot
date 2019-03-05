package com.entor.wxms.entity;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class PublicNumber {

	private String id;
	private String publicId;
	private String publicName;
	private int publicType;
	private String name;
	private String phone;
	private String address;
	private String logo;
	@JSONField(format="yyyy-MM-dd")
	private Date regDate;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPublicId() {
		return publicId;
	}
	public void setPublicId(String publicId) {
		this.publicId = publicId;
	}
	public String getPublicName() {
		return publicName;
	}
	public void setPublicName(String publicName) {
		this.publicName = publicName;
	}
	public int getPublicType() {
		return publicType;
	}
	public void setPublicType(int publicType) {
		this.publicType = publicType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "PublicNumber [id=" + id + ", publicId=" + publicId + ", publicName=" + publicName + ", publicType="
				+ publicType + ", name=" + name + ", phone=" + phone + ", address=" + address + ", logo=" + logo
				+ ", regDate=" + regDate + ", createTime=" + createTime + "]";
	}
	
	
}
