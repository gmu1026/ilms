package kr.ac.sunmoon.clms.lab;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LabMapper {
	public List<Lab> selectAll(Lab lab);
	public Lab select(int no);
	public void insert(Lab lab);
	public void update(Lab lab);
	public void delete(int no);
	public int check(int no);
}