package project.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;


@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	public String selectIdCheck(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		//return (String)selectOne("join.selectIdCheck",map);
		if(((Map)selectOne("join.selectIdCheck",map))==null) {
			return null;
		}else {
			return (String)((Map)selectOne("join.selectIdCheck",map)).get("ID");
		}
	}
	
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertMember",map);
	}
	
	

} 
