package kr.ac.sunmoon.clms.lab;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LabInfoServiceImpl implements LabInfoService{
	@Autowired
	private LabMapper labMapper;
	@Override
	public List<Lab> list(Lab lab) {
		return this.labMapper.selectAll(lab);
	}
	
	@Override
	public Lab view(int no) {
		Lab lab = this.labMapper.select(no);
		if (lab == null) {
			return new Lab();
		}
		return lab;
	}
	
	@Override
	public void register(Lab lab) {
		if (lab.getNo() > 0) {
			this.labMapper.insert(lab);
		}
	}
	
	public int check(int no) {
			return labMapper.check(no);
	}
	
	@Override
	public void modify(Lab lab) {
		if (lab.getNo() > 0) {
			this.labMapper.update(lab);
		}
	}
	
	public void remove(int no) {
		this.labMapper.delete(no);
	}
}