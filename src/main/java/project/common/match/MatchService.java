package project.common.match;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MatchService {
	
	//매치 리스트 업 : 호석
	public Map<String, Object> listMatch(Map<String, Object> map) throws Exception;
		
//	//매치 폼 정보 가져오기 : 호석
//	public Map<String, Object> insertFormMatch(Map<String, Object> map) throws Exception;
	
	//여기부터 매치 관련 정보 가져오기
	//펫시터 정보
	public Map<String, Object> selPetsitter(Map<String, Object> map) throws Exception;
	
	//펫시터 추가 정보
	public Map<String, Object> selPetsitterAdd(Map<String, Object> map) throws Exception;
	
	//펫시터 프로필 사진
	public Map<String, Object> selPetsitterProfile(Map<String, Object> map) throws Exception;
		
	//펫시터 위탁 장소 사진
	public List<Map<String, Object>> selPetsitterAddImg(Map<String, Object> map) throws Exception;
		
	//펫 정보
	public List<Map<String, Object>> selPet(Map<String, Object> map) throws Exception;
	
	//펫 추가 정보
//	public List<Map<String, Object>> selPetAdd(Map<String, Object> map) throws Exception;
	
	
	//매치 관련 정보 가져오기 끝
	
	//매치 삽입 : 호석
	public Map<String, Object> insertMatch(Map<String, Object> map, HttpServletRequest request) throws Exception;

} 
