package project.common.match;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("matchService")
public class MatchServiceImpl implements MatchService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="matchDAO")
	private MatchDAO matchDAO;

	@Override
	public Map<String, Object> listMatch(Map<String, Object> map) throws Exception {
		
		return matchDAO.matchList(map);
	}
	
//	@Override
//	public Map<String, Object> insertFormMatch(Map<String, Object> map) throws Exception {
//		// TODO Auto-generated method stub
//		return matchDAO.matchInsertForm(map);
//	}
	
	//펫시터 정보
	@Override
	public Map<String, Object> selPetsitter(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitter(map);
	}
		
	//펫시터 추가 정보
	@Override
	public Map<String, Object> selPetsitterAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitterAdd(map);
	}
	
	//펫시터 프로필 사진
	@Override
	public Map<String, Object> selPetsitterProfile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitterProfile(map);
	}
	
	//펫시터 위탁 장소 사진
	@Override
	public List<Map<String, Object>> selPetsitterAddImg(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitterAddImg(map);
	}
		
	//펫 정보
	@Override
	public List<Map<String, Object>> selPet(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPet(map);
	}
	
	//자격증
	@Override
	public List<Map<String, Object>> selCertificate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltCertificate(map);
	}
		
	//펫 추가 정보
//	@Override
//	public List<Map<String, Object>> selPetAdd(Map<String, Object> map) throws Exception {
//		// TODO Auto-generated method stub
//		return matchDAO.sltPetAdd(map);
//	}
	
	//매치 관련 정보 가져오기 끝
	
	
	//매치 등록
	@Override
	public Map<String, Object> insertMatch(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.matchInsert(map, request);
	}

	//매치 리스트 뽑기 - 모든 매치(매치 등록 역순)
	@Override
	public List<Map<String, Object>> matchAllList(Map<String, Object> map) throws Exception {
		return matchDAO.matchLtAll(map);
	}

	//매치 리스트 뽑기 - 프로 펫시터(프로 등급, 펫시팅 횟수 높은 순)
	@Override
	public List<Map<String, Object>> matchProList(Map<String, Object> map) throws Exception {
		return matchDAO.matchLtPro(map);
	}
		
	//매치 리스트 뽑기 - 신입 펫시터(신입 등급, 가입일 최근 순)
	@Override
	public List<Map<String, Object>> matchNewList(Map<String, Object> map) throws Exception {
		return matchDAO.matchLtNew(map);
	}
	
	//매치 디테일
	public Map<String, Object> matchDetail(int seq) throws Exception {
		return matchDAO.matchDtlAdd(seq);
	}
	
	//매치 검색 기능
	public List<Map<String, Object>> mtchSearch(Map<String, Object> map) throws Exception {
		return matchDAO.matchSrch(map);
	}
	
}
