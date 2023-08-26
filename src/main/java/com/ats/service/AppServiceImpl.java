package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;
import com.ats.persistence.AppDAO;

@Service
public class AppServiceImpl implements AppService{

	@Inject
	private AppDAO dao; 
	
	
	@Override
	public void register(AppVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public AppVO read(int AppNum) throws Exception {
		return dao.read(AppNum);
	}

	@Override
	public void modify(AppVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(int AppNum) throws Exception {
		dao.delete(AppNum);
	}

	@Override
	public List<AppVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.listCountCriteria(cri);
	}


}
