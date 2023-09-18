package com.ats.persistence;

import java.util.List;

import com.ats.domain.RaterVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.RaterLoginDTO;

public interface RaterDAO {

	public RaterVO login(RaterLoginDTO dto) throws Exception;

	public void create(RaterVO vo) throws Exception;

	public RaterVO read(String raterId) throws Exception;

	public void update(RaterVO vo) throws Exception;

	public int delete(String raterId);

	public List<RaterVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
