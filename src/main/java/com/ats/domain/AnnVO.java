package com.ats.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class AnnVO {

	private int annNum;
	private String annName;
	private String annField;
	private Date annStartDate;
	private Date annEndDate;
	private String detail;
	private String[] annImage;
	private String[] annFile;
	private String mngId;
	private int annAct;
	private int deadline;
	private Date annRegDate;
	private int dDay;

	private ArrayList<AnnImageVO> imageList;
	private ArrayList<AnnFileVO> fileList;

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public String getAnnName() {
		return annName;
	}

	public void setAnnName(String annName) {
		this.annName = annName;
	}

	public String getAnnField() {
		return annField;
	}

	public void setAnnField(String annField) {
		this.annField = annField;
	}

	public Date getAnnStartDate() {
		return annStartDate;
	}

	public void setAnnStartDate(Date annStartDate) {
		this.annStartDate = annStartDate;
	}

	public Date getAnnEndDate() {
		return annEndDate;
	}

	public void setAnnEndDate(Date annEndDate) {
		this.annEndDate = annEndDate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String[] getAnnImage() {
		return annImage;
	}

	public void setAnnImage(String[] annImage) {
		this.annImage = annImage;
	}

	public String[] getAnnFile() {
		return annFile;
	}

	public void setAnnFile(String[] annFile) {
		this.annFile = annFile;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public int getAnnAct() {
		return annAct;
	}

	public void setAnnAct(int annAct) {
		this.annAct = annAct;
	}

	public int getDeadline() {
		return deadline;
	}

	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}

	public Date getAnnRegDate() {
		return annRegDate;
	}

	public void setAnnRegDate(Date annRegDate) {
		this.annRegDate = annRegDate;
	}

	public ArrayList<AnnImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(ArrayList<AnnImageVO> imageList) {
		this.imageList = imageList;
	}

	public ArrayList<AnnFileVO> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<AnnFileVO> fileList) {
		this.fileList = fileList;
	}

	public int getdDay() {
		return dDay;
	}

	public void setdDay(int dDay) {
		this.dDay = dDay;
	}

	@Override
	public String toString() {
		return "AnnVO [annNum=" + annNum + ", annName=" + annName + ", annField=" + annField + ", annStartDate="
				+ annStartDate + ", annEndDate=" + annEndDate + ", detail=" + detail + ", annImage="
				+ Arrays.toString(annImage) + ", annFile=" + Arrays.toString(annFile) + ", mngId=" + mngId + ", annAct="
				+ annAct + ", deadline=" + deadline + ", annRegDate=" + annRegDate + ", dDay=" + dDay + ", imageList="
				+ imageList + ", fileList=" + fileList + "]";
	}

}
