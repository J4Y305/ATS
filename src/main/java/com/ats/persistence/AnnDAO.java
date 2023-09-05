package com.ats.persistence;

import java.util.List;

import com.ats.domain.AnnFileVO;
import com.ats.domain.AnnImageVO;
import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;

public interface AnnDAO {

	public int create(AnnVO vo) throws Exception;

	public AnnVO read(int annNum) throws Exception;

	public void update(AnnVO vo) throws Exception;

	public void delete(int annNum) throws Exception;

	public List<AnnVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void insertImage(AnnImageVO vo) throws Exception;

	public void deleteImage(int annNum) throws Exception;

	public List<AnnImageVO> imageList(int annNum) throws Exception;

	public void insertFile(AnnFileVO vo) throws Exception;

	public void deleteFile(int annNum) throws Exception;

	public List<AnnFileVO> fileList(int annNum) throws Exception;

	// 진행중인 공고, 마감된 공고 불러오기
	public List<AnnVO> listIngSearch(SearchCriteria cri) throws Exception;

	public List<AnnVO> listEndSearch(SearchCriteria cri) throws Exception;

	public int listIngSearchCount(SearchCriteria cri) throws Exception;

	public int listEndSearchCount(SearchCriteria cri) throws Exception;

	// 진행 + 마감된 공고 불러오기
	public List<AnnVO> listIESearch(SearchCriteria cri) throws Exception;

	public int listIESearchCount(SearchCriteria cri) throws Exception;

	// 결과조회(유저)
	public List<AnnVO> listSearchResult(SearchCriteria cri) throws Exception;

	public int listSearchCountResult(SearchCriteria cri) throws Exception;
	
	// 마감기한 지나면 마감 여부 Update
	public void deadLineUpdate() throws Exception;

}
