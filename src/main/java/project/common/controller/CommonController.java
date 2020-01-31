package project.common.controller;

import java.util.Map;


import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.common.service.LoginService;  //추가
import project.common.common.CommandMap;   //추가
 
 
@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "loginService") //지연:추가 
	private LoginService loginService; //지연:추가
	
	
//	@RequestMapping(value="/project/mainList.pet")
//	public ModelAndView mainList(Map<String, Object> commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/views/main");
//		
//		
//		return mv;
//	}
	//
	@RequestMapping(value="/main")
	public ModelAndView main(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("main/main");
		return mv;
	}
	
	@RequestMapping(value="/match")
	public ModelAndView match(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("match/match");
		return mv;
	}
	
	@RequestMapping(value="/comu")
	public ModelAndView community(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("community/comu");
		return mv;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("main/login");
		return mv;
	}
	
	@RequestMapping(value="/join")
	public ModelAndView join(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("main/join");
		return mv;
	}
	
	//지연: 추후 LoginController를 생성하여 따로 뺄 예정. jsp파일도 view폴더 아래에 새로운 하위폴더를 생성하여 옮길예정
	  @RequestMapping(value="/findIdPw")  // 아이디 비밀번호 찾기 폼을 보여주는 메소드
	  public ModelAndView loginSearchForm(CommandMap commandMap) throws Exception { 
		  ModelAndView mv = new ModelAndView();
	  
	  mv.setViewName("main/findIdPw"); return mv; 
	  }
	 
	  //지연
	  @RequestMapping(value = "/findIdResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
		public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("main/findIdResult");
			
				Map<String, Object> map = loginService.findId(commandMap.getMap());
				mv.addObject("id", map);
				return mv;
			
		
		}
	  
	  //지연
	  @RequestMapping(value = "/findPwResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
		public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("main/findPwResult");
			
				Map<String, Object> map = loginService.findPw(commandMap.getMap());
				mv.addObject("pw", map);
				return mv;
			
		
		}
	 
	

}
