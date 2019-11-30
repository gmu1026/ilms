package kr.ac.sunmoon.clms.changenotice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
@RestController
public class ChangeNoticeController {
	@Autowired
	private ChangeNoticeService changeNoticeService;
	
	@GetMapping("/changenotice")
	public ModelAndView viewChangeNoticeList() {
		ModelAndView mav = new ModelAndView("/changenotice/list");
		mav.addObject("computerNames", this.changeNoticeService.computerNameList());
		mav.addObject("swNames", this.changeNoticeService.swNameList());
		
		return mav;
	}
	
	@GetMapping(value = "/changenotice", consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<ChangeNotice> viewChangeNoticeList(String division) {
			return this.changeNoticeService.listDivision(division);
	}
	
	@GetMapping("/changenotice/{no}/form")
	public ModelAndView editChangeNotice(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView("/changenotice/edit");
		
		changeNoticeService.editCheck(no);
		
		mav.addObject("changenotice",changeNoticeService.view(no));
		
		return mav;
	}
	
	@PutMapping("/changenotice")
	public ModelAndView editChangeNotice(ChangeNotice changeNotice) {
		this.changeNoticeService.modify(changeNotice);
		
		return new ModelAndView(new RedirectView("/changenotice"));
	}

	@GetMapping(value = "/changenotice/check", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Integer> checkCount() {
              Map<String, Integer> result = new HashMap<String, Integer>();
              result.put("count",  this.changeNoticeService.check());
              
              return result;
	}
}
