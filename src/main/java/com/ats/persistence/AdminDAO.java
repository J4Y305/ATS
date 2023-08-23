package com.ats.persistence;

import com.ats.domain.AdminVO;
import com.ats.dto.AdminLoginDTO;

public interface AdminDAO {

	public AdminVO login(AdminLoginDTO dto) throws Exception;
	
	
}
