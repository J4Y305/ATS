package com.ats.service;

import java.util.List;

import com.ats.domain.EntVO;
import com.ats.domain.MngVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.MngLoginDTO;

public interface MngService {

	public MngVO login(MngLoginDTO dto) throws Exception;

	public void register(EntVO eVo, MngVO mVo) throws Exception;

	public EntVO entRead(int entNum) throws Exception;

	public MngVO mngRead(String mngId) throws Exception;

	public void modify(EntVO eVo, MngVO mVo) throws Exception;

	public void remove(int entNum, String mngId) throws Exception;

	public List<MngVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
