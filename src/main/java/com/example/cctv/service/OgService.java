package com.example.cctv.service;

public interface OgService
{
	String getList(Integer limit,Integer page,String cname,String country);

	String getClubList(Integer limit,Integer page);

	String getCountryList(Integer limit,Integer page);
}