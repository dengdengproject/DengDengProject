package project.common.service;

import java.util.Map;

public interface LoginService {

	//public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	//지연: 비번찾기 DAO
	public Map<String, Object> findId(Map<String, Object> map) throws Exception;
	
	//지연: 비번찾기 DAO
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception;

	//public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception;

	//public int selectEmailCheck(Map<String, Object> map) throws Exception;

	//public void updateTempPw(Map<String,Object> map) throws Exception;

} 
