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
	
///MyInfoDetail  일반회원 마이페이지 회원정보 상세보기
@RequestMapping(value="/MyInfodetail")
public ModelAndView MyInfoDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/memMyInfo");
	HttpSession session = request.getSession();
	String id = (String)session.getAttribute("ID");
	
	System.out.println("id값은" +id);
	commandMap.put("MEM_ID",id);
	Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap());	//해당 ID값으로 회원상세정보들을 읽어온후 map에 저장. 
	mv.addObject("map",map); //회원정보를 담은 map을 mv에 저장
	return mv;
}

///MyInfoModifyForm  회원정보수정시 . 회원정보상세보기에서 수정버튼을 누르면 여기로 이동
@RequestMapping(value="/memInfoModifyForm")
public ModelAndView MyInfoModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	
	System.out.println("-----------------memInfoModify 컨트롤러들어옴------------");
	ModelAndView mv = new ModelAndView("mypage/memInfoModify");
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("MEM_ID");  //수정할 회원의 정보를 읽어오기 위해 MEM_ID값을 가져온다. 
	commandMap.put("MEM_ID",id); //id값을 map에 저장하고
	Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap()); //수정할 회원의 정보들을 읽어온후 map에 저장
	mv.addObject("map",map); // map을 mv에 저장
	return mv;
}
///MyInfoModify  회원정보수정. 회원정보수정페이지에서 정보수정후 확인버튼을 누르면 여기로 이동함. 
@RequestMapping(value="/memInfoModify") 
public ModelAndView MyInfoModify(CommandMap commandMap, HttpServletRequest request)throws Exception{
	ModelAndView mv=new ModelAndView("redirect:/MyInfodetail");	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("MEM_ID");
	commandMap.put("MEM_ID",id);
	myInfoService.updateMyInfoModify(commandMap.getMap());	
	//mv.addObject("MyInfo", commandMap.get("MyInfo"));
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
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",id);
		//System.out.println("commandMap에 있는 MEM_ID는" + commandMap.get("MEM_ID"));
		
		List<Map<String,Object>> list= myInfoService.selectMyPetList(commandMap);	//회원ID로 펫리스트 꺼내오기
		commandMap.put("ID",id );
		commandMap.put("PET_MEM_NAME", list.get(0).get("PET_MEM_NAME"));
		
		
		//펫 이미지 꺼내오기 1.PET_MEM_ID를 DB에서 꺼내오기
		String pet_mem_id = joinService.getPetMemId(commandMap); 
		System.out.println("맵에서 꺼내온 펫아이디는 " + pet_mem_id);
		//꺼내온 아이디값을 map에 넣어준다. 
		commandMap.put("PET_MEM_ID", pet_mem_id);

		System.out.println("마이펫리스트에서 불러올 펫 이미지 회원 아이디와 펫아이디는 "+ commandMap.get("MEM_ID") + commandMap.get("PET_MEM_ID"));
		
		//DB에서 PET_MEM_ID값과 MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
		String path = myInfoService.selectProfile(commandMap);
		System.out.println("경로는~!!!!!!!!!"+path);
		
		mv.addObject("list",list); //회원정보를 담은 map을 mv에 저장
		mv.addObject("path",path); //불러올 이미지 파일경로를 mv에 저장 
		return mv;
	}	
	
	
	
	

}   
  