package kr.ac.sunmoon.clms.changenotice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChangeNoticeMapper {
	public List<ChangeNotice> selectAll();
	public ChangeNotice selectByNo(int no);
	public void insert(ChangeNotice changeNotice);
	public void update(ChangeNotice changeNotice);
	public ChangeNotice select(ChangeNotice changeNotice);
	public List<ChangeNotice> selectByDivision(String division);
	public ChangeNotice selectByComputerNo(int no);
	public ChangeNotice selectByLicenseNo(int no);
	public int noticeCount();
	public void updateByNo(int no);
	public String checkDivision(int no);
	public List<ChangeNotice> selectcomputerName();
	public List<ChangeNotice> selectSwName();
}
