//2020.02.11. PM6:10
/* MyInfoService MyInfoController MyInfoDAO
http://localhost:8080/ninaebang/myPage/MyInfoDetail		내 정보 보기	/myInfo/MyInfoDetail		MyInfoDetail()		selectInfoDetail	MyInfoDetail.jsp
http://localhost:8080/ninaebang/myPage/MyInfoModifyForm	정보 수정 폼	/myInfo/MyInfoModifyForm	MyInfoModify()		selectInfoDetail	MyInfoModifyForm.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoModify		내 정보 수정	/myInfo/MyInfoModify		MyInfoModify()-post	updateInfoModify	MyInfoModify.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDeleteComfirm회원탈퇴-비밀번호확인						MyInfoDelete.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDelete		회원탈퇴	/myInfo/MyInfoDelete		MyInfoDelete()		deleteInfo			redirect: main	*/
package project.common.mypage;
import java.util.Map;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.mypage.MyInfoService;
import project.common.join.JoinService;

@Controller
public class MyInfoController {
	@Resource(name="myInfoService") 
	private MyInfoService myInfoService;
	
	 
	@Resource(name="joinService") 
	private JoinService joinService;
	
///MyInfoDetail  마이페이지 회원정보 상세보기
@RequestMapping(value="/MyInfodetail")
public ModelAndView MyInfoDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
	
	HttpSession session = request.getSession();
	String id = (String)session.getAttribute("ID");
	String mem_type = (String)session.getAttribute("MEM_TYPE");
	commandMap.put("MEM_TYPE",mem_type);
	commandMap.put("ID",id);
	
	//펫시터일때
	if(mem_type.equals("펫시터")){ 
		ModelAndView mv = new ModelAndView("mypage/pstMyInfo");
		commandMap.put("PSMEM_ID",id);
		Map<String,Object> map = myInfoService.selectPstMyInfoDetail(commandMap.getMap());	//해당 ID값으로 회원상세정보들을 읽어온후 map에 저장. 
		Map<String,Object> map1 = myInfoService.selectPstMyInfoAddDetail(commandMap.getMap());  //펫시터 추가 정보 불러오기
		Map<String,Object> certi = myInfoService.selectCertiInfo(commandMap.getMap()); //펫시터 자격증 정보 불러오기
		List<Map<String, Object>> list = myInfoService.selectPstPlaceInfo(commandMap.getMap()); //펫시터 위탁장소 이미지 불러오기
		
		mv.addObject("map",map); //회원정보를 담은 map을 mv에 저장
		mv.addObject("map1",map1); //회원정보를 담은 map을 mv에 저장
		mv.addObject("certi", certi); //펫시터 자격증 정보 mv에 저장
		mv.addObject("list", list); //위탁장소 이미지 저장
		String path = myInfoService.selectProfile(commandMap.getMap());  //DB에서  PSMEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
		mv.addObject("path",path); //회원정보를 담은 map을 mv에 저장
		return mv;
	} 
	
	//일반회원일때
		ModelAndView mv = new ModelAndView("mypage/memMyInfo");
		commandMap.put("MEM_ID",id);
		Map<String,Object> map = myInfoService.selectMemMyInfoDetail(commandMap.getMap());	//해당 ID값으로 회원상세정보들을 읽어온후 map에 저장. 
		mv.addObject("map",map); //회원정보를 담은 map을 mv에 저장
		String path = myInfoService.selectProfile(commandMap.getMap());  //DB에서  MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
		
		mv.addObject("path",path); //회원정보를 담은 map을 mv에 저장
		
		//Map<String,Object> map1 = myInfoService.selectProfileInfo(commandMap.getMap());	//해당 ID값으로 회원상세정보들을 읽어온후 map에 저장. 
		//mv.addObject("map1", map1);
	return mv;
}

///MyInfoModifyForm  회원정보수정시 . 회원정보상세보기에서 수정버튼을 누르면 여기로 이동
@RequestMapping(value="/memInfoModifyForm")
public ModelAndView MyInfoModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	
	System.out.println("-----------------memInfoModify 컨트롤러들어옴------------");
	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("ID");  //수정할 회원의 정보를 읽어오기 위해 ID값을 가져온다. 
	String mem_type = (String)session.getAttribute("MEM_TYPE"); //회원유형에 따라 
	commandMap.put("MEM_TYPE",mem_type); 
	commandMap.put("ID", id);
	
	List<Map<String, Object>> list = null;
	
	
	//펫시터일때
	if(mem_type.equals("펫시터")){
		ModelAndView mv = new ModelAndView("mypage/pstModify");
		commandMap.put("PSMEM_ID",id); //id값을 map에 저장하고
		Map<String,Object> map = myInfoService.selectPstMyInfoDetail(commandMap.getMap()); //수정할 회원의 정보들을 읽어온후 map에 저장
		Map<String,Object> map1 = myInfoService.selectPstMyInfoAddDetail(commandMap.getMap()); //추가 정보를 읽어온후 map1에 저장
		Map<String,Object> certi = myInfoService.selectCertiInfo(commandMap.getMap()); //펫시터 자격증 정보 불러오기
		list = myInfoService.selectPstPlaceInfo(commandMap.getMap()); //펫시터 위탁장소 이미지정보 불러오기
		
		mv.addObject("map",map); // map을 mv에 저장
		mv.addObject("map1",map1); // map을 mv에 저장
		mv.addObject("certi", certi); //펫시터 자격증 정보 mv에 저장
		mv.addObject("list", list); //위탁장소 이미지 저장
		
		String path = myInfoService.selectProfile(commandMap.getMap());  //DB에서  PSMEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
		mv.addObject("path",path); //프로필 저장경로를 mv에 저장
		
		Map<String,Object> map2 = myInfoService.selectProfileInfo(commandMap.getMap());	//프로필 이미지 정보 가져오기
		mv.addObject("map2", map2);
		
		return mv;
	}
	
	//일반회원일때
	ModelAndView mv = new ModelAndView("mypage/memModify");
	commandMap.put("MEM_ID",id); //id값을 map에 저장하고
	Map<String,Object> map = myInfoService.selectMemMyInfoDetail(commandMap.getMap()); //수정할 회원의 정보들을 읽어온후 map에 저장
	mv.addObject("map",map); // map을 mv에 저장
	
	String path = myInfoService.selectProfile(commandMap.getMap());  //DB에서  MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
	mv.addObject("path",path); //프로필 저장경로를 mv에 저장
	
	Map<String,Object> map1 = myInfoService.selectProfileInfo(commandMap.getMap());	//프로필 이미지 정보 가져오기
	mv.addObject("map1", map1);
	
	return mv;
}

///MyInfoModify  회원정보수정. 회원정보수정페이지에서 정보수정후 확인버튼을 누르면 여기로 이동함. 
@RequestMapping(value="/memInfoModify") 
public ModelAndView MyInfoModify(CommandMap commandMap, HttpServletRequest request)throws Exception{
	ModelAndView mv=new ModelAndView("redirect:/MyInfodetail");	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("ID");
	String mem_type = (String)session.getAttribute("MEM_TYPE");
	String profile_num =(String)commandMap.get("PROFILE_NO"); //프로필 수정을 위한 프로필번호값
	//System.out.println("PROFILE_NO1값은" +profile_num);
	commandMap.put("MEM_TYPE", mem_type); //회원유형에 따라 DAO에서 다른 SQL문 수행
	
	//펫시터일때
	if(mem_type.equals("펫시터")){
		commandMap.put("PSMEM_ID",id);
		myInfoService.updateMyInfoModify(commandMap.getMap(), request);	
		System.out.println("컨트롤러 MyInfoModify 펫시터일때");
	//	myInfoService.updatePstPlace(commandMap.getMap(), request);
		return mv;
	}
	
	//일반회원일때
	commandMap.put("MEM_ID",id);
	commandMap.put("PROFILE_NO", profile_num);
	myInfoService.updateMyInfoModify(commandMap.getMap(), request);	
	return mv;
}


//modifyPstPlaceForm 위탁장소 이미지 수정하기폼 페이지
@RequestMapping(value="/modifyPstPlaceForm")
public ModelAndView modifyPstPlaceForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/pstModify3");
	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("ID");
	System.out.println("위탁장소 이미지 새창에서 ID값은" +id);
	commandMap.put("PSMEM_ID",id); //id값을 map에 저장하고
	commandMap.put("ID",id); //id값을 map에 저장하고
	List<Map<String, Object>> list = myInfoService.selectPstPlaceInfo(commandMap.getMap()); //펫시터 위탁장소 이미지 정보불러오기
	mv.addObject("list", list); //위탁장소 이미지 저장
	
	return mv;
}

//modifyPstPlace 위탁장소 이미지 수정하기
@RequestMapping(value="/modifyPstPlace")
public ModelAndView modifyPstPlace(CommandMap commandMap, HttpServletRequest request) throws Exception{

	ModelAndView mv = new ModelAndView("redirect:/MyInfodetail");
	

	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("ID");	
	commandMap.put("PSMEM_ID",id);
	myInfoService.updatePstPlace(commandMap.getMap(), request);
	return mv;

}
 

//modifyCertiForm 자격증파일 수정 페이지
@RequestMapping(value="/modifyCertiForm")
public ModelAndView modifyCertiForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/pstModifyCerti");
	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("ID");
	commandMap.put("PSMEM_ID",id); //id값을 map에 저장하고
	commandMap.put("ID",id); //id값을 map에 저장하고
	Map<String,Object> certi = myInfoService.selectCertiInfo(commandMap.getMap()); //펫시터 자격증 정보 불러오기
	mv.addObject("certi", certi); //자격증정보
	
	return mv;
}

//modifyCerti  자격증 수정하기
@RequestMapping(value="/modifyCerti")
public ModelAndView modifyCerti(CommandMap commandMap, HttpServletRequest request) throws Exception{

	ModelAndView mv = new ModelAndView("redirect:/MyInfodetail");
	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("ID");	
	commandMap.put("PSMEM_ID",id);
	System.out.println("modifyCerti에 있는 CertiName은 " + commandMap.get("CERTI_NAME"));
	myInfoService.updateCerti(commandMap.getMap(), request);
	return mv;

}













//MyInfoDeleteComfirm 회원탈퇴 신청하기 페이지
@RequestMapping(value="/memDeleteComfirm")
public ModelAndView MyInfoDeleteConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/memDelete");
	return mv;
}

///MyInfoDelete 탈퇴신청폼 작성후 실제 탈퇴
	@RequestMapping(value="/myInfoDelete")
	public ModelAndView MyInfoDelete(CommandMap commandMap, HttpServletRequest request)throws Exception{
	ModelAndView mv=new ModelAndView("mypage/delete");	
	HttpSession session = request.getSession();
	commandMap.put("ID", commandMap.get("MEM_ID"));
	int res = myInfoService.deleteMyInfo(commandMap.getMap());	
	//비밀번호가 맞아서 탈퇴처리될때 로그아웃
	if(res==1) {
		session.invalidate();
	}
	mv.addObject("res",res);
	return mv;
}

	
	///myPetList  마이펫리스트
	@RequestMapping(value="/myPetList")
	public ModelAndView MyPetList(Map<String, Object> commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/memPetList");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		commandMap.put("ID",id);
		System.out.println("commandMap에 있는 MEM_ID는" + commandMap.get("ID"));
		
		List<Map<String,Object>> list= myInfoService.selectMyPetList(commandMap);	//회원ID로 펫리스트 꺼내오기
		commandMap.put("ID",id );
		commandMap.put("PET_MEM_NAME", list.get(0).get("PET_MEM_NAME"));
		
		
		//펫 이미지 꺼내오기 1.PET_MEM_ID를 DB에서 꺼내오기
		String pet_mem_id = joinService.getPetMemId(commandMap); 
		System.out.println("맵에서 꺼내온 펫아이디는 " + pet_mem_id);
		//꺼내온 아이디값을 map에 넣어준다. 
		commandMap.put("PET_MEM_ID", pet_mem_id);

		System.out.println("마이펫리스트에서 불러올 펫 이미지 회원 아이디와 펫아이디는 "+ commandMap.get("ID") + commandMap.get("PET_MEM_ID"));
		
		//DB에서 PET_MEM_ID값과 MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
		String path = myInfoService.selectProfile(commandMap);
		System.out.println("경로는~!!!!!!!!!"+path);
		
		mv.addObject("list",list); //회원정보를 담은 map을 mv에 저장
		mv.addObject("path",path); //불러올 이미지 파일경로를 mv에 저장 
		return mv;
	}	
	
	
	
	

}   
