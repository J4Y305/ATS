package com.ats.service;

import java.util.List;

import com.ats.domain.EvaItemVO;
import com.ats.domain.EvaVO;
import com.ats.domain.PassVO;
import com.ats.domain.RaterListVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.EvaPassDTO;

public interface EvaService {

	public void register(EvaVO vo) throws Exception;

	public EvaVO read(int evaNum) throws Exception;

	public void modify(EvaVO vo) throws Exception;

	public void remove(int evaNum) throws Exception;

	// 평가 항목 읽기
	public List<EvaItemVO> evaItemList(int evaNum) throws Exception;

	public List<EvaVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 평가 완료 업데이트
	public void raterCompleteUpdate(RaterListVO vo) throws Exception;

	// 평가 완료 조회
	public List<RaterListVO> raterArrayList(int evaNum) throws Exception;

	public List<EvaVO> listMngEva(SearchCriteria cri) throws Exception;

	public int listMngEvaCount(SearchCriteria cri) throws Exception;

	// 합격을 위한 평가 리스트 불러오기
	public List<EvaPassDTO> listEvaPass(int evaNum) throws Exception;

	// 합격 결과 등록
	public void evaPassRegister(PassVO vo) throws Exception;

	// 합격자 조회
	public List<PassVO> listPassUser(int evaNum) throws Exception;

}
