package com.ats.domain;

public class EvaDetailVO {

	private int evaDetailNum;
	private int evaNum;
	private int appNum;
	private String raterId;
	private int evaItemNum;
	private int evaDetailScore;

	public int getEvaDetailNum() {
		return evaDetailNum;
	}

	public void setEvaDetailNum(int evaDetailNum) {
		this.evaDetailNum = evaDetailNum;
	}

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

	public int getEvaItemNum() {
		return evaItemNum;
	}

	public void setEvaItemNum(int evaItemNum) {
		this.evaItemNum = evaItemNum;
	}

	public int getEvaDetailScore() {
		return evaDetailScore;
	}

	public void setEvaDetailScore(int evaDetailScore) {
		this.evaDetailScore = evaDetailScore;
	}

	@Override
	public String toString() {
		return "EvaDetailVO [evaDetailNum=" + evaDetailNum + ", evaNum=" + evaNum + ", appNum=" + appNum + ", raterId="
				+ raterId + ", evaItemNum=" + evaItemNum + ", evaDetailScore=" + evaDetailScore + "]";
	}

}
