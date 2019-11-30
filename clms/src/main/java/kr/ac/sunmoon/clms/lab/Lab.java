package kr.ac.sunmoon.clms.lab;

import java.io.Serializable;

public class Lab implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String managementDeptName;
	private String useDeptName;
	private String usage;
	private int equipmentCount;
	
	public Lab() {
		
	}
	
	public Lab(int no, String managementDeptName, String useDeptName, String usage, int equipmentCount) {
		this.no = no;
		this.managementDeptName = managementDeptName;
		this.useDeptName = useDeptName;
		this.usage = usage;
		this.equipmentCount = equipmentCount;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getManagementDeptName() {
		return managementDeptName;
	}
	
	public void setManagementDeptName(String managementDeptName) {
		this.managementDeptName = managementDeptName;
	}
	
	public String getUseDeptName() {
		return useDeptName;
	}
	
	public void setUseDeptName(String useDeptName) {
		this.useDeptName = useDeptName;
	}
	
	public String getUsage() {
		return usage;
	}
	
	public void setUsage(String usage) {
		this.usage = usage;
	}
	
	public int getEquipmentCount() {
		return equipmentCount;
	}
	
	public void setEquipmentCount(int equipmentCount) {
		this.equipmentCount = equipmentCount;
	}
}
