package kr.ac.sunmoon.clms.sw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SWInfoServiceImpl implements SWInfoService {

	@Autowired
	private SWMapper swMapper;
	
	@Override
	public List<Software> list(Software software) {
		return this.swMapper.selectAll(software);
	}
	
	@Override
	public Software view(int no) {
		return this.swMapper.select(no);
	}


	@Override
	public boolean register(Software software) {
		if (software.getName() != null && !"".equals(software.getName())
				&& software.getUsage() != null
				&& software.getUseDept() != null
				&& software.getSerialNumber() != null
				&& software.getDivision() != null) {
			this.swMapper.insert(software);

			return true;
		} 

		return false;
	} 

	@Override
	public boolean modify(Software software) {
		if (software.getName() !=null
				&& software.getUsage() != null
				&& software.getUseDept() != null
				&& software.getDivision() != null
				&& software.getSerialNumber() != null) {
			this.swMapper.update(software);
		
			return true;
		}
		
		return false;
	}

	@Override
	public void remove(int no) {
		this.swMapper.delete(no);
	}

	@Override
	public void downExcel(List<Software> softwares) {

	}
}