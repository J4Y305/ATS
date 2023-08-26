package com.ats.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.domain.AnnVO;
import com.ats.domain.AppVO;
import com.ats.domain.RaterVO;
import com.ats.dto.RaterLoginDTO;
import com.ats.service.AnnService;
import com.ats.service.AppService;
import com.ats.service.EvaService;
import com.ats.service.RaterService;
import com.ats.service.UserService;

@Controller
@RequestMapping("/eva/*")
public class EvaController {
	
	private static final Logger logger = LoggerFactory.getLogger(EvaController.class);
	
	@Inject
	private RaterService raterService;
	
	@Inject
	private EvaService evaService;
	
	@Inject
	private AnnService annService;
	
	@Inject
	private AppService appService;
	
	@Inject
	private UserService userService; 
	
	
	// READPAGE
	@RequestMapping(value = "/evaPage", method = RequestMethod.GET)
	public void evaPage(@RequestParam("evaNum") int evaNum, 
			@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("readPage.....");

		// 평가정보
		model.addAttribute(evaService.read(evaNum));
		model.addAttribute(annService.read(annNum));
		model.addAttribute("list", appService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// READPAGE
		@RequestMapping(value = "/evaReadPage", method = RequestMethod.GET)
		public void evaReadPage(@RequestParam("evaNum") int evaNum, 
				@RequestParam("annNum") int annNum, @RequestParam("appNum") int appNum, 
				@RequestParam("userId") String userId, @ModelAttribute("cri") SearchCriteria cri, Model model)
				throws Exception {
			logger.info("readPage.....");

			// 평가정보
			model.addAttribute(evaService.read(evaNum));
			model.addAttribute(annService.read(annNum));
			model.addAttribute(userService.read(userId));
			model.addAttribute(appService.read(appNum));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(evaService.listSearchCount(cri));

			// 페이징 정보 화면 전달
			model.addAttribute("pageMaker", pageMaker);
			logger.info("readPage....." + model);
		}
	
	// MODIFYPAGE
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public String modifyPageGET(@RequestParam("raterId") String raterId, HttpSession session,
			@ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("modifyPage GET.....");

		// 수정할 수 있으려면, 로그인한 정보와 글의 작성자의 정보가 동일할 때만 수정 page로 이동.

		// 1) 로그인 정보 가져오기
		RaterVO rater = (RaterVO) session.getAttribute("login");

		// 2) 게시글의 작성자 id와 로그인 정보 id를 비교.
		// 2-1) 게시글 정보 가져오기
		RaterVO product = raterService.read(raterId);

		// 2-2) 게시글 작성자와 id와 로그인 정보 id 비교.
		if (rater.getRaterId().equals(product.getRaterId())) {
			// 작성자와 로그인 정보 같음.
			model.addAttribute(product);
			// 수정 페이지로 이동.
			return "/rater/modifyPage";
		} else {
			// 로그인 정보와 게시글 작성자가 일치하지 않는 경우 -> 강제이동
			rttr.addAttribute("raterId", raterId);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addFlashAttribute("msg", "잘못된 접근입니다.");

			return "redirect:/rater/raterReadPage";
		}
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(RaterVO vo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		logger.info("modifyPage POST.....");

		raterService.modify(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perpage", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/rater";
	}
	
	// REMOVEPAGE
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String removePagePOST(@RequestParam("raterId") String raterId, HttpSession session,
			@ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("removePage POST.....");
 
		// 삭제하려면 로그인한 정보와 게시글의 작성자가 일치.

		// 1) 로그인 정보 가져오기
		RaterVO rater = (RaterVO) session.getAttribute("login");

		// 2) 게시글의 작성자 id와 로그인 정보 id를 비교.
		// 2-1) 게시글 정보 가져오기
		RaterVO product = raterService.read(raterId);

		// 2-2) 게시글 작성자와 id와 로그인 정보 id 비교.
		if (rater.getRaterId().equals(product.getRaterId())) {
			// 작성자와 로그인 정보 같음 -> 게시글 삭제
			logger.info("remove POST.....");
			raterService.remove(raterId);
			// 목록화면으로 이동.
			rttr.addFlashAttribute("msg", "SUCCESS");
			return "redirect:/rater";
		} else {
			// 로그인 정보와 게시글 작성자가 일치하지 않는 경우 -> 상세페이지로 강제이동
			rttr.addAttribute("raterId", raterId);
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addFlashAttribute("msg", "잘못된 접근입니다.");

			return "redirect:/rater/raterReadPage";
		}
	}
	
	//LISTPAGE
	@RequestMapping(value = "evaList", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("listPage GET.....");

		// 선택된 페이지의 게시글 정보로 10개 가져오기

		model.addAttribute("list", evaService.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);

	}

}
