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
	public void aeRegister(AppEvaVO vo, int[] evaItemNums, int[] evaDetailScores) throws Exception {
		
		// 1) 지원자에 대한 종합 평가 등록
		dao.appEvaCreate(vo);
		
		// 2) 평가 항목에 따른 점수 등록
		for(int i=0; i<evaItemNums.length; i++) {
			EvaDetailVO detailVO = new EvaDetailVO();
			detailVO.setAppNum(vo.getAppNum());
			detailVO.setEvaNum(vo.getEvaNum());
			detailVO.setRaterId(vo.getRaterId());
			
			detailVO.setEvaItemNum(evaItemNums[i]);
			detailVO.setEvaDetailScore(evaDetailScores[i]);
			
			dao.evaDetailCreate(detailVO);
		}
		
	}

	@Override
	public void edRegister(EvaDetailVO vo) throws Exception {
		dao.evaDetailCreate(vo);
	}

	@Override
	public AppEvaVO read(AppEvaVO vo) throws Exception {
		return dao.appEvaRead(vo);
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
