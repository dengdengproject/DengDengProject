package project.common.join;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.join.JoinService;

@Controller
public class JoinController {
	Logger log=Logger.getLogger(this.getClass());
	
	
	@Resource(name="joinService") //service 영역에 접근
	private JoinService joinService;
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET) //회원가입 폼 
	public ModelAndView joinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("join/memJoinForm");
		return mv;
	}
	@RequestMapping(value="/join/idCheck")
	public @ResponseBody String idCheck(CommandMap commandMap) throws Exception{
		
		System.out.println(commandMap.getMap());
		String idCheck = joinService.selectIdCheck(commandMap.getMap());
		System.out.println(idCheck +"idcheck값이랍니다.");

		
		return idCheck;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	//회원가입 성공
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv=new ModelAndView("join/joinSuccess"); //join/joinSuccess에서 수정
		System.out.println(commandMap.get("MEM_ID"));
		
		joinService.insertMember(commandMap.getMap(), request);
		
		return mv;
	}
 
	//댕댕이 정보 입력 폼으로 이동
	@RequestMapping(value="/petRegisterForm", method=RequestMethod.GET) 
	public ModelAndView petRegisterForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("join/petJoinForm");
		return mv;
	} 
	
	//댕댕이 정보 입력
	@RequestMapping(value="/petRegister", method=RequestMethod.POST)
	public ModelAndView petRegister(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		System.out.println("===================petRegister 실행 ======================");
		ModelAndView mv=new ModelAndView("join/petJoinFormAdd");
				
		joinService.petRegist(commandMap.getMap(), request);
		mv.addObject("map", commandMap.getMap());
		return mv;
	}
	
	//댕댕이 추가 정보 입력
	@RequestMapping(value="/petRegisterAdd", method=RequestMethod.POST)
	public ModelAndView petRegisterAdd(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		System.out.println("===================petRegisterADD 실행 ======================");
		ModelAndView mv=new ModelAndView("main/main");
		
		System.out.println("ID는" + commandMap.get("ID"));
		System.out.println("PET_MEM_NAME은" + commandMap.get("PET_MEM_NAME"));
		
		//PET_MEM_ID를 DB에서 꺼내오기
		Map<String, Object> map = joinService.getPetMemId(commandMap.getMap());
		//꺼내온 아이디값을 map에 넣어준다. 
		commandMap.getMap().put("PET_MEM_ID", map.get("PET_MEM_ID"));
				
		joinService.petRegistAdd(commandMap.getMap());
		
		return mv;
	}

	

}

