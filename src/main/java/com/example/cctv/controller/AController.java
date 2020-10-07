package com.example.cctv.controller;

import com.example.cctv.service.AService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/aaa/")
public class AController
{
	@Autowired
	private AService aService;

	@RequestMapping("getList")
	@ResponseBody
	public String getList(int page,int limit)
	{
		return aService.getList(page, limit);
	}

//5465465465400000000000000000000000000000000000000000000000
	//sssssss
}