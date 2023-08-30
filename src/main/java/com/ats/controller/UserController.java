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

import com.ats.domain.AppVO;
import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.domain.UserVO;
import com.ats.dto.UserLoginDTO;
import com.ats.service.AnnService;
import com.ats.service.AppService;
import com.ats.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService service;

	@Inject
	private AppService appService;
	
	@Inject
	private AnnService annService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") UserLoginDTO dto) throws Exception {

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(UserLoginDTO dto, Model model) throws Exception {

		UserVO vo = service.login(dto);

		if (vo == null) {
			return;
		}

		model.addAttribute("userVO", vo);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		Object userVO = session.getAttribute("login");

		if (userVO != null) {
			session.removeAttribute("login");
			session.invalidate();
		}

		return "redirect:/";
	}

	// REGISTER
	@RequestMapping(value = "/userRegister", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register GET...");
	}

	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	public String registerPOST(UserVO vo) throws Exception {
		logger.info("register POST...");

		// 유저 등록
		service.register(vo);

		return "redirect:/";
	}



	// LISTPAGE
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("listPage GET.....");

		// 선택된 페이지의 게시글 정보로 10개 가져오기

		model.addAttribute("list", service.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	// MODIFYPAGE
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPageGET(@RequestParam("userId") String userId, HttpSession session,
			@ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("modifyPage GET.....");

		// 수정할 수 있으려면, 로그인한 정보와 글의 작성자의 정보가 동일할 때만 수정 page로 이동.

		// 1) 로그인 정보 가져오기
		UserVO user = (UserVO) session.getAttribute("login");

		// 2) 게시글의 작성자 id와 로그인 정보 id를 비교.
		// 2-1) 게시글 정보 가져오기
		UserVO userVO = service.read(userId);

		// 2-2) 게시글 작성자와 id와 로그인 정보 id 비교.
		if (user.getUserId().equals(userVO.getUserId())) {
			// 작성자와 로그인 정보 같음.
			model.addAttribute(userVO);
			// 수정 페이지로 이동.
			return "/user/myPage";
		} else {
			// 로그인 정보와 게시글 작성자가 일치하지 않는 경우 -> 강제이동
			rttr.addAttribute("userId", userId);
			rttr.addFlashAttribute("msg", "잘못된 접근입니다.");

			return "redirect:/";
		}
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public String myPagePOST(UserVO vo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {

		service.modify(vo);

		// session 정보 업데이트
		session.setAttribute("login", vo);

		rttr.addAttribute("userId", vo.getUserId());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/user/myPage";
	}

	@RequestMapping(value = "/appStoreList", method = RequestMethod.GET)
	public void appStoreList(UserVO vo, HttpSession session, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		logger.info("app Store Get...");
		
		UserVO user = (UserVO) session.getAttribute("login");
		String userId = user.getUserId();
		cri.setKeyword(userId);
		logger.info("app Store Get..."+ cri.getKeyword());
		model.addAttribute("list", appService.listStoreCriteria(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(appService.listStoreCountCriteria(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("app Store Get..." + model);

	}

	@RequestMapping(value = "/appFinalList", method = RequestMethod.GET)
	public void annAppList(@ModelAttribute("cri") SearchCriteria cri, UserVO vo, HttpSession session,
			Model model) throws Exception {
		logger.info("app Final Get...");

		UserVO user = (UserVO) session.getAttribute("login");
		String userId = user.getUserId();
		cri.setKeyword(userId);
		logger.info("app Final Get Cri..." + cri);
		// 지원서 리스트 가져오기
		model.addAttribute("list", appService.listFinalCriteria(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(appService.listFinalCountCriteria(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/appReadPage", method = RequestMethod.GET)
	public void appReadPageGET(@RequestParam("appNum") int appNum, @RequestParam("annNum") int annNum, Model model)
			throws Exception {
		logger.info("appReadPage Get...");
		model.addAttribute(appService.read(appNum));
		model.addAttribute(annService.read(annNum));
	}

	@RequestMapping(value = "/appModifyPage", method = RequestMethod.GET)
	public void appModifyPageGET(@RequestParam("appNum") int appNum, @RequestParam("userId") String userId, Model model)
			throws Exception {
		logger.info("appReadPage Get...");
		model.addAttribute(appService.read(appNum));
		model.addAttribute(service.read(userId));
	}

	@RequestMapping(value = "/appModifyPage", method = RequestMethod.POST)
	public String appModifyPagePOST(AppVO apVo, Model model) throws Exception {
		logger.info("appReadPage Get...");
		appService.modify(apVo);
		return "redirect:/user/appStoreList";
	}

	@RequestMapping(value = "/appRemovePage", method = RequestMethod.POST)
	public String remove(@RequestParam("appNum") int appNum, RedirectAttributes rttr) throws Exception {

		appService.remove(appNum);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/user/appStoreList";
	}
	
	// LISTPAGE
		@RequestMapping(value = "/result", method = RequestMethod.GET)
		public void resultPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session,
				Model model) throws Exception {
			logger.info("listPage GET.....");

			UserVO vo = (UserVO) session.getAttribute("login");
			cri.setKeyword(vo.getUserId());
			
			
			// 선택된 페이지의 게시글 정보로 10개 가져오기
			model.addAttribute("list", annService.listSearchResult(cri));
			
			// 페이징 네비게이션 추가
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(annService.listSearchCount(cri));
			// 페이징 정보 화면 전달 
			model.addAttribute("pageMaker", pageMaker);
			
			
			logger.info("result Model....." + model);
			logger.info("result cri....." + cri);
			
			

		}


}
