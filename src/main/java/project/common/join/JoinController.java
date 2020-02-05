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
	
	
	
	
	@RequestMapping(value="/join/idCheck") //아이디 중복확인 체크
	public @ResponseBody String idCheck(CommandMap commandMap) throws Exception{
		
		System.out.println(commandMap.getMap());
		String idCheck = joinService.selectIdCheck(commandMap.getMap());
		System.out.println(idCheck +"idcheck값이랍니다.");

		
		return idCheck;
	}
	
	
	//일반 회원 회원가입 부분
	@RequestMapping(value="/joinForm", method=RequestMethod.GET) //회원가입 폼 
	public ModelAndView joinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("join/memJoinForm");
		return mv;
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	//회원가입 성공
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("join/joinSuccess");
		
		 System.out.println("===================joinSuccess 실행 ======================");

		System.out.println(commandMap.get("MEM_ID"));
		
		joinService.insertMember(commandMap.getMap());
		
		return mv;
	}
	
	

	
	
	//펫시터 회원가입 부분
	//펫시터 회원가입
	@RequestMapping(value="/pstJoinForm", method=RequestMethod.GET) //회원가입 폼 
	public ModelAndView pstJoinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("join/pstJoinForm");
		return mv;
	}
	
	
	//펫시터 회원 가입 성공 -> 추가 정보 입력페이지 이동 
	@RequestMapping(value="/joinPst", method=RequestMethod.POST)
	public ModelAndView joinPst(CommandMap commandMap, HttpServletRequest request) throws Exception{
		 System.out.println("===================pstJoinFormAdd 실행 ======================");

		ModelAndView mv=new ModelAndView("join/pstJoinFormAdd");
		
		System.out.println(commandMap.get("PSMEM_ID"));
		
		joinService.insertPst(commandMap.getMap(), request);
		
		return mv;
	}
	
	
	@RequestMapping(value="/joinPstAdd", method=RequestMethod.POST)
	//추가 입력 완료
	public ModelAndView pstAdd(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv=new ModelAndView("join/joinSuccess");	
		System.out.println(commandMap.getMap());
		joinService.insertPstAdd(commandMap.getMap(), request);
		
		return mv;
	}
	
	
/*	
	//댕댕이 입력 부분
	//댕댕이 정보 입력
	@RequestMapping(value="/petJoinForm", method=RequestMethod.POST) 
	public ModelAndView petRegisterForm(CommandMap commandMap,  HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("join/petJoinForm");
		
		 System.out.println("===================petRegisterForm 실행 ======================");
	      
	      System.out.println("ID는" + commandMap.get("ID"));
	      
	      //PET_MEM_ID를 DB에서 꺼내오기
	      Map<String, Object> map = joinService.getPstId(commandMap.getMap());
	      //꺼내온 아이디값을 map에 넣어준다. 
	      commandMap.getMap().put("PET_MEM_ID", map.get("PET_MEM_ID"));
	            
	      joinService.petRegist(commandMap.getMap());
		
		return mv;
	} 
	
	//댕댕이 정보 입력
	@RequestMapping(value="/petRegister", method=RequestMethod.POST)
	public ModelAndView petRegister(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		System.out.println("===================petRegister 실행 ======================");
		ModelAndView mv=new ModelAndView("join/petJoinFormAdd");
				
		joinService.petRegist(commandMap.getMap());
		
		return mv;
	}
	
	*/

}

