package com.example.cctv.dao;

import com.example.cctv.entity.Classinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ClassDao
{
	@Select("SELECT * FROM CLASSINFO ")
	List<Classinfo> getList();
}