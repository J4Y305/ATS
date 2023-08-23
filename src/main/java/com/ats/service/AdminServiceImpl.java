package com.ats.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.AdminVO;
import com.ats.dto.AdminLoginDTO;
import com.ats.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public AdminVO login(AdminLoginDTO dto) throws Exception {
		return dao.login(dto);
	}

}
