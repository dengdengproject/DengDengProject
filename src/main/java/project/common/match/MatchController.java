package project.common.match;
//
//2020.02.12 호석
//
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONArray;
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
	@RequestMapping(value = "/matchDetail", method = {RequestMethod.GET})
	public ModelAndView matchDetail(CommandMap commandmap, @RequestParam("seq") int seq, @RequestParam("ID") String ID) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchDetail");

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// ID 값 param으로 가져오기
		map.put("ID", ID);
		
		Map<String, Object> mthdtl = matchService.matchDetail(seq);					//매치 정보 가져오기
		
		Map<String, Object> pst = matchService.selPetsitter(map);					//펫시터 정보 가져오기
		Map<String, Object> pstAdd = matchService.selPetsitterAdd(map);				//펫시터 추가 정보 가져오기
		Map<String, Object> pstPfl = matchService.selPetsitterProfile(map);			//펫시터 프로필 가져오기
		
		List<Map<String, Object>> pet = matchService.selPet(map);					//펫 정보 가져오기
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(map);	//위탁 장소 이미지 가져오기
		List<Map<String, Object>> certi = matchService.selCertificate(map);			//자격증 이미지 가져오기
		
		//가능한 서비스 목록 가져오기
		String serviceLt = (String) mthdtl.get("POSSIBLE_SERVICE");
		String[] serviceList = serviceLt.split(",");
		
		System.out.println("가능한 서비스 : " + Arrays.toString(serviceList));
		
		//가능한 날짜 목록 가져오기
		ArrayList<String> flickr = new ArrayList<String>();
		
		String date1 = (String) mthdtl.get("MATCH_DATE");
		String[] date2 = date1.split(",");
		
		System.out.println("선택 가능 날짜(배열) : " + Arrays.toString(date2));
		
		String date3 = "";
		
		for(int i = 0; i < date2.length; i++) {
			date3 += '\"' + date2[i] + '\"' + ",";
		}
		
		System.out.println("큰 따옴표 붙인 날짜(스트링) : " + date3);
		
		String[] date4 = date3.split(",");
		
		System.out.println("큰 따옴표 붙인 날짜(배열) : " + Arrays.toString(date4));
		
		for(String item : date4) {
			flickr.add(item);
		}
		//이 부분은 리스트를 넘겨서 확인하는 부분입니다.
		List<String> chkList = new ArrayList<String>();
		for(String item1 : date4) {
			chkList.add(item1);
		}
		System.out.println("큰 따옴표 붙인 날짜(리스트) : " + chkList);
		//이 위까지 확인 부분입니다.
		
		mv.addObject("chkList", chkList);			//선택 가능 날짜 리스트
		mv.addObject("serviceList", serviceList);	//선택 서비스 배열
		mv.addObject("matchDtl", mthdtl);			//매치 정보(해당 글)
		mv.addObject("pst", pst);					//펫시터 정보
		mv.addObject("pstAdd", pstAdd);				//펫시터 추가 정보
		mv.addObject("pet", pet);					//펫 정보(펫시터)
		mv.addObject("pstPfl", pstPfl);				//펫시터 프로필 이미지
		mv.addObject("pstImg", pstImg);				//펫시터 위탁 장소 이미지
		mv.addObject("certi", certi);				//펫시터 자격증 이미지
		
		return mv;
	}
	
	//Match Search
	@RequestMapping(value = "/matchSearchClick")
	public ModelAndView matchSearchClick(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchResultList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//이 부분은 값이 넘어오는지 확인하는 부분
		System.out.println("넘어온 주소값(스트링) : " + request.getParameter("ADDRESS1"));
		
		//이 부분은 주소값 만들기 부분
		if(request.getParameter("ADDRESS1") != null && request.getParameter("ADDRESS1") != "") {
			String Address1 = request.getParameter("ADDRESS1");
			String[] searchAddress = Address1.split(" ");
			System.out.println("주소값(배열) : " + Arrays.toString(searchAddress));
			
			for(int i = 0; i < searchAddress.length; i++ ) {
				map.put("add1", searchAddress[0]);
				map.put("add2", searchAddress[1]);
			}
		
			for(Map.Entry<String, Object> elem : map.entrySet()) {
				String key = elem.getKey();
				Object value = elem.getValue();
				
				System.out.println("저장된 주소값 : " + key + " : " + value);
			}
		}	//주소 배열 쪼개서 조건값 2개(도, 시(구)) 만들기 끝.
		
		//조건 검색 만들기 부분
		ArrayList<String> serviceLt = new ArrayList<String>();
		
		String arr[] = request.getParameterValues("serviceChk");
		
		if(arr != null) {
			System.out.println("넘어온 서비스(배열) : " + Arrays.toString(arr));
			
			for(String item : arr) {
				serviceLt.add(item);
			}
		
			System.out.println("서비스 리스트 : " + serviceLt);
		
			try {
				map.put("serviceLt", serviceLt);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}	//조건 검색 끝
		
		//날짜 선택 부분
		
		String searchDate = request.getParameter("basicDate");

		System.out.println("넘어온 날짜(스트링) : " + searchDate);

		if(searchDate != null && searchDate != "") {
			String[] searchDay = searchDate.split(",");

			if(!searchDay.equals(null)) {
				System.out.println("넘어온 날짜(배열) : " + searchDay);

				try {
					map.put("searchDay", searchDay);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		//예약 날짜 쪼개기 끝
		
		//맵 키, 값 확인하기
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		List<Map<String, Object>> resultComplete = matchService.mtchSearch(map);
		
		//resultComplete의 키 값을 확인해서 있으면 넘기고, 없으면 안 넘기고.
		for(Map<String, Object> result : resultComplete) {
			if(result.get("PSMEM_ID") != null && (String)result.get("PSMEM_ID") != "") {
				mv.addObject("resultComplete", resultComplete); //원 파일
			} 
		}
		
		//mv.addObject("resultComplete", resultComplete);
			
		return mv;
	}
	
	//Petsitting Reserve
	@RequestMapping(value = "/petsittingReserve")
	public ModelAndView petsitting(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchDetail2");
		
		String basicDate = request.getParameter("basicDate");	//예약 날짜
		String PSMEM_ID = request.getParameter("PSMEM_ID");		//매치에 등록된 펫시터 아이디
		String MATCH_NO = request.getParameter("MATCH_NO");		//매치 번호
		int seq = Integer.parseInt(MATCH_NO);

		//로그인한 회원 아이디를 세션에서 가져옴
		String MEM_ID = (String)session.getAttribute("ID");			//세션에서 가져온 회원 아이디

		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> psmem = new HashMap<String, Object>();
		
		map.put("MEM_ID", MEM_ID);
		psmem.put("ID", PSMEM_ID);
		
		Map<String, Object> mthdtl = matchService.matchDetail(seq);						//매치 정보 가져오기
		
		Map<String, Object> pst = matchService.selPetsitter(psmem);						//펫시터 정보 가져오기
		Map<String, Object> pstAdd = matchService.selPetsitterAdd(psmem);				//펫시터 추가 정보 가져오기
		Map<String, Object> pstPfl = matchService.selPetsitterProfile(psmem);			//펫시터 프로필 가져오기
		
		List<Map<String, Object>> pet = matchService.selPet(psmem);						//펫시터 펫 정보 가져오기(펫, 추가, 프로필)
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(psmem);		//위탁 장소 이미지 가져오기
		List<Map<String, Object>> certi = matchService.selCertificate(psmem);			//자격증 이미지 가져오기
		
		Map<String, Object> mem = matchService.selMember(map);							//멤버 정보 가져오기(멤버, 프로필)
		List<Map<String, Object>> memPet = matchService.selPet(psmem);					//멤버 펫 정보 가져오기(펫, 추가, 프로필)
		
		//가능한 서비스 목록 가져오기. 근데 왜 스트링으로 나눠지지? 나눠지나 다시 한 번 확인해보자.
		String serviceLt = (String) mthdtl.get("POSSIBLE_SERVICE");
		String[] serviceList = serviceLt.split(",");
		
		System.out.println("가능한 서비스 : " + Arrays.toString(serviceList));
		
		mv.addObject("serviceList", serviceList);	//서비스 리스트
		mv.addObject("matchDtl", mthdtl);			//매치 정보(해당 글)
		mv.addObject("pst", pst);					//펫시터 정보
		mv.addObject("pstAdd", pstAdd);				//펫시터 추가 정보
		mv.addObject("pet", pet);					//펫 정보(펫시터)
		mv.addObject("pstPfl", pstPfl);				//펫시터 프로필 이미지
		mv.addObject("pstImg", pstImg);				//펫시터 위탁 장소 이미지
		mv.addObject("certi", certi);				//펫시터 자격증 이미지
		mv.addObject("mem", mem);					//멤버 정보
		mv.addObject("memPet", memPet);				//펫 정보(멤버)
		mv.addObject("basicDate", basicDate);		//예약 날짜
		
		return mv;
	}
	
	//Match Main All View Button
	@RequestMapping(value = "/matchAddList")
	public ModelAndView matchAddList(CommandMap commandMap, @RequestParam("num") int num) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchAddList");
		
		//이 부분은 값이 넘어오는지 확인하는 부분
		System.out.println("넘어온 체크 값(인트) : " + num);
		
		List<Map<String, Object>> addList = new ArrayList<Map<String, Object>>();
		
		if(num == 1) {
			addList = matchService.matchAllList(commandMap.getMap());
			mv.addObject("addList", addList);
		} else if(num == 2) {
			addList = matchService.matchProList(commandMap.getMap());
			mv.addObject("addList", addList);
		} else if(num == 3) {
			addList = matchService.matchNewList(commandMap.getMap());
			mv.addObject("addList", addList);
		}
			
		return mv;
	}
}
