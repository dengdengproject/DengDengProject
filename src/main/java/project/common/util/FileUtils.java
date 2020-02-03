package project.common.util;

import java.io.File; 
import java.util.ArrayList; 
import java.util.HashMap; 
import java.util.Iterator; 
import java.util.List; 
import java.util.Map; 
import javax.servlet.http.HttpServletRequest; 
import org.springframework.stereotype.Component; 
import org.springframework.web.multipart.MultipartFile; 
import org.springframework.web.multipart.MultipartHttpServletRequest; 

@Component("fileUtils") public class FileUtils { 
	
	private static final String filePath = "C:\\dev\\file\\"; 
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{ 
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		//String boardIdx = (String)map.get("IDX");
		String mem_id = (String)map.get("MEM_ID");
		File file = new File(filePath); 
		
		 //파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성
		if(file.exists() == false){ 
			file.mkdirs(); 
			} 
		
		while(iterator.hasNext()){ 
			
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			
			if(multipartFile.isEmpty() == false){ 
				//파일의 정보를 받아서 새로운 이름으로 변경하는 부분
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				
				
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName); 
				multipartFile.transferTo(file); 
				listMap = new HashMap<String,Object>(); 
				listMap.put("MEM_ID", mem_id); 
				listMap.put("PROFILE_ORIGINAL_FILE_NAME", originalFileName); 
				listMap.put("PROFILE_STORED_FILE_NAME", storedFileName); 
				listMap.put("PROFILE_FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
				} 
			} return list; 
		} 
	}
