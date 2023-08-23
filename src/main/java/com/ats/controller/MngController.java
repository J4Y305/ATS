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

import com.ats.domain.EntVO;
import com.ats.domain.MngVO;
import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.service.MngService;

@Controller
@RequestMapping("/mng/*")
public class MngController {
	private static final Logger logger = LoggerFactory.getLogger(MngController.class);

	@Inject
	private MngService service;
	
	@RequestMapping(value= "/register", method= RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register Get...");

	}
	
	@RequestMapping(value= "/register", method= RequestMethod.POST)
	public String registerPost(EntVO eVo, MngVO mVo, RedirectAttributes rttr) throws Exception {
		logger.info("register Post...");
		
		service.register(eVo, mVo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/mng/list";
	}
	
	@RequestMapping(value="/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("mngId") String mngId, @RequestParam("entNum") int entNum, 
						RedirectAttributes rttr) throws Exception{
		
		service.remove(entNum, mngId);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		// 선택된 페이지의 게시글 정보 가져오기
		model.addAttribute("list", service.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("mngId") String mngId, @RequestParam("entNum") int entNum,
						@ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.entRead(entNum));
		model.addAttribute(service.mngRead(mngId));
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("mngId") String mngId, @RequestParam("entNum") int entNum,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.entRead(entNum));
		model.addAttribute(service.mngRead(mngId));
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(EntVO eVo, MngVO mVo,
			@ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.modify(eVo, mVo);
		
		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/list";
	}
}
