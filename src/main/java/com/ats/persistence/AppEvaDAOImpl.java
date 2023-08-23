package com.ats.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.AppEvaVO;
import com.ats.domain.Criteria;
import com.ats.domain.EvaDetailVO;

@Repository
public class AppEvaDAOImpl implements AppEvaDAO {

	@Inject
	private SqlSession session;
	private static final String namespace = "com.ats.mapper.AppEvaMapper";

	@Override
	public int appEvaCreate(AppEvaVO vo) throws Exception {
		return session.insert(namespace + ".appEvaCreate", vo);
	}

	@Override
	public AppEvaVO appEvaRead(AppEvaVO vo) throws Exception {
		return session.selectOne(namespace + ".appEvaRead", vo);
	}

	@Override
	public int evaDetailCreate(EvaDetailVO vo) throws Exception {
		return session.insert(namespace + ".evaDetailCreate", vo);
	}

	@Override
	public EvaDetailVO evaDetailRead(EvaDetailVO vo) throws Exception {
		return session.selectOne(namespace + ".evaDetailRead", vo);
	}

	@Override
	public List<AppEvaVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".listCountCriteria", cri);
	}

	@Override
	public List<EvaDetailVO> evaDetailList(AppEvaVO vo) throws Exception {
		return session.selectList(namespace + ".evaDetailList", vo);
	}

}
