package com.ats.persistence;

import java.util.List;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;
import com.ats.dto.AppEvaDTO;
import com.ats.dto.AppListDTO;

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

}
