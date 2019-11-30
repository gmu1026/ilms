package kr.ac.sunmoon.clms.computer;

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
public class ComputerController {
	@Autowired
	private ComputerInfoService computerInfoService;

	@GetMapping("/computer")
	public ModelAndView viewComputerList() {
		return new ModelAndView("/computer/list");
	}

	@GetMapping(value = "/computer", consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Computer> viewComputerList(Computer computer) {
		return this.computerInfoService.list(computer);
	}

	@GetMapping("/computer/{no}/form")
	public ModelAndView editComputer(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView("/computer/edit");
		mav.addObject("computer",computerInfoService.view(no));	

		return mav;
	}

	@PostMapping("/computer/reg")
	public void addComputer(@RequestBody Computer computer) {
		System.out.println(computer);
		
		computerInfoService.register(computer);
	}

	@PutMapping("/computer")
	public ModelAndView editComputer(Computer computer) {
		this.computerInfoService.modify(computer);
		return new ModelAndView(new RedirectView("/computer"));
	}

	@DeleteMapping("/computer/{no}")
	public ModelAndView removeComputer(@PathVariable("no") int no) {
		this.computerInfoService.remove(no);

		return new ModelAndView(new RedirectView("/computer"));
	}
}