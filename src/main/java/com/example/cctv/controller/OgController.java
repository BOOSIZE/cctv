package com.example.cctv.controller;

import com.example.cctv.service.OgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/og/")
public class OgController
{
	@Autowired
	private OgService ogServiceImpl;

	@RequestMapping("getList")
	@ResponseBody
	public String getList(Integer limit,Integer page,String cname,String country)
	{
		return ogServiceImpl.getList(limit,page,cname,country);
	}

	@RequestMapping("getClubList")
	@ResponseBody
	public String getClubList(Integer limit,Integer page)
	{
		return ogServiceImpl.getClubList(limit, page);
	}

	@RequestMapping("getCountryList")
	@ResponseBody
	public String getCountryList(Integer limit,Integer page)
	{
		return ogServiceImpl.getCountryList(limit, page);
	}
}