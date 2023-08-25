package com.ats.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MngLoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(MngLoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object mngVO = modelMap.get("mngVO");

		// mngController에서 Model 객체에 담긴 mngVO 확인
		if (mngVO != null) {

			// session 객체에 mngVO 정보 담기
			logger.info("new login success");
			session.setAttribute(LOGIN, mngVO);

			// 로그인 전 보고 있었던 화면(url) 확인
//			Object login = request.getSession().setAttribute("login", LOGIN);
			Object dest = session.getAttribute("dest");

			// 로그인 전 보고 있었던 화면(url)으로 이동
			response.sendRedirect(dest != null ? (String) dest : "/mng"); // 조건 ? true : false

		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// posetHandle() 메서드 실행 전처리
		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}

		return true;
	}
}
