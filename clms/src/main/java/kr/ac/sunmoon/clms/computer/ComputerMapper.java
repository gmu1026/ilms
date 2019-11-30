package kr.ac.sunmoon.clms.computer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ComputerMapper {
	public List<Computer> selectAll(Computer computer);
	public Computer selectByNo(int	no);
	public void insert(Computer computer);
	public void update(Computer computer);
	public void delete(int no);
	public Computer selectByIpAddress(String ipAddress);
	public void insertByChangeNotice(Computer computer);
	public List<Computer> selectByLaboratoryNo(int laboratoryNo);
	public void updateByIpAddress(Computer computer);
	public List<Computer> checkSendDate();
}
