package com.ats.service;

import com.ats.domain.AdminVO;
import com.ats.dto.AdminLoginDTO;

public interface AdminService {
	
	public AdminVO login(AdminLoginDTO dto) throws Exception;

}
