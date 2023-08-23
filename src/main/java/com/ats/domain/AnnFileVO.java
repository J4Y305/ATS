package com.ats.domain;

public class AnnFileVO {

	private int annFileNum;
	private int annNum;
	private String annFileName;
	private String fileLocation;

	public int getAnnFileNum() {
		return annFileNum;
	}

	public void setAnnFileNum(int annFileNum) {
		this.annFileNum = annFileNum;
	}

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public String getAnnFileName() {
		return annFileName;
	}

	public void setAnnFileName(String annFileName) {
		this.annFileName = annFileName;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	@Override
	public String toString() {
		return "AnnFileVO [annFileNum=" + annFileNum + ", annNum=" + annNum + ", annFileName=" + annFileName
				+ ", fileLocation=" + fileLocation + "]";
	}

}
