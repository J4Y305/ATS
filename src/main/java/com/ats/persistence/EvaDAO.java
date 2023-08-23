package com.ats.persistence;

import java.util.List;

import com.ats.domain.EvaItemVO;
import com.ats.domain.EvaVO;
import com.ats.domain.RaterListVO;
import com.ats.domain.SearchCriteria;

public interface EvaDAO {

	public int evaCreate(EvaVO vo) throws Exception;

	public void evaItemCreate(EvaItemVO vo) throws Exception;

	public void raterListCreate(RaterListVO vo) throws Exception;

	public EvaVO evaRead(int evaNum) throws Exception;

	public List<EvaItemVO> evaItemList(int evaNum) throws Exception;

	public List<RaterListVO> raterArrayList(int evaNum) throws Exception;

	public void evaUpdate(EvaVO vo) throws Exception;

	public void evaItemUpdate(EvaItemVO vo) throws Exception;

	public void raterListUpdate(RaterListVO vo) throws Exception;

	public void evaDelete(int evaNum) throws Exception;

	public void evaItemDelete(int evaNum) throws Exception;

	public void raterListDelete(int evaNum) throws Exception;

	public List<EvaVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	// 평가 완료 없데이트
	public void raterCompleteUpdate(RaterListVO vo) throws Exception;

}
