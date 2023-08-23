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
import com.ats.domain.SearchCriteria;
import com.ats.persistence.AnnDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AnnDAOSelectTest {
	private static final Logger logger = LoggerFactory.getLogger(MngDAOCreateTest.class);

	@Inject
	private AnnDAO dao;
	
	@Test
	public void testListAll() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		List<AnnVO> list = dao.listSearch(cri);

		for (AnnVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}

	@Test
	public void testRead() throws Exception {
		logger.info("testRead : " + dao.read(1));

	}
	
	@Test
	public void testImageList() throws Exception {
		logger.info("testImageList : " + dao.imageList(1));

	}
	
	@Test
	public void testFileList() throws Exception {
		logger.info("testFileList : " + dao.fileList(1));

	}
}
