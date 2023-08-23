package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.EntVO;
import com.ats.domain.MngCopVO;
import com.ats.domain.MngVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.MngLoginDTO;
import com.ats.persistence.MngDAO;

@Service
public class MngServiceImpl implements MngService {

	@Inject
	private MngDAO dao;

	@Override
	public MngVO login(MngLoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void register(EntVO eVo, MngVO mVo) throws Exception {
		// 1. 기업 등록
		int entNum = dao.entCreate(eVo);
		mVo.setEntNum(entNum);
		// 2. 기업 담당자 등록
		dao.mngCreate(mVo);

	}

	@Override
	public MngCopVO read(int entNum, String mngId) throws Exception {
		MngCopVO mcVo = new MngCopVO();
		mcVo.setEntVo(dao.entRead(entNum));

		mcVo.setMngVo(dao.mngRead(mngId));

		return mcVo;
	}

	@Override
	public void modify(EntVO eVo, MngVO mVo) throws Exception {
		dao.entUpdate(eVo);
		dao.mngUpdate(mVo);
	}

	@Override
	public void remove(int entNum, String mngId) throws Exception {
		dao.mngDelete(mngId);
	}

	@Override
	public List<MngVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
