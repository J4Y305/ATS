package com.ats.domain;

public class MngCopVO {

	private MngVO mngVo;
	private EntVO entVo;

	public MngVO getMngVo() {
		return mngVo;
	}

	public void setMngVo(MngVO mngVo) {
		this.mngVo = mngVo;
	}

	public EntVO getEntVo() {
		return entVo;
	}

	public void setEntVo(EntVO entVo) {
		this.entVo = entVo;
	}

	@Override
	public String toString() {
		return "MngCopVO [mngVo=" + mngVo + ", entVo=" + entVo + "]";
	}

}
