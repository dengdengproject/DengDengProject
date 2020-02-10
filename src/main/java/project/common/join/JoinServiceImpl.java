package project.common.join;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.common.util.FileUtils;


@Service("joinService")
public class JoinServiceImpl implements JoinService {

	Logger log = Logger.getLogger(this.getClass());
 
	@Resource(name="fileUtils") 
	private FileUtils fileUtils;
	
	
	@Resource(name = "joinDAO")
	private JoinDAO joinDAO;

	@Override
	public String selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(map);
	}

	 @Override public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception
	 { // TODO Auto-generated method stub 
		 joinDAO.insertMember(map); 
		 
		 
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo_MEM(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			
			 joinDAO.insertMemFile(list.get(i));
			 
		 }
	}

	@Override
	public void insertPst(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPst(map);

		
		
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertPstImage(list.get(i));
			 
		 }

	}

	@Override  //첫번째 펫시터 추가정보등록 
	public void insertPstAdd(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPstAdd(map);
		
		//자격증파일 등록
		List<Map<String,Object>> list = fileUtils.parseInsertCerti(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertCerti(list.get(i));
		
		 }		 
		 
	}
	
	@Override  //두번째 펫시터 추가정보(위탁장소, 자기소개) 등록
	public void insertPstAdd2(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPstAdd2(map);
		
		//위탁장소 이미지 등록
		List<Map<String,Object>> list = fileUtils.parseInsertPlace(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertPstPlaceImg(list.get(i));
		
		 }

		 
		 
	}

	
	
//댕댕이 등록
	 @Override public void petRegist(Map<String, Object> map, HttpServletRequest request) throws Exception
	 { // TODO Auto-generated method stub 
		 joinDAO.insertPet(map); 
		 
		//PET_MEM_ID를 DB에서 꺼내오기
		 String pet_mem_id= joinDAO.selectPetMemId(map);
		//PET_MEM_ID를 DB에서 꺼내오기
		 System.out.println("PET_MEM_ID는" +pet_mem_id);
		//꺼내온 아이디값을 map에 넣어준다. 
		map.put("PET_MEM_ID", pet_mem_id);
		
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo_PET(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			 joinDAO.insertPetFile(list.get(i));
			 
		 }
}

	@Override
	public Map<String, Object> getPstId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectPstId(map);

	}
	
	@Override
	public void petRegistAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPetAdd(map);
	}


	@Override
	public String getPetMemId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectPetMemId(map);
		
	} 
	
	

}
