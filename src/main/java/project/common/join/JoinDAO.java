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
	
	//일반 회원가입
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertMember",map);
	}
	
	//펫시터 회원가입
	public void insertPst(Map<String, Object> map) throws Exception {

		insert("join.insertPst", map);
		
	}
	
	//펫시터 추가정보 입력
	public void insertPstAdd(Map<String, Object> map) throws Exception {

		insert("join.insertPstAdd", map);
		
	}
	
	public void insertPet(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertPet",map);
	}
	
	
	//펫시터 이미지 파일 추가
	public void insertPstImage(Map<String, Object> map)throws Exception{
		System.out.println("-----------joinDAO.insertFile()실행중--------------");
		insert("join.insertMemFile",map);
	}
	
	
	//펫시터 위탁장소 이미지
	public void insertPstAddImg(Map<String, Object> map)throws Exception{
		System.out.println("-----------joinDAO.insertPstAddImg()실행중--------------");
		insert("join.insertAddFile",map);
	}
	
	//펫시터 댕댕이 등록을 위한 ID 가져오기
	public Map<String, Object> selectPstId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("join.selectPetMemId",map);
		
	}
	

} 
