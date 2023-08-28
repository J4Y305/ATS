package com.ats.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ats.domain.AnnFileVO;
import com.ats.domain.AnnImageVO;
import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;
import com.ats.persistence.AnnDAO;

@Service
public class AnnServiceImpl implements AnnService {

	@Inject
	private AnnDAO dao;

	@Override
	public void register(AnnVO vo) throws Exception {
		// 1) TestArea 줄바꿈 처리
		String content = vo.getDetail().replace("\\r\\n", "<br>");
		vo.setDetail(content);
		
		// 2) 공지사항 기본 내용 저장(첨부파일 제외) -> PK인 noticeNo 받아오기
		int annNum = dao.create(vo);
		System.out.println(annNum);
		
		// 3) 첨부파일 등록
		// 3-1) 첨부파일 존재 유무 확인
		if (vo.getAnnFile() != null) {

			// 3-2) 다중 첨부파일 저장
			for (int i = 0; i < vo.getAnnFile().length; i++) {

				AnnFileVO fVo = new AnnFileVO();
				fVo.setAnnNum(annNum);
				System.out.println(fVo.getAnnNum());
				fVo.setAnnFileName(vo.getAnnFile()[i]);
				System.out.println(fVo.getAnnFileName());

				dao.insertFile(fVo);
			}
		}
		
		if (vo.getAnnImage() != null) {

			// 3-2) 다중 이미지 저장
			for (int i = 0; i < vo.getAnnImage().length; i++) {

				AnnImageVO iVo = new AnnImageVO();
				iVo.setAnnNum(annNum);
				iVo.setAnnImageName(vo.getAnnImage()[i]);

				dao.insertImage(iVo);
			}
		}

	}

	@Override
	public AnnVO read(int annNum) throws Exception {
		return dao.read(annNum);
	}

	@Override
	public void modify(AnnVO vo) throws Exception {
		// 1. TextArea 줄바꿈 처리
		String detail = vo.getDetail().replace("\\r\\n", "<br>");
		vo.setDetail(detail);
		
		// 2. 공고 기본 내용 업데이트 ( 첨부파일 제외) 
		dao.update(vo);
		
		
		//3. 이미지 파일 및 첨부 파일 삭제
		dao.deleteImage(vo.getAnnNum());
		dao.deleteFile(vo.getAnnNum());
		
		
		// 4. 이미지파일 수정
		// 4-1) 첨부파일 존재 유무 확인
		if (vo.getAnnImage() != null) {

			// 3-2) 다중 첨부파일 저장
			for (int i = 0; i < vo.getAnnImage().length; i++) {

				AnnImageVO iVo = new AnnImageVO();
				iVo.setAnnNum(vo.getAnnNum());
				iVo.setAnnImageName(vo.getAnnImage()[i]);

				dao.insertImage(iVo);
			}
		}

		// 5. 첨부파일 등록
		// 5-1) 첨부파일 존재 유무 확인
		if (vo.getAnnFile() != null) {

			// 5-2) 다중 첨부파일 저장
			for (int i = 0; i < vo.getAnnFile().length; i++) {

				AnnFileVO fVo = new AnnFileVO();
				fVo.setAnnNum(vo.getAnnNum());
				fVo.setAnnFileName(vo.getAnnFile()[i]);

				dao.insertFile(fVo);
			}
		}

	}

	@Override
	public void remove(int annNum) throws Exception {
		// 1. 이미지 파일 삭제
		dao.deleteImage(annNum);
		// 2. 첨부파일 삭제
		dao.deleteFile(annNum);
		// 3. 공고 삭제
		dao.delete(annNum);
	}

	@Override
	public List<AnnVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<AnnImageVO> imageList(int annNum) throws Exception {
		return dao.imageList(annNum);
	}


	@Override
	public List<AnnFileVO> fileList(int annNum) throws Exception {
		return dao.fileList(annNum);
	}

	@Override
	public List<AnnVO> listIngSearch(SearchCriteria cri) throws Exception {
		return dao.listIngSearch(cri);
	}

	@Override
	public List<AnnVO> listEndSearch(SearchCriteria cri) throws Exception {
		return dao.listEndSearch(cri);
	}

	@Override
	public int listIngSearchCount(SearchCriteria cri) throws Exception {
		return dao.listIngSearchCount(cri);
	}

	@Override
	public int listEndSearchCount(SearchCriteria cri) throws Exception {
		return dao.listEndSearchCount(cri);
	}

	@Override
	public List<AnnVO> listIESearch(SearchCriteria cri) throws Exception {
		return dao.listIESearch(cri);
	}

	@Override
	public int listIESearchCount(SearchCriteria cri) throws Exception {
		return dao.listIESearchCount(cri);
	}

}
