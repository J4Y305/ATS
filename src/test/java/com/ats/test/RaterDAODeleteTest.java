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
public class RaterDAODeleteTest {
	private static final Logger logger = LoggerFactory.getLogger(RaterDAOSelectTest.class);

	@Inject
	private RaterDAO dao;
	
	@Test
	public void testDelete() throws Exception {

		// 1) 기업 담당자 정보 삭제
		String raterId = "rater2";
		dao.delete(raterId);


		// 2) 전체 목록 확인
		SearchCriteria cri = new SearchCriteria();
		List<RaterVO> list = dao.listSearch(cri);

		for (RaterVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}
}
