package kr.ac.sunmoon.clms.sw;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SWMapper {
	public List<Software> selectAll(Software software);	
	public Software select(int no);
	public void insert(Software	software);
	public void update(Software	software);
	public void delete(int no);
}