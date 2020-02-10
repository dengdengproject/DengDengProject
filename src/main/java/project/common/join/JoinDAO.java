package project.common.join;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;


@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {

	//지연: 아이디 꺼내오기
	public String selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		// return (String)selectOne("join.selectIdCheck",map);
		if (((Map) selectOne("join.selectIdCheck", map)) == null) {
			return null;
		} else {
			return (String) ((Map) selectOne("join.selectIdCheck", map)).get("ID");
		}
	}

	//지연:일반회원 회원가입 정보저장
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertMember", map);
	}

	//지연: 일반회원 프로필 파일 저장
	public void insertMemFile(Map<String, Object> map) throws Exception {
		System.out.println("-----------joinDAO.insertFile()실행중--------------");
		insert("join.insertMemFile", map);
	}

	
	
	// 펫시터 회원가입
	public void insertPst(Map<String, Object> map) throws Exception {

		insert("join.insertPst", map);

	}

	// 펫시터 추가정보 입력
	public void insertPstAdd(Map<String, Object> map) throws Exception {

		insert("join.insertPstAdd", map);

	}

	//지연 :반려견 프로필 파일저장
	public void insertPet(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertPet", map);
	}

	// 펫시터 이미지 파일 추가
	public void insertPstImage(Map<String, Object> map) throws Exception {
		System.out.println("-----------joinDAO.insertFile()실행중--------------");
		insert("join.insertPstFile", map);
	}

	// 펫시터 위탁장소 이미지
	public void insertPstAddImg(Map<String, Object> map) throws Exception {
		System.out.println("-----------joinDAO.insertPstAddImg()실행중--------------");
		insert("join.insertAddFile", map);
	}

	// 펫시터 자격증 이미지
	public void insertLicense(Map<String, Object> map) throws Exception {
		System.out.println("-----------joinDAO.insertLicense()실행중--------------");
		insert("join.insertLicense", map);
	}

	// 펫시터 댕댕이 등록을 위한 ID 가져오기
	public Map<String, Object> selectPstId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("join.selectPetMemId", map);

	}
	

	//지연 : 반려견 추가정보 저장
	public void insertPetAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertPetAdd",map);
	}
		
	//지연 : 반려견 ID꺼내오기 
		@SuppressWarnings("unchecked")
		public String selectPetMemId(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return (String)((Map)selectOne("join.selectPetMemId", map)).get("PET_MEM_ID");
		}
		
	
	
	
	

}
