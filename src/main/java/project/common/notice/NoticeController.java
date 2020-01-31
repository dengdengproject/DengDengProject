package project.common.notice;

import java.util.List;
import java.util.Map;


import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value="/noticeList")
	public ModelAndView noticeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/notice/notice");
		
		List<Map<String, Object>> noList = noticeService.selectBoardList(commandMap);
		mv.addObject("noList", noList);
		
		return mv;
	}
	
	@RequestMapping(value="/noticeWrite")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/notice/noticeWrite");
		
		return mv;
	}

}
