package project.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{ 

	/*@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.selectId", map); 
	}*/
	
	//지연: 아이디찾기 DAO
	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findId", map);
	}
	
	//지연: 비번찾기 DAO 
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findPw", map);
	}
	
	
    /*
	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findIdWithEmail", map);
	}

	public int selectEmailCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (int)selectOne("login.selectEmailCheck",map);
	}

	public void updateTempPw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("login.updateTempPw",map);
	}
      */

}
