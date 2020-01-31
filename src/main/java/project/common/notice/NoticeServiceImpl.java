package project.common.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		
		return noticeDAO.selectBoardList(map);
	}
	
	

}
