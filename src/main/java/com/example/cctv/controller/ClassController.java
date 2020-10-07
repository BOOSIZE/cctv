package com.example.cctv.controller;

import com.example.cctv.entity.Classinfo;
import com.example.cctv.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/class/")
public class ClassController
{
	@Autowired
	private ClassService classServiceImpl;

	@RequestMapping("getList")
	@ResponseBody
	public List<Classinfo> getList()
	{
		return classServiceImpl.getList();
	}
	//2222222222222222222
}