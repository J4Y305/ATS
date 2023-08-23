package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AppVO;
import com.ats.persistence.AppDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AppDAOCreateTest {
	private static final Logger logger = LoggerFactory.getLogger(AppDAOCreateTest.class);

	@Inject
	private AppDAO dao;

	@Test
	public void testCreate() throws Exception {
		AppVO vo = new AppVO();
		
		String userId = "user01";
		vo.setUserId(userId);
		vo.setAppFile("Alphabet");
		vo.setEtc("ABCDEFG");
		vo.setAppSave(0);
		vo.setAnnNum(8);
		
		logger.info("testCreate :" + vo );
		
		dao.create(vo);

	}
}
