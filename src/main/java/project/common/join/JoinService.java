package project.common.join;

import java.util.Map;

public interface JoinService {

	String selectIdCheck(Map<String, Object> map) throws Exception;

	void insertMember(Map<String, Object> map) throws Exception;

//	void verifyMember(Map<String, Object> map) throws Exception;

//	int selectNickCheck(Map<String, Object> map) throws Exception;

}
 