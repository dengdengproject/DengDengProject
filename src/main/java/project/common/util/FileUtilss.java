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

@Component("fileUtilss") 
public class FileUtilss { 
private static final String filePath ="C:\\dev\\file\\";
	
	public List<Map<String, Object>> parseInsertFileInfo(Map<String,Object>map, 
			HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;    //여기 주의
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		String boardIdx = (String)map.get("NOTICE_NO"); // 여기도 다시보기
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("BOARD_NO", boardIdx);
				listMap.put("BOARD_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("BOARD_STORED_FILE_NAME", storedFileName);
				listMap.put("BOARD_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
		
	}

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * private static final String filePath = "C:\\dev\\file\\";
	 * 
	 * public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map,
	 * HttpServletRequest request) throws Exception{ MultipartHttpServletRequest
	 * multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	 * Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	 * 
	 * MultipartFile multipartFile = null; String originalFileName = null; String
	 * originalFileExtension = null; String storedFileName = null;
	 * 
	 * 
	 * 
	 * List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	 * Map<String, Object> listMap = null;
	 * 
	 * String boardIdx = (String)map.get("NOTICE_NO");
	 * 
	 * File file = new File(filePath); if(file.exists() == false){ file.mkdirs(); }
	 * 
	 * while(iterator.hasNext()){ multipartFile =
	 * multipartHttpServletRequest.getFile(iterator.next());
	 * if(multipartFile.isEmpty() == false){ originalFileName =
	 * multipartFile.getOriginalFilename(); originalFileExtension =
	 * originalFileName.substring(originalFileName.lastIndexOf(".")); storedFileName
	 * = CommonUtils.getRandomString() + originalFileExtension;
	 * 
	 * file = new File(filePath + storedFileName); multipartFile.transferTo(file);
	 * 
	 * listMap = new HashMap<String,Object>(); listMap.put("BOARD_NO", boardIdx);
	 * listMap.put("BOARD_ORIGINAL_FILE_NAME", originalFileName);
	 * listMap.put("BOARD_STORED_FILE_NAME", storedFileName);
	 * listMap.put("BOARD_FILE_SIZE", multipartFile.getSize()); list.add(listMap); }
	 * } return list; }
	 */
	


