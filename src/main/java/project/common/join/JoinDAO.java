package project.common.join;

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
	
	public void insertFile(Map<String, Object> map)throws Exception{
		System.out.println("-----------joinDAO.insertFile()실행중--------------");
		insert("join.insertMemFile",map);
	}
	
	public void insertPet(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertPet",map);
	}
	
	public void insertPetAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertPetAdd",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPetMemId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("join.selectPetMemId", map);
	}
	

} 
