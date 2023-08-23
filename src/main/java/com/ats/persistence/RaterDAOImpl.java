package com.ats.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.RaterVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.RaterLoginDTO;

@Repository
public class RaterDAOImpl implements RaterDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.ats.mapper.RaterMapper";

	@Override
	public RaterVO login(RaterLoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".login");
	}

	@Override
	public void create(RaterVO vo) throws Exception {
		sqlSession.insert(namespace + ".create", vo);

	}

	@Override
	public RaterVO read(String raterId) throws Exception {
		return sqlSession.selectOne(namespace + ".read", raterId);
	}

	@Override
	public void update(RaterVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String raterId) throws Exception {
		sqlSession.delete(namespace + ".delete", raterId);

	}

	@Override
	public List<RaterVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

}
