package project.common.admin;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO { 

	//관리자 로그인 : 호석
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminSelectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("adminSql.adminLogin", map);
	}
}
