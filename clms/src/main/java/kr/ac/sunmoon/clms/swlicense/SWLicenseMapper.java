package kr.ac.sunmoon.clms.swlicense;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SWLicenseMapper {
	public List<SWLicense> selectAll(SWLicense swLicense);
	public SWLicense select(int no);
	public void insert(SWLicense swLicense);
	public void update(SWLicense swLicense);
	public void delete(int no);
	public List<SWLicense> selectExpiryLicense();
}