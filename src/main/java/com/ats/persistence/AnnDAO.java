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

}
