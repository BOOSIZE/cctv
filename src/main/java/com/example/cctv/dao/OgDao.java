package com.example.cctv.dao;

import com.example.cctv.entity.Oginfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OgDao
{
	Integer getSum(String cname,String country);


	List<Oginfo> getList(Integer limit,Integer start,String cname,String country);

	@Select("SELECT CNAME, COUNTRY,COUNT(*) AS DATE FROM OGINFO GROUP BY CNAME " +
			"ORDER BY DATE DESC LIMIT #{limit} OFFSET #{start}")
	List<Oginfo> getClubList(Integer limit,Integer start);

	@Select("SELECT COUNT(DISTINCT CNAME) FROM OGINFO")
	int getClubSum();

	@Select("SELECT COUNTRY,COUNT(*) AS DATE FROM oginfo GROUP BY COUNTRY " +
			"ORDER BY DATE DESC LIMIT #{limit} OFFSET #{start}")
	List<Oginfo> getCountryList(Integer limit,Integer start);

	@Select("SELECT COUNT(DISTINCT COUNTRY) FROM OGINFO")
	int getCountrySum();




}
