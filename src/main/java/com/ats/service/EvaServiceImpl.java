package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.EvaItemVO;
import com.ats.domain.EvaVO;
import com.ats.domain.RaterListVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.EvaDAO;

@Service
public class EvaServiceImpl implements EvaService {

	@Inject
	private EvaDAO dao;

	@Override
	public void register(EvaVO vo) throws Exception {
		// 1. 평가 기본 내용 저장
		int evaNum = dao.evaCreate(vo);

		// 2. 평가 문항 등록
		// 2-1) 평가 문항 유무 확인
		if (vo.getEvaItem() != null) {

			// 2-2) 다중 평가 문항 저장
			for (int i = 0; i < vo.getEvaItem().length; i++) {

				EvaItemVO iVo = new EvaItemVO();
				// TextArea 줄바꿈 처리
				String evaPlot = vo.getEvaItem()[i].replace("\\r\\n", "<br>");
				iVo.setEvaPlot(evaPlot);
				iVo.setEvaNum(evaNum);
				iVo.setEvaScore(vo.getEvaScore()[i]);

				dao.evaItemCreate(iVo);
			}
		}

		// 3. 해당 평가의 평가자 등록
		// 3-1) 평가자 존재 유무 확인
		if (vo.getRaterList() != null) {

			// 3-2) 평가자 저장
			for (int i = 0; i < vo.getRaterList().length; i++) {

				RaterListVO rVo = new RaterListVO();
				rVo.setEvaNum(evaNum);
				rVo.setRaterId(vo.getRaterList()[i]);

				dao.raterListCreate(rVo);
			}
		}

	}

	@Override
	public EvaVO read(int evaNum) throws Exception {
		return dao.evaRead(evaNum);
	}

	@Override
	public void modify(EvaVO vo) throws Exception {
		// 1. 평가 기본 내용 저장
		dao.evaUpdate(vo);

		// 2. 평가 문항, 해당 평가 평가자 삭제
		dao.evaItemDelete(vo.getEvaNum());
		dao.raterListDelete(vo.getEvaNum());

		// 3. 평가 문항 등록
		// 3-1) 평가 문항 유무 확인
		if (vo.getEvaItem() != null) {

			// 3-2) 다중 평가 문항 저장
			for (int i = 0; i < vo.getEvaItem().length; i++) {

				EvaItemVO iVo = new EvaItemVO();
				// TextArea 줄바꿈 처리
				String evaPlot = vo.getEvaItem()[i].replace("\\r\\n", "<br>");
				iVo.setEvaPlot(evaPlot);
				iVo.setEvaNum(vo.getEvaNum());
				iVo.setEvaScore(vo.getEvaScore()[i]);

				dao.evaItemCreate(iVo);
			}
		}

		// 4. 해당 평가의 평가자 등록
		// 4-1) 평가자 존재 유무 확인
		if (vo.getRaterList() != null) {

			// 4-2) 다중 첨부파일 저장
			for (int i = 0; i < vo.getRaterList().length; i++) {

				RaterListVO rVo = new RaterListVO();
				rVo.setEvaNum(vo.getEvaNum());
				rVo.setRaterId(vo.getRaterList()[i]);

				dao.raterListCreate(rVo);
			}
		}

	}

	@Override
	public void remove(int evaNum) throws Exception {
		// 1. 평가자 삭제
		dao.raterListDelete(evaNum);
		// 2. 평가 항목 삭제
		dao.evaItemDelete(evaNum);
		// 3. 공고 삭제
		dao.evaDelete(evaNum);

	}

	@Override
	public List<EvaVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void raterCompleteUpdate(RaterListVO vo) throws Exception {
		dao.raterCompleteUpdate(vo);
	}

	

}