package com.ats.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.MngVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.MngDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class MngDAOSelectTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MngDAOCreateTest.class);

	@Inject
	private MngDAO dao;

	@Test
	public void testListAll() throws Exception {
		
		SearchCriteria cri = new SearchCriteria();
		List<MngVO> list = dao.listSearch(cri);

		for (MngVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info("testRead : " + dao.entRead(2));
		logger.info("testRead : " + dao.mngRead("mng2"));
	}
}
