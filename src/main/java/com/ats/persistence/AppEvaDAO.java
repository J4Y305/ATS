package com.ats.persistence;

import java.util.List;

import com.ats.domain.AppEvaVO;
import com.ats.domain.Criteria;
import com.ats.domain.EvaDetailVO;

public interface AppEvaDAO {
	public int appEvaCreate(AppEvaVO vo) throws Exception;

	public AppEvaVO appEvaRead(AppEvaVO vo) throws Exception;
	
	public int evaDetailCreate(EvaDetailVO vo) throws Exception;
	
	public EvaDetailVO evaDetailRead(EvaDetailVO vo) throws Exception;
	
	public List<EvaDetailVO> evaDetailList(AppEvaVO vo) throws Exception;
	
	// 기본 페이징 목록
	public List<AppEvaVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
}
