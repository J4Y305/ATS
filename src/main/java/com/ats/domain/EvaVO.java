package com.ats.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class EvaVO {

	private int evaNum;
	private int annNum;
	private String evaName;
	private int degree;
	private Date evaStartDate;
	private Date evaEndDate;
	private Date evaRegDate;
	private String[] evaItem;
	private int[] evaScore;
	private String[] raterList;
	private int evaPass;

	private String mngId;

	private ArrayList<EvaItemVO> evaItemList;
	private ArrayList<RaterListVO> raterArrayList;

	public int getEvaNum() {
		return evaNum;
	}

	public void setEvaNum(int evaNum) {
		this.evaNum = evaNum;
	}

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public String getEvaName() {
		return evaName;
	}

	public void setEvaName(String evaName) {
		this.evaName = evaName;
	}

	public int getDegree() {
		return degree;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public Date getEvaStartDate() {
		return evaStartDate;
	}

	public void setEvaStartDate(Date evaStartDate) {
		this.evaStartDate = evaStartDate;
	}

	public Date getEvaEndDate() {
		return evaEndDate;
	}

	public void setEvaEndDate(Date evaEndDate) {
		this.evaEndDate = evaEndDate;
	}

	public Date getEvaRegDate() {
		return evaRegDate;
	}

	public void setEvaRegDate(Date evaRegDate) {
		this.evaRegDate = evaRegDate;
	}

	public String[] getEvaItem() {
		return evaItem;
	}

	public void setEvaItem(String[] evaItem) {
		this.evaItem = evaItem;
	}

	public int[] getEvaScore() {
		return evaScore;
	}

	public void setEvaScore(int[] evaScore) {
		this.evaScore = evaScore;
	}

	public String[] getRaterList() {
		return raterList;
	}

	public void setRaterList(String[] raterList) {
		this.raterList = raterList;
	}

	public ArrayList<EvaItemVO> getEvaItemList() {
		return evaItemList;
	}

	public void setEvaItemList(ArrayList<EvaItemVO> evaItemList) {
		this.evaItemList = evaItemList;
	}

	public ArrayList<RaterListVO> getRaterArrayList() {
		return raterArrayList;
	}

	public void setRaterArrayList(ArrayList<RaterListVO> raterArrayList) {
		this.raterArrayList = raterArrayList;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public int getEvaPass() {
		return evaPass;
	}

	public void setEvaPass(int evaPass) {
		this.evaPass = evaPass;
	}

	@Override
	public String toString() {
		return "EvaVO [evaNum=" + evaNum + ", annNum=" + annNum + ", evaName=" + evaName + ", degree=" + degree
				+ ", evaStartDate=" + evaStartDate + ", evaEndDate=" + evaEndDate + ", evaRegDate=" + evaRegDate
				+ ", evaItem=" + Arrays.toString(evaItem) + ", evaScore=" + Arrays.toString(evaScore) + ", raterList="
				+ Arrays.toString(raterList) + ", evaPass=" + evaPass + ", mngId=" + mngId + ", evaItemList="
				+ evaItemList + ", raterArrayList=" + raterArrayList + "]";
	}

}
