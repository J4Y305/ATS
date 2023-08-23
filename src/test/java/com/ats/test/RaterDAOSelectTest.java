package com.ats.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.RaterVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.RaterDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class RaterDAOSelectTest {
	private static final Logger logger = LoggerFactory.getLogger(RaterDAOSelectTest.class);

	@Inject
	private RaterDAO dao;

	@Test
	public void testListAll() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		List<RaterVO> list = dao.listSearch(cri);

		for (RaterVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}

	@Test
	public void testRead() throws Exception {
		logger.info("testRead : " + dao.read("rater2"));

	}
}
