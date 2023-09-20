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

import com.ats.domain.AnnVO;
import com.ats.domain.AppEvaVO;
import com.ats.domain.AppVO;
import com.ats.domain.EntVO;
import com.ats.domain.EvaVO;
import com.ats.domain.MngVO;
import com.ats.domain.PageMaker;
import com.ats.domain.RaterVO;
import com.ats.domain.SearchCriteria;
import com.ats.dto.MngLoginDTO;
import com.ats.service.AnnService;
import com.ats.service.AppEvaService;
import com.ats.service.AppService;
import com.ats.service.EvaService;
import com.ats.service.MngService;
import com.ats.service.RaterService;
import com.ats.service.UserService;

@Controller
@RequestMapping("/mng/*")
public class MngController {
	private static final Logger logger = LoggerFactory.getLogger(MngController.class);

	@Inject
	private AnnService annService;

	@Inject
	private MngService mngService;

	@Inject
	private AppService appService;

	@Inject
	private UserService userService;

	@Inject
	private RaterService raterService;

	@Inject
	private EvaService evaService;

	@Inject
	private AppEvaService apEvService;

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

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		Object RaterVO = session.getAttribute("login");

		if (RaterVO != null) {
			session.removeAttribute("login");
			session.invalidate();
		}

		return "redirect:/mng/login";
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
	public void annListPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model)
			throws Exception {
		logger.info("Ann List Get...");
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		// 본인이 작성한 공고글 리스트 가져오기
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
		model.addAttribute("annImageVO", annService.imageList(annNum));

		// 공고 첨부 파일
		model.addAttribute("annFileVO", annService.fileList(annNum));
	}

	@RequestMapping(value = "/annModifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		logger.info("Ann ModifyPage Get...");
		// 공고 글
		model.addAttribute(annService.read(annNum));

		// 이미지 첨부 파일
		model.addAttribute("annImageVO", annService.imageList(annNum));

		// 이미지 첨부 파일
		model.addAttribute("annFileVO", annService.fileList(annNum));
	}

	@RequestMapping(value = "/annModifyPage", method = RequestMethod.POST)
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

	@RequestMapping(value = "/annIngList", method = RequestMethod.GET)
	public void annIngListPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model)
			throws Exception {
		logger.info("Ann List Get...");
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		// 본인이 작성한 공고글 리스트 가져오기
		model.addAttribute("list", annService.listIngSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(annService.listIngSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/annEndList", method = RequestMethod.GET)
	public void annEndListPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model)
			throws Exception {
		logger.info("Ann List Get...");
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		annService.deadLineUpdate();
		// 본인이 작성한 공고글 리스트 가져오기
		model.addAttribute("list", annService.listEndSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(annService.listEndSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/annAppList", method = RequestMethod.GET)
	public void annAppList(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("annAppList Get...");
		// 공고 정보 가져오기
		model.addAttribute(annService.read(annNum));
		// 지원서 리스트 가져오기
		cri.setKeyword(Integer.toString(annNum));
		model.addAttribute("list", appService.finalApplistCriteria(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(appService.finalApplistCountCriteria(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/annAppEndList", method = RequestMethod.GET)
	public void annAppEndList(@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("Ann ReadPage Get...");
		// 공고 정보 가져오기
		model.addAttribute(annService.read(annNum));		

		// 지원서 리스트 가져오기
		
		cri.setKeyword(Integer.toString(annNum));
		model.addAttribute("list", appService.listCriteria(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(appService.listCountCriteria(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/appReadPage", method = RequestMethod.GET)
	public void appReadPage(@RequestParam("appNum") int appNum,@RequestParam("annNum") int annNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("Ann ReadPage Get...");

		AnnVO anVo = annService.read(annNum);
		AppVO apVo = appService.read(appNum);
		String userId = apVo.getUserId();
		model.addAttribute(userService.read(userId));
		// 지원서 글
		model.addAttribute(apVo);
		model.addAttribute(anVo);
	}

	@RequestMapping(value = "/raterRegister", method = RequestMethod.GET)
	public void raterRegisterGET() throws Exception {
		logger.info("rater register Get...");

	}

	@RequestMapping(value = "/raterRegister", method = RequestMethod.POST)
	public String raterRegisterPost(RaterVO rVo, RedirectAttributes rttr) throws Exception {
		logger.info("rater register Post...");

		raterService.register(rVo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/raterList";
	}

	@RequestMapping(value = "/raterReadPage", method = RequestMethod.GET)
	public void raterReadPage(@RequestParam("raterId") String raterId, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		model.addAttribute(raterService.read(raterId));
	}

	@RequestMapping(value = "/raterRemovePage", method = RequestMethod.POST)
	public String remove(@RequestParam("raterId") String raterId, RedirectAttributes rttr) throws Exception {

		
		int removeNum = raterService.remove(raterId);
		if(removeNum==1) {
			System.out.println("이미 평가가 존재합니다.");
			rttr.addFlashAttribute("msg", "FAIL");
		}
		else {
			System.out.println("삭제가 완료되었습니다.");
			rttr.addFlashAttribute("msg", "SUCCESS");
			
		}
		

		return "redirect:/mng/raterList";
	}

	@RequestMapping(value = "/raterList", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model) throws Exception {
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		// 본인이 작성한 평가자 리스트 가져오기
		model.addAttribute("list", raterService.listSearch(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(raterService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/raterModifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@RequestParam("raterId") String raterId, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		model.addAttribute(raterService.read(raterId));

	}

	@RequestMapping(value = "/raterModifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(RaterVO rVo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		raterService.modify(rVo);

		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/raterList";
	}

	@RequestMapping(value = "/evaRegister", method = RequestMethod.GET)
	public void evaRegisterGET(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model)
			throws Exception {
		logger.info("eva register Get...");
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		model.addAttribute("annList", annService.listEndSearch(cri));
		model.addAttribute("raterList", raterService.listSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(raterService.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/evaRegister", method = RequestMethod.POST)
	public String evaRegisterPost(EvaVO vo, RedirectAttributes rttr, @ModelAttribute("cri") SearchCriteria cri)
			throws Exception {
		logger.info("eva register Post...");
		logger.info("====> " + vo);

		evaService.register(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/evaList";
	}

	@RequestMapping(value = "/evaList", method = RequestMethod.GET)
	public void evaListPage(@ModelAttribute("cri") SearchCriteria cri, HttpSession session, Model model)
			throws Exception {
		logger.info("eva List Get...");
		// 기업 담당자 아이디 가져오기
		MngVO mVo = (MngVO) session.getAttribute("login");
		cri.setKeyword(mVo.getMngId());

		// 본인이 작성한 평가 리스트 가져오기
		model.addAttribute("list", evaService.listMngEva(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listMngEvaCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/evaReadPage", method = RequestMethod.GET)
	public void evaReadPage(@RequestParam("evaNum") int evaNum, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		logger.info("eva ReadPage Get...");
		EvaVO eVo = evaService.read(evaNum);
		model.addAttribute(annService.read(eVo.getAnnNum()));
		cri.setKeyword(Integer.toString(evaNum));
		// 평가 정보
		model.addAttribute(eVo);

		// 평가서 목록
		model.addAttribute("list", apEvService.listCriteria(cri));

		// 페이징 네비게이션 추가
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(apEvService.listCountCriteria(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);

	}

	// READPAGE
	@RequestMapping(value = "/evaDetailReadPage", method = RequestMethod.GET)
	public void evaDetailReadPage(@RequestParam("evaNum") int evaNum, @RequestParam("annNum") int annNum,
			@RequestParam("appNum") int appNum, @RequestParam("userId") String userId,
			@RequestParam("raterId") String raterId, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
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

		model.addAttribute("detail", apEvService.read(vo));
		model.addAttribute("detailList", apEvService.evaDetailList(vo));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(evaService.listSearchCount(cri));

		// 페이징 정보 화면 전달
		model.addAttribute("pageMaker", pageMaker);
		logger.info("readPage....." + model);
	}

	@RequestMapping(value = "/evaModifyPage", method = RequestMethod.GET)
	public void evaModifyPageGET(@RequestParam("evaNum") int evaNum, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		logger.info("eva ModifyPage Get...");
		// 공고 글
		model.addAttribute(evaService.read(evaNum));

		// 이미지 첨부 파일
		model.addAttribute("evaitemVO", evaService.evaItemList(evaNum));

		// 공고 첨부 파일
		model.addAttribute("raterVO", evaService.raterArrayList(evaNum));
	}

	@RequestMapping(value = "/evaModifyPage", method = RequestMethod.POST)
	public String evaModifyPagePOST(EvaVO eVo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {
		logger.info("eva ModifyPage Post...");
		evaService.modify(eVo);

		// 페이징 및 검색 기능 유지
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/evaList";
	}

	@RequestMapping(value = "/evaRemovePage", method = RequestMethod.POST)
	public String evaRemove(@RequestParam("evaNum") int evaNum, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {

		evaService.remove(evaNum);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/mng/evaList";
	}
	
	@RequestMapping(value = "/mngInfo", method = RequestMethod.GET)
	   public void infoGET(HttpSession session, Model model) throws Exception {

	      // 세션 객체 안에 있는 ID정보 저장
	      MngVO login = (MngVO) session.getAttribute("login");
	      String mngId = (String)login.getMngId();
	      logger.info("C: 회원정보보기 GET의 아이디 " + mngId);
	      
	      EntVO eVo = mngService.entRead(login.getEntNum());
	      model.addAttribute(eVo);
	      
	      model.addAttribute(mngService.mngRead(mngId));
	   }
	   


	   /* 회원정보 수정 */
	   @RequestMapping(value = "/mngModifyPage", method = RequestMethod.GET)
	   public void modifyGET(HttpSession session, Model model) throws Exception {
	      // 세션 객체 안에 있는 ID정보 저장
	      MngVO login = (MngVO) session.getAttribute("login");
	      String mngId = (String)login.getMngId();
	      logger.info("C: 회원정보보기 GET의 아이디 " + mngId);

	      // 서비스안의 회원정보보기 메서드 호출
	      MngVO mVo = mngService.mngRead(mngId);

	      // 기업정보 조회
	      EntVO eVo = mngService.entRead(login.getEntNum());

	      // 정보저장 후 페이지 이동
	      model.addAttribute("mngVO", mVo);
	      model.addAttribute("entVO", eVo);
	   }

	   @RequestMapping(value = "/mngModifyPage", method = RequestMethod.POST)
	   public String modifyPOST(EntVO eVo, MngVO mVo, @ModelAttribute("cri") SearchCriteria cri,
	         RedirectAttributes rttr) throws Exception {
	      logger.info("C: 회원정보수정 입력페이지 POST");

	      mngService.modify(eVo, mVo);

	      rttr.addFlashAttribute("msg", "SUCCESS");
	      return "redirect:/mng/mngInfo";
	   }

}