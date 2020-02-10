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
		return matchDAO.matchInsert(map);
	}

}
