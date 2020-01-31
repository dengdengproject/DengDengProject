package project.common.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO { 

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("loginSql.selectId", map);
	}

	/*
	 * @SuppressWarnings("unchecked") public Map<String, Object>
	 * findIdWithPhone(Map<String, Object> map) throws Exception{ // TODO
	 * Auto-generated method stub return (Map<String, Object>)
	 * selectOne("login.findIdWithPhone", map); }
	 */

}
