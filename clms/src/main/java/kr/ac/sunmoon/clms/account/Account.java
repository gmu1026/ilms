package kr.ac.sunmoon.clms.account;

import java.io.Serializable;

public class Account implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String name;
	private int extensionNo;
	private String authority;
	
	public Account() {
		
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getExtensionNo() {
		return extensionNo;
	}
	
	public void setExtensionNo(int extensionNo) {
		this.extensionNo = extensionNo;
	}
	
	public String getAuthority() {
		return authority;
	}
	
	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
