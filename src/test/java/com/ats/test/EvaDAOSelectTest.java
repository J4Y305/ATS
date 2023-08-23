package com.ats.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.EvaVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.EvaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class EvaDAOSelectTest {
	private static final Logger logger = LoggerFactory.getLogger(EvaDAOCreateTest.class);

	@Inject
	private EvaDAO dao;
	
	
	@Test
	public void testListAll() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		List<EvaVO> list = dao.listSearch(cri);

		for (EvaVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}

	@Test
	public void testRead() throws Exception {
		logger.info("testRead : " + dao.evaRead(2));

	}
	
	@Test
	public void testEvaItemList() throws Exception {
		logger.info("testEvaItemList : " + dao.evaItemList(2));

	}
	
	@Test
	public void testRaterList() throws Exception {
		logger.info("testRaterList : " + dao.raterArrayList(2));

	}
}
