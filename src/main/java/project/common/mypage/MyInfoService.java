package project.common.mypage;


import java.util.List;
import java.util.Map;

public interface MyInfoService {

	Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception; //일반회원 상세보기
	Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception; //펫시터 상세보기
	Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception; //펫시터 상세보기
	void updateMyInfoModify(Map<String, Object> map) throws Exception;
	int deleteMyInfo(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception; //나의 펫리스트 불러오기.
	
	//프로필 사진꺼내기
	String selectProfile(Map<String, Object> map) throws Exception;
}
 
