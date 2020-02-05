package project.common.mypage;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import project.common.dao.AbstractDAO;

@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO {

	//보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectmyinfo",map);
	}
	//수정폼
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyInfoDetail1(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.insertmyinfo",map);
	}
	//수정
	public void updateMyInfoModify(Map<String, Object> map) throws Exception {
		update("myInfo.insertmyinfo",map);
	}
	//회원 탈퇴
	public void deleteMyInfo(Map<String, Object> map) throws Exception {
		update("myInfo.deleteMember",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyPet(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectList ("myInfo.selectmypet",map);
	}
	

} 
 