package kr.ac.sunmoon.clms.computer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.ac.sunmoon.clms.changenotice.ChangeNotice;
import kr.ac.sunmoon.clms.changenotice.ChangeNoticeMapper;

@Service
public class ComputerInfoServiceImpl implements ComputerInfoService {
	@Autowired
	private ComputerMapper computerMapper;
	@Autowired
	private ChangeNoticeMapper changeNoticeMapper;
	
	@Override
	public List<Computer> list(Computer computer) {
		return this.computerMapper.selectAll(computer);
	}

	@Override
	public Computer view(int no) {
		return this.computerMapper.selectByNo(no);
	}

	@Override
	public void register(Computer computer) {
		Computer originComputer = this.computerMapper.selectByIpAddress(computer.getIpAddress());
		ChangeNotice changeNotice = new ChangeNotice();
		
		if(this.computerMapper.selectByIpAddress(computer.getIpAddress()) == null) {
			this.computerMapper.insert(computer);
		} else {
			if (!computer.getName().equals(originComputer.getName())
					||!computer.getRam().equals(originComputer.getRam())
					||!computer.getCpu().equals(originComputer.getCpu())
					||!computer.getVga().equals(originComputer.getVga())
					||!computer.getStorage().equals(originComputer.getStorage())){
				this.computerMapper.updateByIpAddress(computer);
				
				changeNotice.setDivision("C");
				changeNotice.setComputerNo(originComputer.getNo());
			}
			
			if (!computer.getRam().equals(originComputer.getRam())) {
				changeNotice.setContents("컴퓨터" + computer.getName() + " RAM이 " + originComputer.getRam() + " 에서  " + computer.getRam() + " (으)로 변경되었다.");
				changeNotice.setComputerNo(originComputer.getNo());
				
				changeNoticeMapper.insert(changeNotice);
			}
			
			if (!computer.getCpu().equals(originComputer.getCpu())) {
				changeNotice.setContents("컴퓨터" + computer.getName() + " CPU가 " + originComputer.getCpu() + " 에서  " + computer.getCpu() + " (으)로 변경되었다.");
				changeNotice.setComputerNo(originComputer.getNo());
				
				changeNoticeMapper.insert(changeNotice);
			}
			
			if (!computer.getVga().equals(originComputer.getVga())) {
				changeNotice.setContents("컴퓨터 "+ computer.getName() +"VGA가 " + originComputer.getVga() + " 에서  " + computer.getVga() + " (으)로 변경되었다.");
				changeNotice.setComputerNo(originComputer.getNo());
				
				changeNoticeMapper.insert(changeNotice);
			}
			
			if (!computer.getStorage().equals(originComputer.getStorage())) {
				changeNotice.setContents("컴퓨터"+ computer.getName() +" STORAGE가 " + originComputer.getStorage() + " 에서 " + " 에서  " + computer.getStorage() + " (으)로 변경되었다.");
				changeNotice.setComputerNo(originComputer.getNo());
				
				changeNoticeMapper.insert(changeNotice);
			}
		}
	}

	public void modify(Computer computer) {
		if(computer.getLaboratoryNo() != 0
				&& computer.getName() != null
				&& computer.getSpecRegDate() != null
				&& computer.getCpu() != null
				&& computer.getVga() != null
				&& computer.getRam() != null
				&& computer.getStorage() != null) {
			computerMapper.update(computer);
		}
	}

	@Override
	public void remove(int no) {
		computerMapper.delete(no);
	}

	@Override
	public List<Computer> listLaboratoryNo(int laboratoryNo) {
		return computerMapper.selectByLaboratoryNo(laboratoryNo);
	}

	@Override
	@Scheduled(cron = "0 0 9 * * *")
	public void checkSendDate() {
		List<Computer> computers = this.computerMapper.checkSendDate();
		
		if (computers != null) {
			ChangeNotice changeNotice = new ChangeNotice();
			changeNotice.setDivision("C");
			for (int i = 0; i < computers.size(); i++) {
				changeNotice.setComputerNo((computers.get(i).getNo()));
				changeNotice.setContents((computers.get(i).getName()) + " 정보가 7일 간 갱신되지 않았습니다.");
				
				this.changeNoticeMapper.insert(changeNotice);
			}
		}
	}
}
