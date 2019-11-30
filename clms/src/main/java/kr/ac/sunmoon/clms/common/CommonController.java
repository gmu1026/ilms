package kr.ac.sunmoon.clms.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.ac.sunmoon.clms.account.Account;

@RestController
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	@GetMapping("/login")
	public ModelAndView login(HttpSession session) {
		Object obj = session.getAttribute("isLogin");
		if (obj != null) {
			return new ModelAndView(new RedirectView("/changenotice"));
		}
		return new ModelAndView("/common/login");
	}
	
	@PostMapping("/login")
	public ModelAndView login(HttpSession session, Account account, RedirectAttributes redirectAttributes) {
		boolean isSuccess = this.commonService.login(account);
		if (isSuccess) {
			session.setAttribute("isLogin", account.getId());
			if ("administrator".equals(account.getId())) {
				session.setAttribute("authority", "A");
			} else {
				session.setAttribute("authority", "M");
			}
			
			return new ModelAndView(new RedirectView("/changenotice"));
		} else {
			ModelAndView mav = new ModelAndView(new RedirectView("/login"));
			redirectAttributes.addFlashAttribute("msg", "가입하지 않은 아이디이거나 잘못된 비밀번호입니다.");
			
			return mav;
		}
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		if (session.getAttribute("isLogin") != null) {
			session.invalidate();
		}
		
		return new ModelAndView(new RedirectView("/login"));
	}
	
}
