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

import com.ats.domain.AnnVO;
import com.ats.domain.SearchCriteria;
import com.ats.service.AnnService;

@Controller
@RequestMapping("/ann/*")
public class AnnController {
	private static final Logger logger = LoggerFactory.getLogger(MngController.class);

	@Inject
	private AnnService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register Get...");

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(AnnVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("register Post...");

		service.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/ann/list";
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("annNum") int annNum, RedirectAttributes rttr) throws Exception {

		service.remove(annNum);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/ann/list";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.read(annNum));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPage(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute(service.read(annNum));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(AnnVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.modify(vo);

		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/list";
	}

}
