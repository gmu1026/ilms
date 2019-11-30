package kr.ac.sunmoon.clms.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AccountInfoServiceImpl implements AccountInfoService {
	@Autowired
	private AccountMapper accountMapper;
	
	@Override
	public List<Account> list(Account account) {
		return this.accountMapper.selectAll(account);
	}

	@Override
	public boolean register(Account account, String rePassword) {
		boolean isSuccess =  false;
		if (account.getId() != null 
				&& !account.getId().equals("") 
				&& account.getPassword() != null
				&& account.getName() != null
				&& account.getExtensionNo() != 0
				&& account.getAuthority() != null) {
			Account user = this.accountMapper.select(account.getId());
			if (user == null) {
				if (account.getPassword().equals(rePassword)) {
					isSuccess = true;
					
					this.accountMapper.insert(account);
				} else {
					isSuccess = false;
				}
			} 
		}
		
		return isSuccess;
	}

	@Override
	public boolean modify(Account account, String rePassword) {
		boolean isSuccess = false;
		if (account.getPassword() != null 
				&& account.getName() != null
				&& account.getExtensionNo() != 0
				&& account.getAuthority() != null) {
			if (account.getPassword().equals(rePassword)) {
				isSuccess = true;
				
				this.accountMapper.update(account);
			} 
		}
		
		return isSuccess;
	}

	@Override
	public boolean remove(String id) {
		boolean isSuccess = false;
		
		if (id != null 
				&& !"".equals(id)) {
			this.accountMapper.delete(id);
			
			isSuccess = true;
			
			return isSuccess;
		}
		
		return isSuccess;
	}
	
	@Override
	public boolean isDuplicationById(String id) {
		return this.accountMapper.checkId(id) > 0 ? true : false;
	}
	
	@Override
	public Account view(String id) {
		return this.accountMapper.select(id);
	}
}
