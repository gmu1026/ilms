package kr.ac.sunmoon.clms.swlicense;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.ac.sunmoon.clms.changenotice.ChangeNotice;
import kr.ac.sunmoon.clms.changenotice.ChangeNoticeMapper;

@Service
public class SWLicenseInfoServiceImpl implements SWLicenseInfoService {
	@Autowired
	private SWLicenseMapper swLicenseMapper;
	@Autowired
	private ChangeNoticeMapper changeNoticeMapper;
	
	@Override
	public List<SWLicense> list(SWLicense swLicense) {
		return this.swLicenseMapper.selectAll(swLicense);
	}

	@Override
	public SWLicense view(int no) {
		return this.swLicenseMapper.select(no);
	}

	@Override
	public boolean register(SWLicense swLicense) {
		if (!"".equals(swLicense.getSwName())
				&& swLicense.getCopies() > 0
				&& !"".equals(swLicense.getUseLabNo())
				&& !"".equals(swLicense.getAuthenticationCode())
				&& !"".equals(swLicense.getContractDept())
				&& !"".equals(swLicense.getContractName())
				&& !"".equals(swLicense.getContractPhone())
				&& !"".equals(swLicense.getSupplierName())
				&& !"".equals(swLicense.getSupplierContactName())
				&& !"".equals(swLicense.getSupplierContactPhone())) {			
			this.swLicenseMapper.insert(swLicense);

			return true;
		} 

		return false;
	}

	@Override
	public boolean modify(SWLicense swLicense) {
		if (!"".equals(swLicense.getSwName())
				&& swLicense.getCopies() > 0
				&& !"".equals(swLicense.getUseLabNo())
				&& !"".equals(swLicense.getAuthenticationCode())
				&& !"".equals(swLicense.getContractDept())
				&& !"".equals(swLicense.getContractName())
				&& !"".equals(swLicense.getContractPhone())
				&& !"".equals(swLicense.getSupplierName())
				&& !"".equals(swLicense.getSupplierContactName())
				&& !"".equals(swLicense.getSupplierContactPhone())) {
			this.swLicenseMapper.update(swLicense);
				
			return true;
		}
			
		return false;
	}

	@Override
	public void remove(int no) {
		this.swLicenseMapper.delete(no);
	}
	
	@Override
	@Scheduled(cron = "0 0 9 * * *")
	public void schedulChange() {
		List<SWLicense> swLicenses = this.swLicenseMapper.selectExpiryLicense();
		
		if (swLicenses != null) {
			ChangeNotice changeNotice = new ChangeNotice();
			changeNotice.setDivision("L");
			
			for (int i = 0; i < swLicenses.size(); i++) {
				changeNotice.setSwLicenseNo((swLicenses.get(i).getNo()));
				changeNotice.setContents((swLicenses.get(i).getSwName()) + " 만료가 60일 남았습니다.");
				
				this.changeNoticeMapper.insert(changeNotice);
			}
		}
	}

}
