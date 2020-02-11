package project.common.admin;

import java.util.Map;

public interface AdminService {
	
	//관리자 로그인 : 호석
	public Map<String, Object> adminLoginCheck(Map<String, Object> map) throws Exception;
} 
