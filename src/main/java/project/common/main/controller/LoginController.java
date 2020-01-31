package project.common.main.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.main.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	// Login Form
	@RequestMapping(value = "/login")
	public ModelAndView login() throws Exception {
		ModelAndView mv = new ModelAndView("main/login");
		return mv;
	}

	@RequestMapping(value = "/loginResult", method = RequestMethod.POST)
	public ModelAndView loginResult(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("main/loginResult");
		String message = "";
		String url = "";

		HttpSession session = request.getSession();

		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		if (chk == null) { // 아이디가 있는지 없는지를 확인
			message = "정확한 아이디를 입력했는지 확인해주세요.";
		} else {
			if (chk.get("ID").equals(commandMap.get("ID"))) {
				if(chk.get("PASSWORD1").equals(commandMap.get("PASSWORD1"))) {
					session.setAttribute("ID", commandMap.get("ID"));
					session.setAttribute("MEM_TYPE", chk.get("MEM_TYPE"));
				} else {
					message = "비밀번호가 맞지 않아요.";
					url = "/login";
				}
			}
		}
		mv.addObject("message", message);
		mv.addObject("url", url);

		return mv;
	}
	
	//로그아웃 구현해야 함. 잊지 말자.
	@RequestMapping(value = "/logout") 
	public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}

	/*
	 * @RequestMapping(value = "/findId") // 아이디 찾기 폼을 보여주는 메소드 public ModelAndView
	 * findId(CommandMap commandMap) throws Exception { ModelAndView mv = new
	 * ModelAndView("member/main/findId"); return mv; }
	 */

	/*
	 * @RequestMapping(value = "/findIdResult", method = RequestMethod.POST) // 입력한
	 * 정보에 맞춰서 아이디를 찾아주는 거 public ModelAndView findIdResult(CommandMap commandMap)
	 * throws Exception { ModelAndView mv = new
	 * ModelAndView("member/main/findIdResult"); if
	 * (commandMap.get("findIdBy").equals("phone")) { Map<String, Object> map =
	 * loginService.findIdWithPhone(commandMap.getMap()); mv.addObject("id", map);
	 * return mv; } else { Map<String, Object> map =
	 * loginService.findIdWithEmail(commandMap.getMap()); mv.addObject("id", map);
	 * return mv; } }
	 */

	/*
	 * @RequestMapping(value = "/findPw") // 비밀번호 찾기 폼을 보여주는 메소드 public ModelAndView
	 * findPw(CommandMap commandMap) throws Exception { ModelAndView mv = new
	 * ModelAndView("member/main/findPw"); return mv; }
	 */

	/*
	 * @RequestMapping(value = "/findPwConfirm") // 회원가입 할 경우 해당 이메일 인증을 요구하는 링크를
	 * 첨부한 이메일을 발송 public ModelAndView sendNewPw(CommandMap commandMap) throws
	 * Exception { ModelAndView mv = new ModelAndView("member/main/findPwConfirm");
	 * // mybatis로 inserMeber() 기능 처리 및 해당 이메일로 이메일 발송 int eCheck =
	 * loginService.selectEmailCheck(commandMap.getMap());
	 * 
	 * String tempPw = UUID.randomUUID().toString().replaceAll("-", ""); tempPw =
	 * tempPw.substring(0, 10);
	 * 
	 * if (eCheck > 0) { MailHandler sendMail = new MailHandler(mailSender);
	 * 
	 * sendMail.setSubject("니내방 임시비밀번호입니다."); sendMail.setText(new
	 * StringBuffer().append("<h1>임시비밀번호<h1>") .append("회원님의 임시비밀번호는 {" + tempPw
	 * .toString() ) .append("} 입니다. 로그인 후 새로운 비밀번호를 저장해주세요.").toString());
	 * sendMail.setFrom("ezenyoon@gmail.com", "니내방");
	 * sendMail.setTo(commandMap.getMap().get("MEM_EMAIL").toString());
	 * sendMail.send();
	 * 
	 * commandMap.put("tempPw", tempPw);
	 * 
	 * loginService.updateTempPw(commandMap.getMap()); }
	 * 
	 * mv.addObject("eCheck", eCheck); return mv; }
	 */

	@RequestMapping("/needLogin")
	// 로그인 인터셉터
	public ModelAndView needLogin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/main/login");
		String message = "로그인이 필요한 서비스입니다.";
		String url = "/loginForm";
		mv.addObject("message", message);
		mv.addObject("url", url);
		return mv;
	}

	/*
	 * @RequestMapping("/tenantOnly") //로그인 인터셉터 public ModelAndView
	 * tenantOnly(CommandMap commandMap) throws Exception { ModelAndView mv = new
	 * ModelAndView("member/common/back"); String message =
	 * "임대인 계정만 이용할 수 있는 서비스입니다."; mv.addObject("message",message); return mv; }
	 */
}
