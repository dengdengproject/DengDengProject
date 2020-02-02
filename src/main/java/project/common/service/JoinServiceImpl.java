package project.common.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public String selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(map);
	}
	
	
	 @Override public void insertMember(Map<String, Object> map) throws Exception
	 { // TODO Auto-generated method stub 
		 joinDAO.insertMember(map); 
	 }
		
	

}
 