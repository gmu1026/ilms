package kr.ac.sunmoon.clms.account;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {
	public List<Account> selectAll(Account account);
	public Account select(String id);
	public void insert(Account account);
	public void update(Account account);
	public void delete(String id);
	public int checkId(String id);
}
