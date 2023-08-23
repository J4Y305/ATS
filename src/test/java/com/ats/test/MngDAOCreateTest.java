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
public class MngDAOCreateTest {
	private static final Logger logger = LoggerFactory.getLogger(MngDAOCreateTest.class);

	@Inject
	private MngDAO dao;

	@Test
	public void testCreate() throws Exception {
		EntVO eVo = new EntVO();
		eVo.setEntNum(2);
		eVo.setEntName("테미오래");
		eVo.setCategory("문화/전시");
		eVo.setAddress("대전광역시 동구 옛 충청남도 도지시 관사");
		eVo.setZipCode("1902-7329");
		eVo.setEntPhone("042-789-456");
		eVo.setRegistration(" ");
		eVo.setAdminId("admin1");
		
		logger.info("testCreate :" + eVo );

		int entNum = dao.entCreate(eVo);

		MngVO mVo = new MngVO();
		mVo.setMngId("mng2");
		mVo.setMngName("김오래");
		mVo.setMngDept("근로팀");
		mVo.setMngRank("팀장");
		mVo.setMngPwd("1234");
		mVo.setMngAct(0);
		mVo.setEntNum(entNum);

		
		
		logger.info("testCreate :" + mVo );
		dao.mngCreate(mVo);
	}
}
