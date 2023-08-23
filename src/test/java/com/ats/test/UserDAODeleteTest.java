package com.ats.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.SearchCriteria;
import com.ats.domain.UserVO;
import com.ats.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class UserDAODeleteTest {

	private static final Logger logger = LoggerFactory.getLogger(UserDAODeleteTest.class);

	@Inject
	private UserDAO dao;

	@Test
	public void testDelete() throws Exception {

		// 1) 유저 정보 삭제
		String userId = "UUSSEERR";
		dao.delete(userId);

		// 3) 전체 목록 확인
		SearchCriteria cri = new SearchCriteria();
		List<UserVO> list = dao.listSearch(cri);

		for (UserVO vo : list) {
			logger.info("testListAll :" + vo);
		}
	}
}
