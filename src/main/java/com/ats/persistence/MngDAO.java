package com.ats.persistence;

import java.util.List;

import com.ats.domain.EntVO;
import com.ats.domain.MngVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.MngLoginDTO;

public interface MngDAO {

	public MngVO login(MngLoginDTO dto) throws Exception;

	public void mngCreate(MngVO vo) throws Exception;

	public int entCreate(EntVO vo) throws Exception;

	public MngVO mngRead(String mngId) throws Exception;

	public EntVO entRead(int entNum) throws Exception;

	public void mngUpdate(MngVO vo) throws Exception;

	public void entUpdate(EntVO vo) throws Exception;

	public void mngDelete(String mngId) throws Exception;

	public void entDelete(int entNum) throws Exception;

	public List<MngVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
