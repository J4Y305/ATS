package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.RaterVO;
import com.ats.persistence.RaterDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class RaterDAOUpdateTest {
	private static final Logger logger = LoggerFactory.getLogger(RaterDAOUpdateTest.class);

	@Inject
	private RaterDAO dao;
	
	@Test
	public void testUpdate() throws Exception {

		RaterVO rVo = new RaterVO();
		rVo.setRaterId("rater2");
		rVo.setRaterPwd("1234");
		rVo.setRaterName("김커피");
		rVo.setRaterDept("항공우주학과");
		rVo.setRaterRank("조교");
		rVo.setRaterPhone("010-9845-7856");
		rVo.setRaterEmail("ehdeh21@daum.net");

		logger.info("testUpdate :" + rVo);

		dao.update(rVo);

	}
}
