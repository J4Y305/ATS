package com.ats.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AnnVO;
import com.ats.domain.AppEvaVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.AnnDAO;
import com.ats.persistence.AppEvaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AppEvaDAOappEvaReadTest {
	private static final Logger logger = LoggerFactory.getLogger(AppEvaDAOappEvaReadTest.class);

	@Inject
	private AppEvaDAO dao;
	
	@Test
	public void testListAll() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		List<AppEvaVO> list = dao.listCriteria(cri);

		for (AppEvaVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}

//	@Test
//	public void testRead() throws Exception {
//		logger.info("testRead : " + dao.appEvaRead(6));
//
//	}
}
