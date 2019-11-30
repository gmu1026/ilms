package kr.ac.sunmoon.clms.computer;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Computer implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int laboratoryNo;
	private String name;
	private String ipAddress;
	private Date specRegDate;
	private String cpu;
	private String ram;
	private String vga;
	private String storage;
	
	@Override
	public String toString() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		Calendar time = Calendar.getInstance();
		
		return "==================================================\r\n" + 
				" #01 "+ format.format(time.getTime()) +" (["+ name +"] "+ ipAddress +")							\r\n" + 
				"--------------------------------------------------\r\n" + 
				"	CPU : "+ cpu +"										\r\n" + 
				"	VGA : "+ vga +"											\r\n" + 
				"	RAM : "+ ram +"												\r\n" + 
				"    STORAGE : "+ storage +"						\r\n" + 
				"==================================================\r\n";
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getLaboratoryNo() {
		return laboratoryNo;
	}
	
	public void setLaboratoryNo(int laboratoryNo) {
		this.laboratoryNo = laboratoryNo;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getIpAddress() {
		return ipAddress;
	}
	
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	public Date getSpecRegDate() {
		return specRegDate;
	}
	
	public void setSpecRegDate(Date specRegDate) {
		this.specRegDate = specRegDate;
	}
	
	public String getCpu() {
		return cpu;
	}
	
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	public String getRam() {
		return ram;
	}
	
	public void setRam(String ram) {
		this.ram = ram;
	}
	
	public String getVga() {
		return vga;
	}
	
	public void setVga(String vga) {
		this.vga = vga;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}
}
