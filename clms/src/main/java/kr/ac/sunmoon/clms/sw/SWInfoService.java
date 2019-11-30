package kr.ac.sunmoon.clms.sw;

import java.util.List;

public interface SWInfoService {
	public List<Software> list(Software software);
	public Software view(int no);
	public boolean register(Software software);
	public boolean modify(Software softeare);
	public void remove(int no);
	public void downExcel(List<Software> softwares);
}
