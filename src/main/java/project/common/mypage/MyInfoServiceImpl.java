package project.common.mypage;
import java.util.Map;
import java.util.List;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.login.LoginDAO;
import project.common.mypage.MyInfoDAO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="myInfoDAO")
	private MyInfoDAO myInfoDAO;
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception {
	return myInfoDAO.selectMyInfoDetail(map);
	}
	
	@Override
	public void updateMyInfoModify(Map<String, Object> map) throws Exception {
		myInfoDAO.updateMyInfoModify(map);
	}
	@Override
	public int deleteMyInfo(Map<String, Object> map) throws Exception {
		int res;
		Map<String,Object> member = loginDAO.selectId(map);
		if(member.get("PASSWORD1").equals(map.get("PASSWORD1"))){
			myInfoDAO.deleteMyInfo(map);
			res = 1;
		}else {
			res = 0;
		}
		return res;
	}

	@Override  //회원의 마이펫리스트 불러오기
	public List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectMyPetList(map);
	}

	@Override  //프로필 사진 꺼내오기
	public String selectProfile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return  myInfoDAO.selectProfile(map);
	}
	
	
	
		
}  