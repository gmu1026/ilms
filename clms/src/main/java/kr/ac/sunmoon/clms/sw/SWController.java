package kr.ac.sunmoon.clms.sw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class SWController {
	@Autowired
	private SWInfoService swInfoService;

	@GetMapping("/sw")
	public ModelAndView viewSWList() {
		return new ModelAndView("/sw/list"); 
	}

	@GetMapping(value = "/sw", consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Software> viewSWList(Software software) {
		return this.swInfoService.list(software);
	}

	@GetMapping("/sw/form")
	public ModelAndView addSW() {
		return new ModelAndView("/sw/add");
	}

	@PostMapping("/sw")
	public ModelAndView addSW(Software software) {
		boolean isResult = this.swInfoService.register(software);
		if (isResult) {
			return new ModelAndView(new RedirectView("/sw"));
		} else {
			return new ModelAndView(new RedirectView("/sw/form"));
		}
	}

	@GetMapping("/sw/{swNo}/form")
	public ModelAndView editSW(@PathVariable("swNo") int no) {
		ModelAndView mav = new ModelAndView("/sw/edit");
		Software software = this.swInfoService.view(no);
		
		mav.addObject("sw", software);

		return mav;
	}

	@PutMapping("/sw")
	public ModelAndView editSW(Software software) {
		boolean isResult = swInfoService.modify(software);
		if (isResult) {	
			return new ModelAndView(new RedirectView("/sw"));
		} else {
			return new ModelAndView(new RedirectView("/sw"+ software.getNo() +"/form"));
		}
	}

	@DeleteMapping("/sw/{swNo}")
	public ModelAndView removeSW(@PathVariable("swNo") int no) {
		this.swInfoService.remove(no);
		return new ModelAndView(new RedirectView("/sw"));
	}
}