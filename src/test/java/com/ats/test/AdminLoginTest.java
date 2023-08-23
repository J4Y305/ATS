package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AdminVO;
import com.ats.dto.AdminLoginDTO;
import com.ats.persistence.AdminDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AdminLoginTest {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginTest.class);

	@Inject
	private AdminDAO dao;

	@Test
	public void loginTest() {

		AdminLoginDTO dto = new AdminLoginDTO();
		dto.setAdminId("admin1");
		dto.setAdminPwd("1234");
		try {
			AdminVO vo = dao.login(dto);
			logger.info("loginTest()" + vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
