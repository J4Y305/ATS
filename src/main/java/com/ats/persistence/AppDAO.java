package com.ats.persistence;

import java.util.List;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;
import com.ats.domain.SearchCriteria;
import com.ats.dto.AppEvaDTO;
import com.ats.dto.AppListDTO;
import com.ats.dto.AppPassDTO;

public interface AppDAO {
	public void create(AppVO vo) throws Exception;

	public AppVO read(int AppNum) throws Exception;

	public void update(AppVO vo) throws Exception;

	public void delete(int AppNum) throws Exception;

	// 기본 페이징 목록
	public List<AppVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	// 임시 저장한 지원서 목록
	public List<AppListDTO> listStoreCriteria(Criteria cri) throws Exception;

	public int listStoreCountCriteria(Criteria cri) throws Exception;

	// 최종 제출한 지원서 목록
	public List<AppListDTO> listFinalCriteria(Criteria cri) throws Exception;

	public int listFinalCountCriteria(Criteria cri) throws Exception;
	
	// 평가를 위한 지원현황 목록
	public List<AppVO> listAppEva(AppEvaDTO dto) throws Exception;
	
	public int listCountAppEva(AppEvaDTO dto) throws Exception;
	
	// 사용자가 자신이 지원한 지원서의 결과를 조회하는 기능
	public List<AppPassDTO> listAppPass(String userId) throws Exception;
	
	public int listCountAppPass(String userId) throws Exception;
	
	// 담당자가 지원서 조회할 때 최종제출된 지원서만 조회할 수 있도록 하는 기능
	public List<AppVO> finalApplistCriteria(SearchCriteria cri) throws Exception;
	
	public int finalApplistCountCriteria(SearchCriteria cri) throws Exception;
	

}
