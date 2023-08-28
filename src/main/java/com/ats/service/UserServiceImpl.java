package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.SearchCriteria;
import com.ats.domain.UserVO;
import com.ats.dto.UserLoginDTO;
import com.ats.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(UserLoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void register(UserVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public UserVO read(String userId) throws Exception {
		return dao.read(userId);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		System.out.println(vo);
		dao.update(vo);
		System.out.println(vo);
	}

	@Override
	public void remove(String userId) throws Exception {
		dao.delete(userId);
	}

	@Override
	public List<UserVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	

}
