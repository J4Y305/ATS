package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AppVO;
import com.ats.domain.EvaDetailVO;
import com.ats.persistence.AppDAO;
import com.ats.persistence.AppEvaDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AppEvaDAOevaDetailCreateTest {
	private static final Logger logger = LoggerFactory.getLogger(AppEvaDAOevaDetailCreateTest.class);

	@Inject
	private AppEvaDAO dao;

	@Test
	public void testCreate() throws Exception {
		EvaDetailVO vo = new EvaDetailVO();
	
		
		vo.setEvaNum(1);
		vo.setAppNum(6);
		vo.setRaterId("rater1");
		vo.setEvaItemNum(1);
		vo.setEvaDetailScore(88);
		
		logger.info("testCreate :" + vo );
		
		dao.evaDetailCreate(vo);

	}
}
