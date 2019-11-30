package kr.ac.sunmoon.clms.changenotice;

import java.io.Serializable;
import java.sql.Date;

public class ChangeNotice implements Serializable {
	private static final long serialVersionUID = 1L;

	private int no;
	private int swLicenseNo;
	private int computerNo;
	private Date registeredDate;
	private String contents;
	private String checked;
	private String division; 
	private String note;
	private String swName;
	private String computerName;
	
	public ChangeNotice() {
		
	}

	public String getSwName() {
		return swName;
	}

	public void setSwName(String swName) {
		this.swName = swName;
	}

	public String getComputerName() {
		return computerName;
	}

	public void setComputerName(String computerName) {
		this.computerName = computerName;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public Date getRegisteredDate() {
		return registeredDate;
	}
	
	public int getSwLicenseNo() {
		return swLicenseNo;
	}

	public void setSwLicenseNo(int swLicenseNo) {
		this.swLicenseNo = swLicenseNo;
	}

	public int getComputerNo() {
		return computerNo;
	}

	public void setComputerNo(int computerNo) {
		this.computerNo = computerNo;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getChecked() {
		return checked;
	}
	
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	public String getDivision() {
		return division;
	}
	
	public void setDivision(String division) {
		this.division = division;
	}
	
	public String getNote() {
		return note;
	}
	
	public void setNote(String note) {
		this.note = note;
	}
}
