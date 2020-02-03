package project.common.join;

import java.util.Iterator;
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.common.join.JoinDAO;
import project.common.util.FileUtils;

@Service("joinService")
public class JoinServiceImpl implements JoinService{

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="fileUtils") 
	private FileUtils fileUtils;
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public String selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(map);
	}
	
	
	 @Override public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception
	 { // TODO Auto-generated method stub 
		 joinDAO.insertMember(map); 
		 
		MultipartHttpServletRequest multipartHttpServletRequest =			
		 (MultipartHttpServletRequest)request; 
		 Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		 MultipartFile multipartFile = null; 
		 System.out.println("-------------insertMember()실행중----------------");
		 while(iterator.hasNext()){ 
			 multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			 if(multipartFile.isEmpty() == false){ 
				 log.debug("------------- file start -------------"); 
				 log.debug("name : "+multipartFile.getName()); 
				 log.debug("filename : "+multipartFile.getOriginalFilename()); 
				 log.debug("size : "+multipartFile.getSize()); 
				 log.debug("-------------- file end --------------\n"); 
				 } 
			 } 
		
		 
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			
			 joinDAO.insertFile(list.get(i));
			 
		 }
	}

		
		

}
		
	


 