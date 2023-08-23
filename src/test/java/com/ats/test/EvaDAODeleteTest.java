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
public class EvaDAODeleteTest {
	private static final Logger logger = LoggerFactory.getLogger(EvaDAOCreateTest.class);

	@Inject
	private EvaDAO dao;
	
	@Test
	public void testDelete() throws Exception {
		int evaNum = 2;

		// 1. 평가자 삭제
		dao.raterListDelete(evaNum);
		// 2. 평가 항목 삭제
		dao.evaItemDelete(evaNum);
		// 3. 공고 삭제
		dao.evaDelete(evaNum);

		// 2) 전체 목록 확인
		SearchCriteria cri = new SearchCriteria();
		List<EvaVO> list = dao.listSearch(cri);

		for (EvaVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}
}
