package project.common.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

}
