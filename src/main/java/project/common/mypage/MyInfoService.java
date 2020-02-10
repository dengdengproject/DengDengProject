package project.common.mypage;


import java.util.List;
import java.util.Map;

public interface MyInfoService {

	Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception;
	void updateMyInfoModify(Map<String, Object> map) throws Exception;
	int deleteMyInfo(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception; //나의 펫리스트 불러오기.
	
	//프로필 사진꺼내기
	String selectProfile(Map<String, Object> map) throws Exception;
}

  