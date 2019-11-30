package kr.ac.sunmoon.clms.swlicense;

import java.io.Serializable;
import java.sql.Date;

public class SWLicense implements Serializable {
	private static final long serialVersionUID = 1L;

	private int no;
	private String swName;
	private Date contractDate;
	private Date expiryDate;
	private int copies;
	private String useLabNo;
	private String authenticationCode;
	private String contractDept;
	private String contractName;
	private String contractPhone;
	private String supplierName;
	private String supplierContactName;
	private String supplierContactPhone;
	private String note;

	public SWLicense() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSwName() {
		return swName;
	}

	public void setSwName(String swName) {
		this.swName = swName;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public int getCopies() {
		return copies;
	}

	public void setCopies(int copies) {
		this.copies = copies;
	}

	public String getUseLabNo() {
		return useLabNo;
	}

	public void setUseLabNo(String useLabNo) {
		this.useLabNo = useLabNo;
	}

	public String getAuthenticationCode() {
		return authenticationCode;
	}

	public void setAuthenticationCode(String authenticationCode) {
		this.authenticationCode = authenticationCode;
	}

	public String getContractDept() {
		return contractDept;
	}

	public void setContractDept(String contractDept) {
		this.contractDept = contractDept;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}

	public String getContractPhone() {
		return contractPhone;
	}

	public void setContractPhone(String contractPhone) {
		this.contractPhone = contractPhone;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierContactName() {
		return supplierContactName;
	}

	public void setSupplierContactName(String supplierContactName) {
		this.supplierContactName = supplierContactName;
	}

	public String getSupplierContactPhone() {
		return supplierContactPhone;
	}

	public void setSupplierContactPhone(String supplierContactPhone) {
		this.supplierContactPhone = supplierContactPhone;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
}