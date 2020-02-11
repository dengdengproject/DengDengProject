package project.common.mypet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.util.FileUtils;

@Service("mypetService")
public class MyPetServiceImpl implements MyPetService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "mypetDAO") // Service에서 데이터 접근을 위한 DAO객체를 선언함
	private MyPetDAO mypetDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return mypetDAO.selectBoardList(map);
		// Service의 selectQnaList의 결과값으로 mypetDAO클래스의 selectQnaList() 호출 후 그 결과값을
		// return함
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		/*
		 * List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 * for(int i=0, size=list.size(); i<1; i++) { String[] sungi = list.get(i);
		 * map.put("", sungi); }
		 */

		mypetDAO.insertBoard(map);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo_board(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			mypetDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		// System.out.println("list");
		mypetDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = mypetDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String, Object>> list = mypetDAO.selectFileList(map); // 파일을 리스트로 저장했기 때문에 Detail.jsp에서 map이 아닌 list로
																		// 써서 데이터를 가져온다 ex ${list.blahblah}
		resultMap.put("list", list);
		/* 댓글 */ List<Map<String, Object>> cmtList = mypetDAO.selectCmtList(map);
		resultMap.put("cmtList", cmtList); // 댓글
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		mypetDAO.updateBoard(map);
		
		mypetDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				mypetDAO.insertFile(tempMap);
			}
			else{
				mypetDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		mypetDAO.deleteBoard(map);
	}

	@Override
	public List<Map<String, Object>> mypetSearch(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypetDAO.mypetSearch(map);
	}

	@Override
	public void insertComment(Map<String, Object> map) throws Exception {
		mypetDAO.insertComment(map);

	}

	@Override
	public void deleteComment(Map<String, Object> map) throws Exception {
		mypetDAO.deleteComment(map);

	}

	@Override
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
		
		return mypetDAO.selectMemInfo(map)	;
	}
	
	

	

}
