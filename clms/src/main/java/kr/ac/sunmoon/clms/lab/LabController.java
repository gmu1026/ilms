package kr.ac.sunmoon.clms.lab;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class LabController {
	@Autowired
	private LabInfoService labInfoService;

	@GetMapping("/lab")
	public ModelAndView viewLabList() {
		return new ModelAndView("/lab/list");
	}

	@GetMapping(value = "/lab", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Lab> viewLabList(Lab lab) {
		return this.labInfoService.list(lab);
	}

	@GetMapping("/lab/form")
	public ModelAndView addLab() {
		return new ModelAndView("/lab/add");
	}

	@PostMapping("/lab")
	public ModelAndView addLab(Lab lab) {
		this.labInfoService.register(lab);
		return new ModelAndView(new RedirectView("/lab"));
	}

	@GetMapping("/lab/add/check")
	public int labNoCheck(@RequestParam("no") int no) {
		return labInfoService.check(no);
	}

	@GetMapping(value = "/lab/{no}/form")
	public ModelAndView editLab(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView("/lab/edit");
		mav.addObject("lab", this.labInfoService.view(no));
		return mav;
	}

	@PutMapping("/lab")
	public ModelAndView editLab(Lab lab) {
		this.labInfoService.modify(lab);
		return new ModelAndView(new RedirectView("/lab"));
	}

	@DeleteMapping("/lab/{no}")
	public ModelAndView removeLab(@PathVariable("no") int no) {
		this.labInfoService.remove(no);
		return new ModelAndView(new RedirectView("/lab"));
	}
}