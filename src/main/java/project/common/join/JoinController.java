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
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService") // service 영역에 접근
	private JoinService joinService;

	@RequestMapping(value = "/join/idCheck") // 아이디 중복확인 체크
	public @ResponseBody String idCheck(CommandMap commandMap) throws Exception {

		System.out.println(commandMap.getMap());
		String idCheck = joinService.selectIdCheck(commandMap.getMap());
		System.out.println(idCheck + "idcheck값이랍니다.");

		return idCheck;
	}

	// 회원가입 페이지
	@RequestMapping(value = "/joinPage", method = RequestMethod.GET)
	public ModelAndView joinPage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("join/join");
		return mv;
	}
	
	//일반회원 회원가입 동의
	@RequestMapping(value = "/memJoinAgree", method = RequestMethod.GET)
	public ModelAndView memJoinAgreePage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("join/agreementMem");
		return mv;
	}
	
	//펫시터 회원가입 동의
	@RequestMapping(value = "/pstJoinAgree", method = RequestMethod.GET)
	public ModelAndView pstJoinAgreePage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("join/agreementPst");
		return mv;
	}
	

///////////////////////////////////일반 회원가입////////////////////////////////////////

	// 일반 회원 회원가입 부분
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("join/memJoinForm");
		return mv;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	// 회원가입 성공
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/joinSuccess"); // join/joinSuccess에서 수정
		System.out.println(commandMap.get("MEM_ID"));

		joinService.insertMember(commandMap.getMap(), request);

		return mv;
	}

///////////////////////////////////팻시터 회원가입////////////////////////////////////////

	// 펫시터 회원가입 부분
	// 펫시터 회원가입
	@RequestMapping(value = "/pstJoinForm", method = RequestMethod.GET) // 회원가입 폼
	public ModelAndView pstJoinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("join/pstJoinForm");
		return mv;
	}

	// 펫시터 회원 가입 성공 -> 추가 정보 1입력페이지 이동
	@RequestMapping(value = "/joinPst1", method = RequestMethod.POST)
	public ModelAndView joinPst1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println("===================pstJoinFormAdd1 실행 ======================");

		ModelAndView mv = new ModelAndView("join/pstJoinFormAdd");

		//System.out.println(commandMap.get("PSMEM_ID"));
		
		joinService.insertPst(commandMap.getMap(), request);
		mv.addObject("map", commandMap.getMap());

		return mv;
	}
	
	// 펫시터 추가 정보 2입력페이지 이동
	@RequestMapping(value = "/joinPst2", method = RequestMethod.POST)
	public ModelAndView joinPst2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println("===================pstJoinFormAdd2 실행 ======================");

		ModelAndView mv = new ModelAndView("join/pstJoinFormAdd2");

		System.out.println("두번째 페이지에서 넘어온 펫시터ID는" +request.getParameter("PSMEM_ID"));
		commandMap.getMap().put("PSMEM_ID",request.getParameter("PSMEM_ID"));
		joinService.insertPstAdd(commandMap.getMap(), request);
		mv.addObject("map", commandMap.getMap());
		return mv;
	}
	
	

	@RequestMapping(value = "/joinPstAdd", method = RequestMethod.POST)
	// 추가 입력 완료
	public ModelAndView pstAdd(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/joinSuccess");
		System.out.println("마지막 페이지에서 넘어온 펫시터ID는" +request.getParameter("PSMEM_ID"));
		commandMap.getMap().put("PSMEM_ID",request.getParameter("PSMEM_ID"));
		joinService.insertPstAdd2(commandMap.getMap(), request);

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
			String pet_mem_id = joinService.getPetMemId(commandMap.getMap());
			//꺼내온 아이디값을 map에 넣어준다. 
			commandMap.getMap().put("PET_MEM_ID", pet_mem_id);
					
			joinService.petRegistAdd(commandMap.getMap());
			
			return mv;
		}

	/*
	 * //댕댕이 입력 부분 //댕댕이 정보 입력
	 * 
	 * @RequestMapping(value="/petJoinForm", method=RequestMethod.POST) public
	 * ModelAndView petRegisterForm(CommandMap commandMap, HttpServletRequest
	 * request) throws Exception{ ModelAndView mv=new
	 * ModelAndView("join/petJoinForm");
	 * 
	 * System.out.
	 * println("===================petRegisterForm 실행 ======================");
	 * 
	 * System.out.println("ID는" + commandMap.get("ID"));
	 * 
	 * //PET_MEM_ID를 DB에서 꺼내오기 Map<String, Object> map =
	 * joinService.getPstId(commandMap.getMap()); //꺼내온 아이디값을 map에 넣어준다.
	 * commandMap.getMap().put("PET_MEM_ID", map.get("PET_MEM_ID"));
	 * 
	 * joinService.petRegist(commandMap.getMap());
	 * 
	 * return mv; }
	 * 
	 * //댕댕이 정보 입력
	 * 
	 * @RequestMapping(value="/petRegister", method=RequestMethod.POST) public
	 * ModelAndView petRegister(CommandMap commandMap, HttpServletRequest request)
	 * throws Exception{
	 * 
	 * System.out.println("===================petRegister 실행 ======================"
	 * ); ModelAndView mv=new ModelAndView("join/petJoinFormAdd");
	 * 
	 * joinService.petRegist(commandMap.getMap());
	 * 
	 * return mv; }
	 * 
	 */

}
