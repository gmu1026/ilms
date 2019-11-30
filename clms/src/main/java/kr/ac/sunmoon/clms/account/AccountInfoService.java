package kr.ac.sunmoon.clms.account;

import java.util.List;

public interface AccountInfoService {
	public List<Account> list(Account account);	
	public boolean register(Account account, String rePassword);
	public boolean modify(Account account, String rePassword);
	public boolean remove(String id);
	public boolean isDuplicationById(String id);
	public Account view(String id);
}