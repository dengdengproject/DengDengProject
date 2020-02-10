package project.common.login;

import java.util.Map;

public interface LoginService {
	
	//로그인 : 호석
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;
	
	//지연: 비번찾기 DAO
	public Map<String, Object> findId(Map<String, Object> map) throws Exception;
	
	//지연: 비번찾기 DAO
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception;

} 
 
