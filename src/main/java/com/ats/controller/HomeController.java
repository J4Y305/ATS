package com.ats.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ats.domain.MngVO;
import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.service.AnnService;
import com.ats.service.EvaService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Inject
	private AnnService annService;
	
	@Inject
	private EvaService evaService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();  
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		
		logger.info("Ann List MainPage Get...");
		// 선택된 페이지의 게시글 정보 가져오기
		model.addAttribute("list", annService.listIESearch(cri));
		
		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(annService.listIESearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
		

		return "home";
	} 

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "admin_home";
	}

	@RequestMapping(value = "/mng", method = RequestMethod.GET)
	public String mngHome(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri, 
			HttpSession session) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		// 본인이 작성한 공고글 리스트 가져오기
		model.addAttribute("list", annService.listIngSearch(cri));
		model.addAttribute("postedAnnCount", annService.listSearchCount(cri));
		model.addAttribute("closedAnnCount", annService.listEndSearchCount(cri));
		model.addAttribute("evaCount", evaService.listMngEvaCount(cri));
		
		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(annService.listIngSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
		
		return "mng_home";
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String userHome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		
		return "user_home";
	}

	@RequestMapping(value = "rater", method = RequestMethod.GET)
	public String raterHome(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "rater_home";
	}

}