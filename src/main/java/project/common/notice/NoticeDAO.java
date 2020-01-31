package project.common.notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		
		return (List<Map<String, Object>>)selectList("notice.selectBoardList", map);
	}

}
