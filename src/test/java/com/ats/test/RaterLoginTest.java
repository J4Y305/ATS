package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.persistence.RaterDAO;
import com.ats.domain.RaterVO;
import com.ats.dto.MngLoginDTO;
import com.ats.dto.RaterLoginDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class RaterLoginTest {
	private static final Logger logger = LoggerFactory.getLogger(RaterLoginTest.class);

	@Inject
	private RaterDAO dao;

	@Test
	public void loginTest() {

		RaterLoginDTO dto = new RaterLoginDTO();
		dto.setRaterId("rater1");
		dto.setRaterPwd("1234");

		try {
			RaterVO vo = dao.login(dto);
			logger.info("loginTest():" + vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
