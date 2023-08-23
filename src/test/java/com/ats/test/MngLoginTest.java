package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.MngVO;
import com.ats.dto.MngLoginDTO;
import com.ats.persistence.MngDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class MngLoginTest {

	private static final Logger logger = LoggerFactory.getLogger(MngLoginTest.class);

	@Inject
	private MngDAO dao;

	@Test
	public void loginTest() {

		MngLoginDTO dto = new MngLoginDTO();
		dto.setMngId("mng1");
		dto.setMngPwd("1234");

		try {
			MngVO vo = dao.login(dto);
			logger.info("loginTest():" + vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
