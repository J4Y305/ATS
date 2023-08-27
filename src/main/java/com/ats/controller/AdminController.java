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

import com.ats.domain.AdminVO;
import com.ats.domain.EntVO;
import com.ats.domain.MngVO;
import com.ats.domain.PageMaker;
import com.ats.domain.SearchCriteria;
import com.ats.dto.AdminLoginDTO;
import com.ats.service.AdminService;
import com.ats.service.MngService;
import com.ats.service.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService adService;

	@Inject
	private MngService mngService;

	@Inject
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") AdminLoginDTO dto) throws Exception {
		logger.info("Admin Login Get..");
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(AdminLoginDTO dto, Model model) throws Exception {

		logger.info("Admin Login Post..");
		AdminVO vo = adService.login(dto);
		if (vo == null) {
			return;
		}

		model.addAttribute("adminVO", vo);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("Admin Logout Post..");
		Object userVO = session.getAttribute("login");

		if (userVO != null) {
			session.removeAttribute("login");
			session.invalidate();
		}

		return "redirect:login";
	}

	@RequestMapping(value = "/mngRegister", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register Get...");

	}

	@RequestMapping(value = "/mngRegister", method = RequestMethod.POST)
	public String registerPost(EntVO eVo, MngVO mVo, RedirectAttributes rttr)
			throws Exception {
		logger.info("register Post...");

		mngService.register(eVo, mVo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/mngList";
	}

	@RequestMapping(value = "/mngRemovePage", method = RequestMethod.POST)
	public String remove(@RequestParam("mngId") String mngId, @RequestParam("entNum") int entNum,
			RedirectAttributes rttr) throws Exception {

		mngService.remove(entNum, mngId);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/mngList";
	}

	@RequestMapping(value = "/mngList", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		// 선택된 페이지의 게시글 정보 가져오기
		model.addAttribute("list", mngService.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(mngService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/mngReadPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("mngId") String mngId, @RequestParam("entNum") int entNum,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		// 1. 기업 정보 조회
		EntVO eVo = mngService.entRead(entNum);
		// 2. 사업자 등록증 파일 이름 추출
		String text = eVo.getRegistration();
		String[] text1 = text.split("-.*?_");
		eVo.setFileName(text1[1]);
		model.addAttribute(eVo);
		// 3. 담당자 정보 조회
		model.addAttribute(mngService.mngRead(mngId));
	}

	@RequestMapping(value = "/mngModifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("mngId") String mngId, @RequestParam("entNum") int entNum,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(mngService.entRead(entNum));
		model.addAttribute(mngService.mngRead(mngId));
	}

	@RequestMapping(value = "/mngModifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(EntVO eVo, MngVO mVo, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {

		mngService.modify(eVo, mVo);

		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/mngList";
	}

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void userList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("listPage GET.....");

		// 선택된 페이지의 게시글 정보로 10개 가져오기

		model.addAttribute("list", userService.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(userService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/userRemovePage", method = RequestMethod.POST)
	public String remove(@RequestParam("userId") String userId, RedirectAttributes rttr) throws Exception {

		userService.remove(userId);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/userList";
	}
}
