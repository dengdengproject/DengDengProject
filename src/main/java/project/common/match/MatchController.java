package project.common.match;

import java.util.HashMap;
import java.util.List;
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
public class MatchController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "matchService")
	private MatchService matchService;
	
	//Match List로 이동 : 호석
	@RequestMapping(value = "/matchMain")
	public ModelAndView matchMain(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchMain");

		return mv;
	}
	
	//Match Insert Form으로 이동 : 호석
	@RequestMapping(value = "/matchInsertForm")
	public ModelAndView matchInsertForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchInsertForm");
		
		String ID = (String)session.getAttribute("ID");

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("ID", ID);
		
		Map<String, Object> pst = matchService.selPetsitter(map);				//펫시터 정보 가져오기
		Map<String, Object> pstAdd = matchService.selPetsitterAdd(map);			//펫시터 추가 정보 가져오기
		Map<String, Object> pstPfl = matchService.selPetsitterProfile(map);		//펫시터 프로필 가져오기
		
		List<Map<String, Object>> pet = matchService.selPet(map);				//펫 정보 가져오기
//		List<Map<String, Object>> petAdd = matchService.selPetAdd(map);			//펫 추가 정보 가져오기
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(map);//위탁 장소 이미지 가져오기
																				//자격증 이미지 가져오기

//		for(int i=0;i<pet.size();i++) {
//		String s = (String)pet.get(i).get("");
//		}
		
		mv.addObject("pst", pst);
		mv.addObject("pstAdd", pstAdd);
		mv.addObject("pet", pet);
//		mv.addObject("petAdd", petAdd);
		mv.addObject("pstPfl", pstPfl);
		mv.addObject("pstImg", pstImg);
		
		return mv;
	}

	//Match Insert 기능 구현 : 호석
	@RequestMapping(value = "/matchCommit", method = RequestMethod.POST)
	public ModelAndView matchInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/matchMain");
		
		if(request.getParameterValues("serviceChk") != null) {
			String[] arr = request.getParameterValues("serviceChk");
			String serviceArr = "";
			for(int i = 0; i < arr.length; i++) {
				serviceArr = serviceArr + arr[i] +",";
			}
			commandMap.put("serviceArr", serviceArr);
		} else {
			commandMap.put("serviceArr", "");
		}
		
		matchService.insertMatch(commandMap.getMap(), request);
		
		return mv;
	}
}
