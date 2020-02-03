package project.common.admin;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;

@Controller
public class AdminController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminService")
	private AdminService adminService;

	//AdminMainMember Page(main 대용)로 이동 : 호석
	@RequestMapping(value="/adminMain")
    public ModelAndView adminMain(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("admin/adminMainMember");
    	return mv;
    }
	
	//AdminMainBoard로 이동 : 호석
	@RequestMapping(value="/adminBoard")
	public ModelAndView adminBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("admin/adminMainBoard");
		return mv;
	}

	//AdminMainMatching Page로 이동 : 호석
	@RequestMapping(value="/adminMatch")
	public ModelAndView adminMatch(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("admin/adminMainMatching");
		return mv;
	}

	//AdminMainServer Page로 이동 : 호석
	@RequestMapping(value="/adminServer")
	public ModelAndView adminServer(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("admin/adminMainServer");
		return mv;
	}
	
	//AdminLogin Form으로 이동 : 호석
	@RequestMapping(value = "/adminLogin")
	public ModelAndView adminLogin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminLogin");
		return mv;
	}

	//AdminLogin 기능 구현 : 호석
	@RequestMapping(value = "/adminLoginResult", method = RequestMethod.POST)
	public ModelAndView adminLoginResult(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/adminLoginResult");
		
		String message = "";
		String url = "";
		  
		HttpSession session = request.getSession();
		  
		Map<String, Object> Check = adminService.adminLoginCheck(commandMap.getMap());
		
		if(Check == null) {	//DB에서 값을 가져오지 못 하면
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if(Check.get("ADMIN_PW").equals(commandMap.get("ADMIN_PW"))) {
				session.setAttribute("ADMIN_ID", commandMap.get("ADMIN_ID"));
				session.setAttribute("ADMIN_NAME", Check.get("ADMIN_NAME"));
				
				String NAME = (String)Check.get("ADMIN_NAME");
				
				message = "관리자 " + NAME + " 님이 접속중입니다.";
				url = "/adminMain";
			} else {
				message = "비밀번호가 일치하지 않습니다.";
			}
		} 
		mv.addObject("message", message);
		mv.addObject("url", url);
		  
		return mv;
	}

	//로그아웃 기능 구현 : 호석  //이걸 굳이 나눠놔야 되나 모르겠네. 일단 안 나눠도 되는지 확인해보자.
	@RequestMapping(value = "/adminLogout")
	public ModelAndView adminLogout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}

}
