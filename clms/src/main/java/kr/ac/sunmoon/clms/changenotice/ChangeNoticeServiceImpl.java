package kr.ac.sunmoon.clms.changenotice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChangeNoticeServiceImpl implements ChangeNoticeService {
	@Autowired
	private ChangeNoticeMapper changeNoticeMapper;

	@Override
	public List<ChangeNotice> list() {
		return changeNoticeMapper.selectAll();
	}

	@Override
	public ChangeNotice view(int no) {
		String division = this.changeNoticeMapper.checkDivision(no);
		ChangeNotice changeNotice = new ChangeNotice();
		if ("C".equals(division)) {
			changeNotice.setDivision("C");
			changeNotice.setNo(no);
			
			return changeNoticeMapper.select(changeNotice);
		} else if("L".equals(division)) {
			changeNotice.setDivision("L");
			changeNotice.setNo(no);
			
			return changeNoticeMapper.select(changeNotice);
		}
		return changeNoticeMapper.select(changeNotice);
	}

	@Override
	public void modify(ChangeNotice changeNotice) {
		changeNoticeMapper.update(changeNotice);
	}

	@Override
	public List<ChangeNotice> listDivision(String division) {
		if ("A".equals(division)) {
			return changeNoticeMapper.selectAll();
		} else {
			return changeNoticeMapper.selectByDivision(division);
		}
	}

	@Override
	public void register(ChangeNotice changeNotice) {
	}
	
	@Override
	public int check() {
		return changeNoticeMapper.noticeCount();
	}

	@Override
	public void editCheck(int no) {
		changeNoticeMapper.updateByNo(no);
	}

	@Override
	public List<ChangeNotice> computerNameList() {
		return this.changeNoticeMapper.selectcomputerName();
	}

	@Override
	public List<ChangeNotice> swNameList() {
		return this.changeNoticeMapper.selectSwName();
	}
	
	
}
