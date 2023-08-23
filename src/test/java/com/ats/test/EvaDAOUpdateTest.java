package com.ats.test;

import java.text.SimpleDateFormat;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.EvaItemVO;
import com.ats.domain.EvaVO;
import com.ats.domain.RaterListVO;
import com.ats.persistence.EvaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class EvaDAOUpdateTest {
	private static final Logger logger = LoggerFactory.getLogger(EvaDAOCreateTest.class);

	@Inject
	private EvaDAO dao;
	
	@Test
	public void testUpdate() throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		EvaVO eVo = new EvaVO();
		eVo.setEvaNum(2);
		eVo.setAnnNum(2);
		eVo.setEvaName("1차 공고 평가");
		eVo.setDegree(0);
		eVo.setEvaStartDate(format.parse("2023-11-11"));
		eVo.setEvaEndDate(format.parse("2023-11-30"));
		
		// 1. 평가 기본 내용 저장 
		dao.evaUpdate(eVo);
		logger.info("testUpdate :" + eVo);
		
		// 2. 평가 문항, 해당 평가 평가자 삭제
		dao.evaItemDelete(eVo.getEvaNum());
		dao.raterListDelete(eVo.getEvaNum());
		
		// 3. 평가 문항 등록
		// 3-1) 평가 문항 유무 확인
		if (eVo.getEvaItem() != null) {

			// 3-2) 다중 평가 문항 저장
			for (int i = 0; i < eVo.getEvaItem().length; i++) {

				EvaItemVO iVo = new EvaItemVO();
				// TextArea 줄바꿈 처리
				String evaPlot = eVo.getEvaItem()[i].replace("\\r\\n", "<br>");
				iVo.setEvaPlot(evaPlot);
				iVo.setEvaNum(eVo.getEvaNum());
				iVo.setEvaScore(eVo.getEvaScore()[i]);

				logger.info("testCreate :" + iVo);
				dao.evaItemCreate(iVo);
			}
		}

		// 4. 해당 평가의 평가자 등록
		// 4-1) 평가자 존재 유무 확인
		if (eVo.getRaterList() != null) {

			// 4-2) 다중 첨부파일 저장
			for (int i = 0; i < eVo.getRaterList().length; i++) {

				RaterListVO rVo = new RaterListVO();
				rVo.setEvaNum(eVo.getEvaNum());
				rVo.setRaterId(eVo.getRaterList()[i]);

				logger.info("testCreate :" + rVo);
				dao.raterListCreate(rVo);
			}
		}

	}
}
