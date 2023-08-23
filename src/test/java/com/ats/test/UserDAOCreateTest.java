package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.UserVO;
import com.ats.persistence.UserDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class UserDAOCreateTest {
	private static final Logger logger = LoggerFactory.getLogger(UserDAOCreateTest.class);

	@Inject
	private UserDAO dao;

	@Test
	public void testCreate() throws Exception {
		UserVO vo = new UserVO();
		
		vo.setUserId("user02");
		vo.setUserPwd("1234");
		vo.setUserName("Remy");
		vo.setBirthDay("2007-06-28");
		vo.setGender(1);
		vo.setUserEmail("RATATOUILLE@gmail.com");
		vo.setUserPhone("010-0000-0000");
		
		logger.info("testCreate :" + vo );
		
		dao.create(vo);

	}
}
