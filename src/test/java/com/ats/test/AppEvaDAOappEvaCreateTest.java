package com.ats.test;

import java.util.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AppEvaVO;
import com.ats.persistence.AppEvaDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AppEvaDAOappEvaCreateTest {
	private static final Logger logger = LoggerFactory.getLogger(AppEvaDAOappEvaCreateTest.class);

	@Inject
	private AppEvaDAO dao;

	@Test
	public void testCreate() throws Exception {
		AppEvaVO vo = new AppEvaVO();
		
		
		vo.setAppNum(6);
		vo.setEvaNum(1);
		vo.setRaterId("rater1");
		vo.setScoreSum(90);
		vo.setScoreComment("합격");
		
		
		
		logger.info("testCreate :" + vo );
		
		dao.appEvaCreate(vo);

	}
}
