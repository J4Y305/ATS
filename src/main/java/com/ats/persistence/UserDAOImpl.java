package com.ats.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;
import com.ats.domain.UserVO;
import com.ats.dto.UserLoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	private static final String namespace = "com.ats.mapper.UserMapper";

	@Override
	public UserVO login(UserLoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		
	}

	@Override
	public UserVO read(String userid) throws Exception {
		return session.selectOne(namespace + ".read", userid);
	}

	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String userid) throws Exception {
		session.delete(namespace + ".delete", userid);
		
	}

	@Override
	public List<UserVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

}
