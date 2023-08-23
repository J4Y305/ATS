package com.ats.service;

import java.util.List;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;

public interface AppService {
	
	public void register(AppVO vo) throws Exception;

	public AppVO read(int AppNum) throws Exception;

	public void modify(AppVO vo) throws Exception;

	public void remove(int AppNum) throws Exception;
	
	// 기본 페이징 목록
	public List<AppVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
}
