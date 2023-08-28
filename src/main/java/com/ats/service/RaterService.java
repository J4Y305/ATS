package com.ats.service;

import java.util.List;

import com.ats.domain.RaterVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.RaterLoginDTO;

public interface RaterService {

	public RaterVO login(RaterLoginDTO dto) throws Exception;

	public void register(RaterVO vo) throws Exception;

	public RaterVO read(String raterId) throws Exception;

	public void modify(RaterVO vo) throws Exception;

	public void remove(String raterId) throws Exception;

	public List<RaterVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	

}
