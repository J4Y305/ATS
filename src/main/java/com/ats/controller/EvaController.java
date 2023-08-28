package com.ats.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.ats.domain.AppEvaVO;
import com.ats.domain.AppVO;
import com.ats.domain.EntVO;
import com.ats.domain.EvaDetailVO;
import com.ats.domain.EvaVO;
import com.ats.domain.MngVO;
import com.ats.domain.RaterVO;
import com.ats.dto.RaterLoginDTO;
import com.ats.service.AnnService;
import com.ats.service.AppEvaService;
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

	@Inject
	private AppEvaService appEvaService;

	// READPAGE
	@RequestMapping(value = "/evaPage", method = RequestMethod.GET)
	public void evaPage(@RequestParam("evaNum") int evaNum, @RequestParam("annNum") int annNum,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("readPage.....");

		// 평가정보
		model.addAttribute(evaService.read(evaNum));
		model.addAttribute(annService.read(annNum));
		model.addAttribute(evaService.raterArrayList(evaNum));

		cri.setKeyword(Integer.toString(annNum));
		model.addAttribute("list", appService.listCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	// READPAGE
	@RequestMapping(value = "/evaRegister", method = RequestMethod.GET)
	public void evaReadPage(@RequestParam("evaNum") int evaNum, @RequestParam("annNum") int annNum,
			@RequestParam("appNum") int appNum, @RequestParam("userId") String userId,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("readPage.....");

		// 평가정보
		model.addAttribute(evaService.read(evaNum));
		model.addAttribute(annService.read(annNum));
		model.addAttribute(userService.read(userId));
		model.addAttribute(appService.read(appNum));
		model.addAttribute("list", evaService.evaItemList(evaNum));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
		logger.info("readPage....." + model);
	}

	@RequestMapping(value = "/evaRegister", method = RequestMethod.POST)
	public String registerPost(AppEvaVO vo, @RequestParam("evaItemNum") int[] evaItemNums,
			@RequestParam("evaDetailScore") int[] evaDetailScores, Model model, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr)
			throws Exception {
		logger.info("register Post...");
		logger.info("evaRegister...=====> " + vo);

		appEvaService.aeRegister(vo, evaItemNums, evaDetailScores);

		rttr.addFlashAttribute("msg", "SUCCESS");
		
		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		
		rttr.addAttribute("evaNum", vo.getEvaNum());
		rttr.addAttribute("annNum", vo.getAnnNum()); //ANN NUM
		

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/eva/evaPage";
	}
	
	
	// READPAGE
		@RequestMapping(value = "/evaDetailReadPage", method = RequestMethod.GET)
		public void evaDetailReadPage(@RequestParam("evaNum") int evaNum, @RequestParam("annNum") int annNum,
				@RequestParam("appNum") int appNum, @RequestParam("userId") String userId, @RequestParam("raterId") String raterId,
				@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
			logger.info("readPage.....");

			// 평가정보
			model.addAttribute(evaService.read(evaNum));
			model.addAttribute(annService.read(annNum));
			model.addAttribute(userService.read(userId));
			model.addAttribute(appService.read(appNum));
			
			model.addAttribute("list", evaService.evaItemList(evaNum));
			
			// RATER_ID='rater1' AND EVA_NUM=21 AND APP_NUM=10;
			AppEvaVO vo = new AppEvaVO();
			vo.setRaterId(raterId);
			vo.setEvaNum(evaNum);
			vo.setAppNum(appNum);
			
			model.addAttribute("detail", appEvaService.read(vo));
			model.addAttribute("detailList", appEvaService.evaDetailList(vo));
			

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(evaService.listSearchCount(cri));

			// 페이징 정보 화면 전달
			model.addAttribute("pageMaker", pageMaker);
			logger.info("readPage....." + model);
		}

	// LISTPAGE
	@RequestMapping(value = "evaList", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) throws Exception {
		logger.info("listPage GET.....");

		// 선택된 페이지의 게시글 정보로 10개 가져오기
		RaterVO raterVO = (RaterVO) session.getAttribute("login");
		cri.setKeyword(raterVO.getRaterId());

		model.addAttribute("list", evaService.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);

	}

}
