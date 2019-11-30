package kr.ac.sunmoon.clms.changenotice;

import java.util.List;

public interface ChangeNoticeService {
	public List<ChangeNotice> list();
	public ChangeNotice view(int no);
	public List<ChangeNotice> listDivision(String division);
	public void register(ChangeNotice changeNotice);
	public void modify(ChangeNotice changeNotice);
	public int check();
	public void editCheck(int no);
	public List<ChangeNotice> computerNameList();
	public List<ChangeNotice> swNameList();
}
