package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;
import com.ats.dto.AppEvaDTO;
import com.ats.dto.AppListDTO;
import com.ats.dto.AppPassDTO;
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

	@Override
	public List<AppListDTO> listStoreCriteria(Criteria cri) throws Exception {
		return dao.listStoreCriteria(cri);
	}

	@Override
	public int listStoreCountCriteria(Criteria cri) throws Exception {
		return dao.listStoreCountCriteria(cri);
	}

	@Override
	public List<AppListDTO> listFinalCriteria(Criteria cri) throws Exception {
		return dao.listFinalCriteria(cri);
	}

	@Override
	public int listFinalCountCriteria(Criteria cri) throws Exception {
		return dao.listFinalCountCriteria(cri);
	}

	@Override
	public List<AppVO> listAppEva(AppEvaDTO dto) throws Exception {
		return dao.listAppEva(dto);
	}

	@Override
	public int listCountAppEva(AppEvaDTO dto) throws Exception {
		return dao.listCountAppEva(dto);
	}

	@Override
	public List<AppPassDTO> listAppPassCriteria(String userId) throws Exception {
		return dao.listAppPass(userId);
	}

	@Override
	public int listCountAppPass(String userId) throws Exception {
		return dao.listCountAppPass(userId);
	}

	


}
