package kr.ac.sunmoon.clms.swlicense;

import java.util.List;

public interface SWLicenseInfoService {
	public List<SWLicense> list(SWLicense swLicense);
	public SWLicense view(int no);
	public boolean register(SWLicense swLicense);
	public boolean modify(SWLicense swLicense);
	public void remove(int no);
	public void schedulChange();
}
