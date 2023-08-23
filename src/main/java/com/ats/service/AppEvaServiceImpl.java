package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.AppEvaVO;
import com.ats.domain.Criteria;
import com.ats.domain.EvaDetailVO;
import com.ats.persistence.AppEvaDAO;

@Service
public class AppEvaServiceImpl implements AppEvaService {
	
	@Inject
	private AppEvaDAO dao;
	
	@Override
	public void aeRegister(AppEvaVO vo) throws Exception {
		dao.appEvaCreate(vo);
	}

	@Override
	public void edRegister(EvaDetailVO vo) throws Exception {
		dao.evaDetailCreate(vo);
	}

	@Override
	public void read(AppEvaVO vo) throws Exception {
		dao.appEvaRead(vo);
	}

	@Override
	public List<AppEvaVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.listCountCriteria(cri);
	}

	@Override
	public List<EvaDetailVO> evaDetailList(AppEvaVO vo) throws Exception {
		return dao.evaDetailList(vo);
	}

}
