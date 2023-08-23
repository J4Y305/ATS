package com.ats.domain;

public class RaterListVO {

	private int evaNum;
	private String raterId;
	private int complete;

	public int getEvaNum() {
		return evaNum;
	}

	public void setEvaNum(int evaNum) {
		this.evaNum = evaNum;
	}

	public String getRaterId() {
		return raterId;
	}

	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}

	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	@Override
	public String toString() {
		return "RaterListVO [evaNum=" + evaNum + ", raterId=" + raterId + ", complete=" + complete + "]";
	}

}
