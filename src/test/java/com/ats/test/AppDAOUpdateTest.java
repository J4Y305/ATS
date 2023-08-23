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
public class AppDAOUpdateTest {
	private static final Logger logger = LoggerFactory.getLogger(AppDAOUpdateTest.class);

	@Inject
	private AppDAO dao;

	@Test
	public void testUpdate() throws Exception {
		AppVO vo = new AppVO();
		
		vo.setAppNum(4);
		vo.setAppFile("Omegabet");
		vo.setEtc("ZYXWVUT수정");
		vo.setAppSave(1);

		logger.info("testUpdate :" + vo);

		dao.update(vo);

	}
}
