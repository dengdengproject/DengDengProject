package project.common.match;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("matchDAO")
public class MatchDAO extends AbstractDAO {

	//매치 리스트 뽑기
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchList(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.matchList", map);
	}
	
//	//매치 폼 진입 시 데이터 불러오기(펫시터)
//	@SuppressWarnings("unchecked")
//	public Map<String, Object> matchInsertForm(Map<String, Object> map) throws Exception {
//		
//		return (Map<String, Object>) selectOne("matchSql.matchInsertForm", map);
//	}
	
	//여기부터 매치 폼 진입 시 불러올 데이터 목록
	//펫시터 정보 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltPetsitter(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectPetsitter", map);
	}
	
	//펫시터 추가 정보 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltPetsitterAdd(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectPetsitterAdd", map);
	}
	
	//펫시터 프로필 사진 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltPetsitterProfile(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectPetsitterProfile", map);
	}
	
	//위탁 장소 이미지 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltPetsitterAddImg(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectPetsitterAddImg", map);
	}
	
	//펫 정보 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltPet(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectPet", map);
	}
	
	//자격증 정보 사져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltCertificate(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectCertificate", map);
	}
		
//	//펫 추가 정보 가져오기
//	@SuppressWarnings("unchecked")
//	public List<Map<String, Object>> sltPetAdd(Map<String, Object> map) throws Exception {
//		
//		return (List<Map<String, Object>>) selectList("matchSql.selectPetAdd", map);
//	}
//	
	//펫시터 정보 가져오기 끝
	
	
	//매치 등록 기능(펫시터)
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.matchInsert", map);
	}
	
	//매치 리스트 뽑기 - 모든 매치(매치 등록 역순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchLtAll(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchListAll", map);
	}
	
	//매치 리스트 뽑기 - 프로 펫시터(프로 등급, 펫시팅 횟수 높은 순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchLtPro(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchListPro", map);
	}
	
	//매치 리스트 뽑기 - 신입 펫시터(신입 등급, 가입일 최근 순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchLtNew(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchListNew", map);
	}
	
	//매치 디테일(GET)
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchDtlAdd(int seq) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.matchDetailAdd", seq);
	}
		
	//매치 검색 기능(둘다)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchSrch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchSearch", map);
	}
	
	//매치 검색 결과 리스트(둘다)
	//매치 등록 수정(펫시터)
	//매치 등록 취소(펫시터)
}
