package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.persistence.UserDAO;

import com.ats.domain.UserVO;

import com.ats.dto.UserLoginDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class UserLoginTest {
	private static final Logger logger = LoggerFactory.getLogger(UserLoginTest.class);

	@Inject
	private UserDAO dao;

	@Test
	public void loginTest() {

		UserLoginDTO dto = new UserLoginDTO();
		dto.setUserId("user01");
		dto.setUserPwd("1234");

		try {
			UserVO vo = dao.login(dto);
			logger.info("loginTest():" + vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
