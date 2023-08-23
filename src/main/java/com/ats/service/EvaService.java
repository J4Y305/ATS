package com.ats.service;

import java.util.List;

import com.ats.domain.EvaVO;
import com.ats.domain.RaterListVO;
import com.ats.domain.SearchCriteria;

public interface EvaService {

	public void register(EvaVO vo) throws Exception;

	public EvaVO read(int evaNum) throws Exception;

	public void modify(EvaVO vo) throws Exception;

	public void remove(int evaNum) throws Exception;

	public List<EvaVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 평가 완료 업데이트
	public void raterCompleteUpdate(RaterListVO vo) throws Exception;

}
