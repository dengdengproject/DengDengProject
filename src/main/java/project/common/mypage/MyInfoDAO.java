//2020.02.11. PM6:10
package project.common.mypage;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import project.common.dao.AbstractDAO;

@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO {

	//일반회원상세정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectmeminfo",map);
	}
	 
	//펫시터회원상세정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectpstinfo",map);
	}
	
	//펫시터회원상세추가정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception {
		System.out.println("selectPstMyInfoAddDetail DAO까지 들어왔음!!!");
		return (Map<String, Object>) selectOne ("myInfo.selectpstaddinfo",map);
	}
	
	
	//회원 프로필 정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProfileInfo(Map<String, Object> map) throws Exception {
		
		System.out.println("MyInfoDAO selectProfileInfo 진입");
		return (Map<String, Object>) selectOne("myInfo.selectProfileInfo",map);
	}
	
	
	
	//수정
	public void updateMyInfoModify(Map<String, Object> map) throws Exception {
		//펫시터 회원수정인경우
		if(map.get("MEM_TYPE").equals("펫시터"))
		{
			System.out.println("==============update DAO에서 펫시터구분 성공!!===============");
			update("myInfo.updatepstinfo",map);
			update("myInfo.updatepstaddinfo",map);
			//자격증파일없이 자격증 정보만 입력한 경우를 위해 파일관련 정보는 null로 처리
			map.put("PROFILE_ORIGINAL_FILE_NAME", "NULL");
			map.put("PROFILE_FILE_SIZE", 0);
			map.put("PROFILE_STORED_FILE_NAME", "NULL");
			update("myInfo.updatecertiinfo",map);
			
		}
		else update("myInfo.updatememinfo",map);
	}
	
	//프로필 수정
	public void updateProfile(Map<String, Object> map) throws Exception{
		update("myInfo.updateProfile", map);
	}
	
	//자격증 수정
	public void updateCertifile(Map<String, Object> map) throws Exception{
		update("myInfo.updatecertiinfo", map);
	}
	
	
	//회원 탈퇴
	public void deleteMyInfo(Map<String, Object> map) throws Exception {
		update("myInfo.deleteMember",map);
	}
	
	//나의 댕댕이 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("myInfo.selectmypet",map);
	}
	
	//프로필이미지 꺼내오기
	@SuppressWarnings("unchecked")
	public String selectProfile(Map<String, Object> map) throws Exception{
		
			return (String)((Map)selectOne("myInfo.selectProfile",map)).get("PROFILE_STORED_FILE_NAME");
	}
		
		//System.out.println("DAO selectProfile 함수 진입!!! MEM_TYPE은" + map.get("MEM_TYPE") +"PET_MEM_ID값은" + map.get("PET_MEM_ID"));
		/*if(map.get("MEM_TYPE").equals("펫시터") && map.get("PET_MEM_ID")==null)  //펫시터 프로필이미지 
		{	System.out.println("펫시터 이미지 프로필!!!!!!!!");
			return (String)((Map)selectOne("myInfo.selectPstProfile",map)).get("PROFILE_STORED_FILE_NAME");
		}else if(map.get("PET_MEM_ID")!= null) {//펫 프로필 이미지
			System.out.println("펫이미지 프로필!!!!!!!!");
			return (String)((Map)selectOne("myInfo.selectMemPetProfile",map)).get("PROFILE_STORED_FILE_NAME");
		
		}else //일반회원 프로필 이미지
			System.out.println("일반회원 이미지 프로필!!!!!!!!");
			return (String)((Map)selectOne("myInfo.selectMemProfile",map)).get("PROFILE_STORED_FILE_NAME");
		}*/
	
	//자격증정보 꺼내오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCertiInfo(Map<String, Object> map) throws Exception {
		System.out.println("selectCertiInfo DAO까지 들어왔음!!!");
		return (Map<String, Object>) selectOne ("myInfo.selectcertiinfo",map);
	}
	
	//위탁장소 첨부파일리스트 꺼내오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPstPlaceInfo(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("myInfo.selectPstPlaceList", map);
	}
	
	public void deleteFile(Map<String, Object> map) throws Exception{
		update("myInfo.deleteFile", map);
	}
	
	public void updateFile(Map<String, Object> map) throws Exception{
		update("myInfo.updateFile", map);
	}
	
	
} 
 
