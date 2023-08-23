package com.ats.domain;

public class EvaItemVO {

	private int evaNum;
	private String evaPlot;
	private int evaScore;
	private int evaItemNum;

	public int getEvaNum() {
		return evaNum;
	}

	public void setEvaNum(int evaNum) {
		this.evaNum = evaNum;
	}

	public String getEvaPlot() {
		return evaPlot;
	}

	public void setEvaPlot(String evaPlot) {
		this.evaPlot = evaPlot;
	}

	public int getEvaScore() {
		return evaScore;
	}

	public void setEvaScore(int evaScore) {
		this.evaScore = evaScore;
	}

	public int getEvaItemNum() {
		return evaItemNum;
	}

	public void setEvaItemNum(int evaItemNum) {
		this.evaItemNum = evaItemNum;
	}

	@Override
	public String toString() {
		return "EvaItemVO [evaNum=" + evaNum + ", evaPlot=" + evaPlot + ", evaScore=" + evaScore + ", evaItemNum="
				+ evaItemNum + "]";
	}

}
