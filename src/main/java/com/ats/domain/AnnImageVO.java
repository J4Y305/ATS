package com.ats.domain;

public class AnnImageVO {
	private int annImageNum;
	private int annNum;
	private String annImageName;
	private String fileLocation;

	public int getAnnImageNum() {
		return annImageNum;
	}

	public void setAnnImageNum(int annImageNum) {
		this.annImageNum = annImageNum;
	}

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public String getAnnImageName() {
		return annImageName;
	}

	public void setAnnImageName(String annImageName) {
		this.annImageName = annImageName;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	@Override
	public String toString() {
		return "AnnImageVO [annImageNum=" + annImageNum + ", annNum=" + annNum + ", annImageName=" + annImageName
				+ ", fileLocation=" + fileLocation + "]";
	}

}
