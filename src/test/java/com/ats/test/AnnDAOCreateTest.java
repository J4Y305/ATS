package com.ats.test;

import java.text.SimpleDateFormat;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ats.domain.AnnFileVO;
import com.ats.domain.AnnImageVO;
import com.ats.domain.AnnVO;
import com.ats.persistence.AnnDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/**/root-context.xml" })
public class AnnDAOCreateTest {
	private static final Logger logger = LoggerFactory.getLogger(MngDAOCreateTest.class);

	@Inject
	private AnnDAO dao;

	@Test
	public void testCreate() throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		AnnVO aVo = new AnnVO();
		aVo.setAnnNum(1);
		aVo.setAnnName("경영정보학과 조교 채용 공고");
		aVo.setAnnField("1차");
		aVo.setAnnStartDate(format.parse("2023-8-21"));
		aVo.setAnnEndDate(format.parse("2023-8-31"));
		aVo.setMngId("mng1");
		aVo.setAnnAct(0);
		aVo.setDeadline(0);
		aVo.setDetail("경영정보학과 조교 채용 공고 입니다. 많은 지원 바랍니다.");
		// 1. TextArea 줄바꿈 처리
		String detail = aVo.getDetail().replace("\\r\\n", "<br>");
		aVo.setDetail(detail);

		// 2. 공고 기본 내용 저장 ( 첨부파일 제외) -> PK인 noticeNo 받아오기
		int annNum = dao.create(aVo);

		logger.info("testCreate :" + aVo);
		// 3. 이미지파일 등록
		// 3-1) 첨부파일 존재 유무 확인
		if (aVo.getAnnImage() != null) {

			// 3-2) 다중 첨부파일 저장
			for (int i = 0; i < aVo.getAnnImage().length; i++) {

				AnnImageVO iVo = new AnnImageVO();
				iVo.setAnnNum(annNum);
				iVo.setAnnImageName(aVo.getAnnImage()[i]);

				logger.info("testCreate :" + iVo);
				dao.insertImage(iVo);
			}
		}

		// 3. 첨부파일 등록
		// 3-1) 첨부파일 존재 유무 확인
		if (aVo.getAnnFile() != null) {

			// 3-2) 다중 첨부파일 저장
			for (int i = 0; i < aVo.getAnnFile().length; i++) {

				AnnFileVO fVo = new AnnFileVO();
				fVo.setAnnNum(annNum);
				fVo.setAnnFileName(aVo.getAnnFile()[i]);

				logger.info("testCreate :" + fVo);
				dao.insertFile(fVo);
			}
		}

	}
}
