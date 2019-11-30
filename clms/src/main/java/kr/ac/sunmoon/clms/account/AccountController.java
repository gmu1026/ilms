package kr.ac.sunmoon.clms.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class AccountController {
	@Autowired
	private AccountInfoService accountInfoService;

	@GetMapping("/account")
	public ModelAndView viewAccountList() {
		ModelAndView mav = new ModelAndView("/account/list");
		
		return mav;
	}

	@GetMapping("/account/form")
	public ModelAndView addAccount() {
		return new ModelAndView("/account/add");
	}

	@GetMapping(value = "/account/check", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> isDuplication(@RequestParam("id") String id) {
		Map<String, Object> result = new HashMap<String, Object>();

		if (this.accountInfoService.isDuplicationById(id)) {
			result.put("duplication", "true");
		} else {
			result.put("duplication", "false");
		}

		return result;
	}

	@GetMapping(value = "/account", consumes = MediaType.APPLICATION_JSON_VALUE)
	public List<Account> searchAccount(Account account) {
		return this.accountInfoService.list(account);
	}
	
	@PostMapping("/account")
	public ModelAndView addAccount(Account account, String rePassword) {
		boolean isSuccess = this.accountInfoService.register(account, rePassword);
		if (isSuccess) {
			return new ModelAndView(new RedirectView("/account"));
		} else {
			return new ModelAndView(new RedirectView("/account/form"));
		}
	}

	@GetMapping("/account/{id}/form")
	public ModelAndView editAccount(@PathVariable("id") String id) {
		ModelAndView mav = new ModelAndView("/account/edit");

		mav.addObject("account", this.accountInfoService.view(id));

		return mav;
	}

	@PutMapping("/account")
	public ModelAndView editAccount(Account account, @RequestParam("rePassword") String rePassword) {
		boolean isSuccess = this.accountInfoService.modify(account, rePassword);
		if (isSuccess) {
			return new ModelAndView(new RedirectView("/account"));
		} else {
			return new ModelAndView(new RedirectView("/account/" + account.getId() + "/form"));
		}
	}

	@DeleteMapping("/account")
	public ModelAndView removeAccount(String id) {
		this.accountInfoService.remove(id);

		return new ModelAndView(new RedirectView("/account"));
	}
}