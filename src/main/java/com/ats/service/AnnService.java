package com.ats.service;

import java.util.List;

import com.ats.domain.AnnFileVO;
import com.ats.domain.AnnImageVO;
import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;

public interface AnnService {

	public void register(AnnVO vo) throws Exception;

	public AnnVO read(int AnnNum) throws Exception;

	public void modify(AnnVO vo) throws Exception;

	public void remove(int AnnNum) throws Exception;

	// 기본 페이징 목록
	public List<AnnVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 이미지
	public List<AnnImageVO> imageList(int annNum) throws Exception;

	// 첨부파일
	public List<AnnFileVO> fileList(int annNum) throws Exception;

	public List<AnnVO> listIngSearch(SearchCriteria cri) throws Exception;

	public List<AnnVO> listEndSearch(SearchCriteria cri) throws Exception;

	public int listIngSearchCount(SearchCriteria cri) throws Exception;

	public int listEndSearchCount(SearchCriteria cri) throws Exception;
	
	public List<AnnVO> listIESearch(SearchCriteria cri) throws Exception;

	public int listIESearchCount(SearchCriteria cri) throws Exception;
	
	// 결과조회(유저)
	public List<AnnVO> listSearchResult(SearchCriteria cri) throws Exception;
	
	public int listSearchCountResult(SearchCriteria cri) throws Exception;
	
	
}
