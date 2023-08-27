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
import com.ats.domain.MngVO;
import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.dto.MngLoginDTO;
import com.ats.service.AnnService;
import com.ats.service.MngService;

@Controller
@RequestMapping("/mng/*")
public class MngController {
	private static final Logger logger = LoggerFactory.getLogger(MngController.class);

	@Inject
	private AnnService annService;

	@Inject
	private MngService mngService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") MngLoginDTO dto) throws Exception {
		logger.info("Mng Login Get..");
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(MngLoginDTO dto, Model model) throws Exception {

		logger.info("Mng Login Post..");
		MngVO vo = mngService.login(dto);
		if (vo == null) {
			return;
		}

		model.addAttribute("mngVO", vo);
	}

	@RequestMapping(value = "/annRegister", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("Ann register Get...");

	}

	@RequestMapping(value = "/annRegister", method = RequestMethod.POST)
	public String registerPost(AnnVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("Ann register Post...");
		
		annService.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/annList";
	}

	@RequestMapping(value = "/annList", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Ann List Get...");
		// 선택된 페이지의 게시글 정보 가져오기
		model.addAttribute("list", annService.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(annService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/annReadPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("Ann ReadPage Get...");
		// 공고 글
		model.addAttribute(annService.read(annNum));

		// 이미지 첨부 파일
		model.addAttribute("AnnImageVO", annService.imageList(annNum));

		// 공고 첨부 파일
		model.addAttribute("AnnFileVO", annService.fileList(annNum));
	}

	@RequestMapping(value = "/annModifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		logger.info("Ann ModifyPage Get...");
		// 공고 글
		model.addAttribute(annService.read(annNum));

		// 이미지 첨부 파일
		model.addAttribute("AnnImageVO", annService.imageList(annNum));

		// 이미지 첨부 파일
		model.addAttribute("AnnFileVO", annService.fileList(annNum));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(AnnVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {
		logger.info("Ann ModifyPage Post...");
		annService.modify(vo);

		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/annList";
	}

	@RequestMapping(value = "/annRemovePage", method = RequestMethod.POST)
	public String remove(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		logger.info("Ann RemovePage Post...");
		annService.remove(annNum);
		// 2)페이징 정보 전달
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/annList";
	}
}