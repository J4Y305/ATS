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

import com.ats.domain.AdminVO;
import com.ats.dto.AdminLoginDTO;
import com.ats.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") AdminLoginDTO dto) throws Exception {
		logger.info("Admin Login Get..");
	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(AdminLoginDTO dto, Model model) throws Exception {

		logger.info("Admin Login Post..");
		AdminVO vo = service.login(dto);

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

		return "redirect:/";
	}
}
