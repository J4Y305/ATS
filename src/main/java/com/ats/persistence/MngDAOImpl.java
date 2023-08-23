package com.ats.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.EntVO;
import com.ats.domain.MngVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.MngLoginDTO;

@Repository
public class MngDAOImpl implements MngDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.ats.mapper.MngMapper";
	
	@Override
	public MngVO login(MngLoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".login", dto);
	}

	@Override
	public void mngCreate(MngVO vo) throws Exception {
		sqlSession.insert(namespace + ".mngCreate", vo);
		
	}

	@Override
	public int entCreate(EntVO vo) throws Exception {
		sqlSession.insert(namespace + ".entCreate", vo);
		return vo.getEntNum();
	}

	@Override
	public MngVO mngRead(String mngId) throws Exception {
		return sqlSession.selectOne(namespace + ".mngRead", mngId);
	}

	@Override
	public EntVO entRead(int entNum) throws Exception {
		return sqlSession.selectOne(namespace + ".entRead", entNum);
	}

	@Override
	public void mngUpdate(MngVO vo) throws Exception {
		sqlSession.update(namespace + ".mngUpdate", vo);
		
	}

	@Override
	public void entUpdate(EntVO vo) throws Exception {
		sqlSession.update(namespace + ".entUpdate", vo);
		
	}

	@Override
	public void mngDelete(String mngId) throws Exception {
		sqlSession.delete(namespace + ".mngDelete", mngId);
		
	}

	@Override
	public void entDelete(int entNum) throws Exception {
		sqlSession.delete(namespace + ".entDelete", entNum);
		
	}

	@Override
	public List<MngVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}
	
}
