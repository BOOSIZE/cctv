package com.example.cctv.dao;

import com.example.cctv.entity.Studentinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ADao
{

	@Select("SELECT * FROM studentinfo LIMIT #{limit} OFFSET #{start}")
	List<Studentinfo> getList(int start,int limit);

	@Select("SELECT COUNT(*) FROM studentinfo")
	int getSum();

}