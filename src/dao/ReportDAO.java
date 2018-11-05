package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import entity.Report;

public interface ReportDAO {
	
	@Select("select * from report")
	public List<Report> findAll();

}
