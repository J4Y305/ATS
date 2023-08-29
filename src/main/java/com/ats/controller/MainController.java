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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ats.domain.AppVO;
import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.service.AnnService;
import com.ats.service.AppService;
import com.ats.service.UserService;

@Controller
@RequestMapping("/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private AnnService annService;
	
	@Inject
	private AppService appService;
	
	@Inject
	private UserService userService;
	
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
	
	@RequestMapping(value = "/appRegister", method = RequestMethod.GET)
	public void registerGET(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, @RequestParam("userId") String userId, Model model) throws Exception {
		logger.info("Ann register Get...");
		model.addAttribute(annService.read(annNum));
		model.addAttribute(userService.read(userId));
	}
	
	@RequestMapping(value = "/appRegister", method = RequestMethod.POST)
	public String registerPost(AppVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("App register Post...");

		appService.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/user";
	}
}
