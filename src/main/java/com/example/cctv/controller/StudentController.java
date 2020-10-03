package com.example.cctv.controller;

import com.example.cctv.entity.Studentinfo;
import com.example.cctv.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/student/")
public class StudentController
{
	@Autowired
	private StudentService studentServiceImpl;

	@RequestMapping("getList")
	@ResponseBody
	public String getList(Integer limit,Integer page,String sname,String ssex)
	{
		return  studentServiceImpl.getList(limit, page,sname,ssex);
	}

	@RequestMapping("updateSname")
	@ResponseBody
	public String updateSname(Long sid,String sname)
	{
		return studentServiceImpl.updateSname(sid, sname);
	}

	@RequestMapping("addStudent")
	@ResponseBody
	public String addStudent(Studentinfo studentinfo)
	{
		return studentServiceImpl.addStudent(studentinfo);
	}

	@RequestMapping("deleteStudent")
	@ResponseBody
	public String deleteStudent(Long sid)
	{
		return studentServiceImpl.deleteStudent(sid);
	}
}