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

import project.common.join.JoinDAO;
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

	@Override
	public void insertPstAdd(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPstAdd(map);
		
		

		
		 List<Map<String,Object>> list = fileUtils.parseInsertPesiterImage(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertPstAddImg(list.get(i));
			 
		 }

		 
		 
	}

	@Override
	public void petRegist(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPet(map);
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
