package project.common.join;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface JoinService {

	String selectIdCheck(Map<String, Object> map) throws Exception;

	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void petRegist(Map<String, Object> map) throws Exception;

//	void verifyMember(Map<String, Object> map) throws Exception;

//	int selectNickCheck(Map<String, Object> map) throws Exception;

}
 