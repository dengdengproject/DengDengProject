package project.common.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;

	@Override
	public Map<String, Object> adminLoginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminSelectId(map);
	}
}
