package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.RaterVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.RaterLoginDTO;
import com.ats.persistence.RaterDAO;

@Service
public class RaterServiceImpl implements RaterService {

	@Inject
	private RaterDAO dao;

	@Override
	public RaterVO login(RaterLoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void register(RaterVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public RaterVO read(String raterId) throws Exception {
		return dao.read(raterId);
	}

	@Override
	public void modify(RaterVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int remove(String raterId){
		return dao.delete(raterId);
		
	}

	@Override
	public List<RaterVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
