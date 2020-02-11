package project.common.match;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MatchService {
	
	//매치 리스트 업 : 호석
	public Map<String, Object> listMatch(Map<String, Object> map) throws Exception;
		
	//매치 폼 정보 가져오기 : 호석 / 사용 안 함.
//	public Map<String, Object> insertFormMatch(Map<String, Object> map) throws Exception;
	
	//**************************************여기부터 매치 관련 정보 가져오기**************************************
	//펫시터 정보
	public Map<String, Object> selPetsitter(Map<String, Object> map) throws Exception;
	
	//펫시터 추가 정보
	public Map<String, Object> selPetsitterAdd(Map<String, Object> map) throws Exception;
	
	//펫시터 프로필 사진
	public Map<String, Object> selPetsitterProfile(Map<String, Object> map) throws Exception;
		
	//펫시터 위탁 장소 사진
	public List<Map<String, Object>> selPetsitterAddImg(Map<String, Object> map) throws Exception;
		
	//펫 정보(펫 + 추가 + 프로필)
	public List<Map<String, Object>> selPet(Map<String, Object> map) throws Exception;
	
	//자격증
	public List<Map<String, Object>> selCertificate(Map<String, Object> map) throws Exception;
		
	//펫 추가 정보  : 사용 안 함. 펫 + 펫 추가 + 펫 프로필 합침
//	public List<Map<String, Object>> selPetAdd(Map<String, Object> map) throws Exception;
	
	//**************************************매치 관련 정보 가져오기 끝**************************************
	
	//매치 등록 : 호석
	public Map<String, Object> insertMatch(Map<String, Object> map, HttpServletRequest request) throws Exception;

	
	//매치 리스트 뽑기 - 모든 매치(매치 등록 역순)
	public List<Map<String, Object>> matchAllList(Map<String, Object> map) throws Exception;

	//매치 리스트 뽑기 - 프로 펫시터(프로 등급, 펫시팅 횟수 높은 순)
	public List<Map<String, Object>> matchProList(Map<String, Object> map) throws Exception;
	
	//매치 리스트 뽑기 - 신입 펫시터(신입 등급, 가입일 최근 순)
	public List<Map<String, Object>> matchNewList(Map<String, Object> map) throws Exception;
	
	//매치 디테일
	public Map<String, Object> matchDetail(int seq) throws Exception;
	
	//매치 검색 기능
	public List<Map<String, Object>> mtchSearch(Map<String, Object> map) throws Exception;

} 
