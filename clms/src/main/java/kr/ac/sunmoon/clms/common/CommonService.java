package kr.ac.sunmoon.clms.common;

import kr.ac.sunmoon.clms.account.Account;

public interface CommonService {
	public boolean login(Account account);
	public boolean loginCheck(Account account);
}
