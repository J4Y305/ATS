package com.ats.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.AppVO;
import com.ats.domain.Criteria;
import com.ats.dto.AppListDTO;

@Repository
public class AppDAOImpl implements AppDAO{
	
	@Inject
	private SqlSession session;
	private static final String namespace = "com.ats.mapper.AppMapper";


	@Override
	public void create(AppVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		
	}

	@Override
	public AppVO read(int AppNum) throws Exception {
		return session.selectOne(namespace + ".read", AppNum);
	}

	@Override
	public void update(AppVO vo) throws Exception {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void delete(int AppNum) throws Exception {
		session.delete(namespace + ".delete", AppNum);	
	}

	@Override
	public List<AppVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".listCountCriteria", cri);
	}

	@Override
	public List<AppListDTO> listStoreCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listStoreCriteria", cri);
	}

	@Override
	public int listStoreCountCriteria(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".listStoreCountCriteria", cri);
	}

	@Override
	public List<AppListDTO> listFinalCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listFinalCountCriteria", cri);
	}

	@Override
	public int listFinalCountCriteria(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".listFinalCountCriteria", cri);
	}


}
