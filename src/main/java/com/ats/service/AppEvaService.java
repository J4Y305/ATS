package com.ats.service;

import java.util.List;

import com.ats.domain.AppEvaVO;
import com.ats.domain.Criteria;
import com.ats.domain.EvaDetailVO;

public interface AppEvaService {

	public void aeRegister(AppEvaVO vo) throws Exception;

	public void edRegister(EvaDetailVO vo) throws Exception;

	public void read(AppEvaVO vo) throws Exception;

	public List<AppEvaVO> listCriteria (Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<EvaDetailVO> evaDetailList(AppEvaVO vo) throws Exception;
}
