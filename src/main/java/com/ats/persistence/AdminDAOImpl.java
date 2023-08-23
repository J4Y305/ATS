package com.ats.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ats.domain.AdminVO;
import com.ats.dto.AdminLoginDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.ats.mapper.AdminMapper";

	@Override
	public AdminVO login(AdminLoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".login", dto);
	}

}
