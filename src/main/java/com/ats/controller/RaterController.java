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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ats.domain.RaterVO;
import com.ats.dto.RaterLoginDTO;
import com.ats.service.RaterService;


@Controller
@RequestMapping("/rater/*")
public class RaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RaterController.class);
	
	@Inject
	private RaterService raterService;

	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") RaterLoginDTO dto) throws Exception{
		logger.info("LOGIN GET...");
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(RaterLoginDTO dto, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("LOGIN POST...");
		RaterVO vo = raterService.login(dto);
		logger.info("LOGIN POST..." + dto);
		
		if (vo == null) {
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/rater/login";
		}

		model.addAttribute("raterVO", vo);
		
		return "rater_home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		Object RaterVO = session.getAttribute("login");

		if (RaterVO != null) {
			session.removeAttribute("login");
			session.invalidate();
		}

		return "redirect:/rater/login";
	}

}
