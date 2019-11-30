package kr.ac.sunmoon.clms.computer;

import java.util.List;

public interface ComputerInfoService {
	public List<Computer> list(Computer computer);
	public Computer view(int no);
	public void register(Computer computer);
	public void modify(Computer computer);
	public void remove(int no);
	public List<Computer> listLaboratoryNo(int laboratoryNo);
	public void checkSendDate();
}
