package com.ats.persistence;


import java.util.List;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;
import com.ats.domain.SearchCriteria;


public interface AppDAO {
	public void create(AppVO vo) throws Exception;

	public AppVO read(int AppNum) throws Exception;

	public void update(AppVO vo) throws Exception;

	public void delete(int AppNum) throws Exception;
	
	// 기본 페이징 목록
	public List<AppVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;

}
