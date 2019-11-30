package kr.ac.sunmoon.clms.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sunmoon.clms.account.Account;
import kr.ac.sunmoon.clms.account.AccountMapper;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public boolean login(Account account) {
		Account user = this.accountMapper.select(account.getId());

		boolean isSuccess = false;
		if (user != null 
				&& user.getPassword().equals(account.getPassword())) {
			isSuccess = true;
		}

		return isSuccess;
	}

	@Override
	public boolean loginCheck(Account account) {
		Account user = this.accountMapper.select(account.getId());
		if (user != null && account.getPassword().equals(user.getPassword())) {
			return true;
		} else {
			return false;
		}
	}
}
