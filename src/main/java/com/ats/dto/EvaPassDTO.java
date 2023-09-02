package com.ats.dto;

public class EvaPassDTO {

	private int evaNum;
	private int appNum;
	private String raterId;
	private String userName;
	private String details;
	private int score;
	private int totalSum;
	private float totalAvg;
	private int passCheck;


	public int getEvaNum() {
		return evaNum;
	}

	public void setEvaNum(int evaNum) {
		this.evaNum = evaNum;
	}

	public int getAppNum() {
		return appNum;
	}

	public void setAppNum(int appNum) {
		this.appNum = appNum;
	}

	public String getRaterId() {
		return raterId;
	}

	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getTotalSum() {
		return totalSum;
	}

	public void setTotalSum(int totalSum) {
		this.totalSum = totalSum;
	}

	public float getTotalAvg() {
		return totalAvg;
	}

	public void setTotalAvg(float totalAvg) {
		this.totalAvg = totalAvg;
	}

	public int getPassCheck() {
		return passCheck;
	}

	public void setPassCheck(int passCheck) {
		this.passCheck = passCheck;
	}

	@Override
	public String toString() {
		return "EvaPassDTO [evaNum=" + evaNum + ", appNum=" + appNum + ", raterId=" + raterId + ", userName=" + userName
				+ ", details=" + details + ", score=" + score + ", totalSum=" + totalSum + ", totalAvg=" + totalAvg
				+ ", passCheck=" + passCheck + "]";
	}

}
