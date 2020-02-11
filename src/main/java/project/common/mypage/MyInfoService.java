package project.common.mypage;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MyInfoService {

	Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception; //일반회원 상세보기
	
	Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception; //펫시터 상세보기
	
	Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception; //펫시터 상세보기
	
	Map<String, Object> selectCertiInfo(Map<String, Object> map) throws Exception; //펫시터 자격증 정보 불러오기
	
	Map<String, Object> selectProfileInfo(Map<String, Object> map) throws Exception; //회원 프로필이미지 정보 불러오기
	
	List<Map<String, Object>> selectPstPlaceInfo(Map<String, Object> map) throws Exception; //펫시터 위탁장소 정보 불러오기
	
	
	
	void updateMyInfoModify(Map<String, Object> map, HttpServletRequest request) throws Exception;  //회원정보수정
	
	void updatePstPlace(Map<String, Object> map, HttpServletRequest request) throws Exception;  //회원정보수정
	
	int deleteMyInfo(Map<String, Object> map) throws Exception; //회원탈퇴
	
	List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception; //나의 펫리스트 불러오기.
	
	//프로필 사진꺼내기
	String selectProfile(Map<String, Object> map) throws Exception;
}