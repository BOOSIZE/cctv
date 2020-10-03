package com.example.cctv.service;

import com.example.cctv.entity.Studentinfo;

public interface StudentService
{
	String getList(Integer limit,Integer page,String sname,String ssex);

	String updateSname(Long sid,String sname);

	String deleteStudent(Long sid);

	String addStudent(Studentinfo studentinfo);
}