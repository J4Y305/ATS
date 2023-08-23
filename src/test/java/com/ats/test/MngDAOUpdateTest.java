package com.ats.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.EntVO;
import com.ats.domain.MngVO;
import com.ats.persistence.MngDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class MngDAOUpdateTest {
	private static final Logger logger = LoggerFactory.getLogger(MngDAOCreateTest.class);

	@Inject
	private MngDAO dao;
	
	@Test
	public void testUpdate() throws Exception {
		EntVO eVo = new EntVO();
		
		eVo.setEntNum(8);
		eVo.setEntName("테미오래_수정");
		eVo.setCategory("문화/전시_수정");
		eVo.setAddress("대전광역시 동구 옛 충청남도 도지시 관사_수정");
		eVo.setZipCode("000-000");
		eVo.setEntPhone("042-789-4777");
		eVo.setRegistration("_수정");
		
		logger.info("testUpdate :" + eVo );

		dao.entUpdate(eVo);

		MngVO mVo = new MngVO();
		
		mVo.setMngId("mng2");
		mVo.setMngName("김오래_수정");
		mVo.setMngDept("근로팀_수정");
		mVo.setMngRank("팀장_수정");
		mVo.setMngPwd("1234");
		mVo.setMngAct(1);
		
		
		logger.info("testUpdate :" + mVo );
		dao.mngUpdate(mVo);
	}
}
