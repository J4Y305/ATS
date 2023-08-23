package com.ats.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AppVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.AppDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AppDAODeleteTest {

	private static final Logger logger = LoggerFactory.getLogger(AppDAODeleteTest.class);

	@Inject
	private AppDAO dao;

	@Test
	public void testDelete() throws Exception {

		// 1) 유저 정보 삭제
		int AppNum = 4;
		dao.delete(AppNum);

		// 3) 전체 목록 확인
		SearchCriteria cri = new SearchCriteria();
		List<AppVO> list = dao.listCriteria(cri);

		for (AppVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}
}
