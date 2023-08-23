package com.ats.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.EvaItemVO;
import com.ats.domain.EvaVO;
import com.ats.domain.RaterListVO;
import com.ats.domain.SearchCriteria;

@Repository
public class EvaDAOImpl implements EvaDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.ats.mapper.EvaMapper";

	@Override
	public int evaCreate(EvaVO vo) throws Exception {
		return sqlSession.insert(namespace + ".evaCreate", vo);
	}

	@Override
	public void evaItemCreate(EvaItemVO vo) throws Exception {
		sqlSession.insert(namespace + ".evaItemCreate", vo);
	}

	@Override
	public void raterListCreate(RaterListVO vo) throws Exception {
		sqlSession.insert(namespace + ".raterListCreate", vo);
	}

	@Override
	public EvaVO evaRead(int evaNum) throws Exception {
		return sqlSession.selectOne(namespace + ".evaRead", evaNum);
	}

	@Override
	public List<EvaItemVO> evaItemList(int evaNum) throws Exception {
		return sqlSession.selectList(namespace + ".evaItemList", evaNum);
	}

	@Override
	public List<RaterListVO> raterArrayList(int evaNum) throws Exception {
		return sqlSession.selectList(namespace + ".raterArrayList", evaNum);
	}

	@Override
	public void evaUpdate(EvaVO vo) throws Exception {
		sqlSession.update(namespace + ".evaUpdate", vo);
	}

	@Override
	public void evaItemUpdate(EvaItemVO vo) throws Exception {
		sqlSession.update(namespace + ".evaItemUpdate", vo);
	}

	@Override
	public void raterListUpdate(RaterListVO vo) throws Exception {
		sqlSession.update(namespace + ".raterListUpdate", vo);
	}

	@Override
	public void evaDelete(int evaNum) throws Exception {
		sqlSession.delete(namespace + ".evaDelete", evaNum);
	}

	@Override
	public void evaItemDelete(int evaNum) throws Exception {
		sqlSession.delete(namespace + ".evaItemDelete", evaNum);
	}

	@Override
	public void raterListDelete(int evaNum) throws Exception {
		sqlSession.delete(namespace + ".raterListDelete", evaNum);
	}

	@Override
	public List<EvaVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void raterCompleteUpdate(RaterListVO vo) throws Exception {
		sqlSession.update(namespace + ".raterCompleteUpdate", vo);
	}


}
