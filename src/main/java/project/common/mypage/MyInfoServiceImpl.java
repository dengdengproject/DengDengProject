//2020.02.11. PM6:10
package project.common.mypage;
import java.util.Map;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.common.login.LoginDAO;
import project.common.mypage.MyInfoDAO;
import project.common.join.JoinDAO;

import project.common.util.FileUtils;


@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="myInfoDAO")
	private MyInfoDAO myInfoDAO;
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="JoinDAO")
	private JoinDAO joinDAO;
	
	
	@Override //상세 일반회원정보 불러오기 
	public Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception {
	return myInfoDAO.selectMemMyInfoDetail(map);
	}
	
	@Override //상세 펫시터회원정보 불러오기
	public Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception {
	return myInfoDAO.selectPstMyInfoDetail(map);
	}
	
	
	@Override  //상세 펫시터 추가 회원정보 불러오기
	public Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectPstMyInfoAddDetail(map);
	}
	
	@Override  //회원 프로필 정보 불러오기
	public Map<String, Object> selectProfileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		//System.out.println("MyInfoService selectProfileInfo진입");
		return myInfoDAO.selectProfileInfo(map);
	}

	@Override //회원정보 수정
	public void updateMyInfoModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myInfoDAO.updateMyInfoModify(map);	//회원정보 수정
		
		System.out.println("회원정보 수정은 일단 성공");
		//프로필 파일 수정
		//MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	//	String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
	//	System.out.println("filePath는 " +filePath);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		
		
		if(list.size()!=0) { //파일 수정일경우
			Map<String,Object> tempMap = list.get(0);
			System.out.println("PROFILE_NO2값은" +map.get("PROFILE_NO"));
			tempMap.put("PROFILE_NO",map.get("PROFILE_NO")); //수정할 파일 번호를 넘겨준다. 
			myInfoDAO.updateProfile(tempMap);
		}
	}
			
		
		
	
	@Override //회원정보 삭제 
	public int deleteMyInfo(Map<String, Object> map) throws Exception {
		int res;
		Map<String,Object> member = loginDAO.selectId(map);
		if(member.get("PASSWORD1").equals(map.get("PASSWORD1"))){
			myInfoDAO.deleteMyInfo(map);
			res = 1;
		}else {
			res = 0;
		}
		return res;
	}

	@Override  //회원의 마이펫리스트 불러오기
	public List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectMyPetList(map);
	}

	@Override  //프로필 사진 꺼내오기
	public String selectProfile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return  myInfoDAO.selectProfile(map);
	}

	@Override  //펫시터 자격증 정보 불러오기
	public Map<String, Object> selectCertiInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectCertiInfo(map);
	}

	@Override // 위탁장소 이미지 정보 불러오기
	public List<Map<String, Object>>  selectPstPlaceInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectPstPlaceInfo(map);
	}

	
	@Override //위탁장소 이미지 수정
	public void updatePstPlace(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		myInfoDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				joinDAO.insertPstAdd2(tempMap);
			}
			else{
				myInfoDAO.updateFile(tempMap);
			}
		}
	}
	
	
	
		
}  