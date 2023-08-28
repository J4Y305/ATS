package com.ats.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.service.AnnService;

@Controller
@RequestMapping("/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private AnnService annService;
	
	@RequestMapping(value = "/annListMainPage", method = RequestMethod.GET)
	public void annListMainPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Ann List MainPage Get...");
		// 선택된 페이지의 게시글 정보 가져오기
		model.addAttribute("list", annService.listIESearch(cri));
		
		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(annService.listIESearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/annReadMainPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("Ann ReadPage Get...");
		// 공고 글
		model.addAttribute(annService.read(annNum));

		// 이미지 첨부 파일
		model.addAttribute("annImageVO", annService.imageList(annNum));

		// 공고 첨부 파일
		model.addAttribute("annFileVO", annService.fileList(annNum));
	}
}
