package kr.ac.sunmoon.clms.swlicense;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
public class SWLicenseController {
	@Autowired
	private SWLicenseInfoService swLicenseInfoService;
	
	@GetMapping("/swlicense")
	public ModelAndView viewSWLicenseList() {
		return new ModelAndView("/swlicense/list");
	}
	
	@GetMapping(value = "/swlicense", consumes = MediaType.APPLICATION_JSON_VALUE)	
	public List<SWLicense> viewSWLicense(SWLicense swLicense) {
		return this.swLicenseInfoService.list(swLicense);
	}
	
	@GetMapping("/swlicense/form")
	public ModelAndView addSWLicense() {
		return new ModelAndView("/swlicense/add");
	}
	
	@PostMapping("/swlicense")
	public ModelAndView addSWLicense(SWLicense swLicense) {
		boolean isResult = this.swLicenseInfoService.register(swLicense);
		if (isResult) {
			return new ModelAndView(new RedirectView("/swlicense"));
		} else {
			return new ModelAndView(new RedirectView("/swlicense/form"));
		}
	}
	
	@GetMapping("/swlicense/{swLicenseNo}/form")
	public ModelAndView editSWLicense(@PathVariable("swLicenseNo") int no) {
		ModelAndView mav = new ModelAndView("/swlicense/edit");
		SWLicense swLicense = this.swLicenseInfoService.view(no);
		
		System.out.println(swLicense.getContractDate() + "" + swLicense.getExpiryDate());
		
		mav.addObject("swLicense", swLicense);
		
		return mav;
	}
	
	@PutMapping("/swlicense")
	public ModelAndView editSWLicense(SWLicense swLicense) {
		boolean isResult = swLicenseInfoService.modify(swLicense);
		if (isResult) {	
			return new ModelAndView(new RedirectView("/swlicense"));
		} else {
			return new ModelAndView(new RedirectView("/swlicense/"+ swLicense.getNo() +"/form"));
		}
	}
	
	@DeleteMapping("/swlicense")
	public ModelAndView removeSWLicense(int no) {
		this.swLicenseInfoService.remove(no);
		return new ModelAndView(new RedirectView("/swlicense"));
	}
}