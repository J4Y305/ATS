package com.ats.domain;

import java.util.Date;

public class EntVO {
	private int entNum;
	private String entName;
	private String category;
	private String address;
	private String zipCode;
	private String entPhone;
	private String fileName;
	private String registration;
	private String adminId;
	private Date entRegDate;

	public int getEntNum() {
		return entNum;
	}

	public void setEntNum(int entNum) {
		this.entNum = entNum;
	}

	public String getEntName() {
		return entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getEntPhone() {
		return entPhone;
	}

	public void setEntPhone(String entPhone) {
		this.entPhone = entPhone;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public Date getEntRegDate() {
		return entRegDate;
	}

	public void setEntRegDate(Date entRegDate) {
		this.entRegDate = entRegDate;
	}

	@Override
	public String toString() {
		return "EntVO [entNum=" + entNum + ", entName=" + entName + ", category=" + category + ", address=" + address
				+ ", zipCode=" + zipCode + ", entPhone=" + entPhone + ", fileName=" + fileName + ", registration="
				+ registration + ", adminId=" + adminId + ", entRegDate=" + entRegDate + "]";
	}

}
