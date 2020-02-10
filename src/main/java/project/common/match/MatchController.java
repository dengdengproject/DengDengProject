package project.common.match;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		
		List<Map<String, Object>> allList = matchService.matchAllList(commandMap.getMap());
		List<Map<String, Object>> proList = matchService.matchProList(commandMap.getMap());
		List<Map<String, Object>> newList = matchService.matchNewList(commandMap.getMap());
		
		mv.addObject("allList", allList);
		mv.addObject("proList", proList);
		mv.addObject("newList", newList);
		
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
		List<Map<String, Object>> certi = matchService.selCertificate(map);//자격증 이미지 가져오기

//		for(int i=0;i<pet.size();i++) {
//		String s = (String)pet.get(i).get("");
//		}
		
		mv.addObject("pst", pst);
		mv.addObject("pstAdd", pstAdd);
		mv.addObject("pet", pet);
//		mv.addObject("petAdd", petAdd);
		mv.addObject("pstPfl", pstPfl);
		mv.addObject("pstImg", pstImg);
		mv.addObject("certi", certi);
		
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
				serviceArr = serviceArr + arr[i] + ",";
				System.out.println(serviceArr);
			}
			commandMap.put("serviceArr", serviceArr);
		} else {
			commandMap.put("serviceArr", "");
		}
		
		matchService.insertMatch(commandMap.getMap(), request);
		
		return mv;
	}
	
	//Match Detail로 이동 : 호석
	@SuppressWarnings("null")
	@RequestMapping(value = "/matchDetail", method = {RequestMethod.GET})
	public ModelAndView matchDetail(CommandMap commandmap, @RequestParam("seq") int seq, @RequestParam("ID") String ID) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchDetail");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", ID);
		
		Map<String, Object> mthdtl = matchService.matchDetail(seq);
		//아래의 내용을 불러와야 되는데, seq로 넘어가는 건 게시글 번호 뿐이라 불가능하다. 어떻게 해야 할까? get 방식으로 받아서 어쩔 수 없는데...
		Map<String, Object> pst = matchService.selPetsitter(map);				//펫시터 정보 가져오기
		Map<String, Object> pstAdd = matchService.selPetsitterAdd(map);			//펫시터 추가 정보 가져오기
		Map<String, Object> pstPfl = matchService.selPetsitterProfile(map);		//펫시터 프로필 가져오기
		
		List<Map<String, Object>> pet = matchService.selPet(map);				//펫 정보 가져오기
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(map);//위탁 장소 이미지 가져오기
		List<Map<String, Object>> certi = matchService.selCertificate(map);//자격증 이미지 가져오기
		
		String serviceLt = (String) mthdtl.get("POSSIBLE_SERVICE");
		String[] serviceList = serviceLt.split(",");
		
		//System.out.println(Arrays.toString(serviceList));
		
		String dateflickr = (String) mthdtl.get("MATCH_DATE");
		String[] dateflikr = dateflickr.split(",");
		
		System.out.println(Arrays.toString(dateflikr));
		
		String flickr = "";
		
		for(int i = 0; i < dateflikr.length; i++) {
			flickr += '\"' + dateflikr[i] + '\"' + ",";
		}
		
		System.out.println(flickr);
		
		String[] flikr = flickr.split(",");
		System.out.println(Arrays.toString(flikr));
		
		mv.addObject("flikr", flikr);
		mv.addObject("flickr", flickr);
		mv.addObject("flatFlickr", dateflikr);
		
		mv.addObject("serviceList", serviceList);
		mv.addObject("matchDtl", mthdtl);
		mv.addObject("pst", pst);
		mv.addObject("pstAdd", pstAdd);
		mv.addObject("pet", pet);
		mv.addObject("pstPfl", pstPfl);
		mv.addObject("pstImg", pstImg);
		mv.addObject("certi", certi);
		return mv;
	}
	
	//Match Search
	@RequestMapping(value = "/matchSearchClick")
	public ModelAndView matchSearchClick(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchResult");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//이 부분에 서비스 목록 찍은거 가져와서 배열로 만들어서 담자. 스트링 ㄴㄴ 배열.
		if(request.getParameterValues("searchCheck") != null) {
			String[] arr = request.getParameterValues("searchCheck");
			
			map.put("searchCheckArr", arr);
		} else {
			map.put("searchCheckArr", "");
		}
		
		//이 부분에서는 날짜 검색한 스트링을 ','를 기준으로 스플릿 해서 배열로 넣자.
		String searchDate = request.getParameter("searchDateCheck");
		String[] searchDay = searchDate.split(",");
		
		map.put("searchDay", searchDay);
		
		List<Map<String, Object>> searchResult = matchService.mtchSearch(map);	//검색 결과 가져오기
		
		mv.addObject("searchResult", searchResult);
			
		return mv;
	}
		
}
