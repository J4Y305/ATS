package com.ats.dto;

import com.ats.domain.SearchCriteria;

public class AppEvaDTO {

	private SearchCriteria cri;
	private int annNum;
	private String raterId;

	public SearchCriteria getCri() {
		return cri;
	}

	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}

	public int getAnnNum() {
		return annNum;
	}

	public void setAnnNum(int annNum) {
		this.annNum = annNum;
	}

	public String getRaterId() {
		return raterId;
	}

	public void setRaterId(String raterId) {
		this.raterId = raterId;
	}

	@Override
	public String toString() {
		return "AppEvaDTO [cri=" + cri + ", annNum=" + annNum + ", raterId=" + raterId + "]";
	}

}
