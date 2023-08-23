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
public class AnnDAODeleteTest {
	private static final Logger logger = LoggerFactory.getLogger(MngDAOCreateTest.class);

	@Inject
	private AnnDAO dao;

	@Test
	public void testDelete() throws Exception {
		int annNum = 1;

		// 1. 이미지 파일 삭제
		dao.deleteImage(annNum);
		// 2. 첨부파일 삭제
		dao.deleteFile(annNum);
		// 3. 공고 삭제
		dao.delete(annNum);

		// 2) 전체 목록 확인
		SearchCriteria cri = new SearchCriteria();
		List<AnnVO> list = dao.listSearch(cri);

		for (AnnVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}
}
