package com.example.cctv.service.impl;

import com.example.cctv.dao.StudentDao;
import com.example.cctv.entity.Studentinfo;
import com.example.cctv.entity.TableModel;
import com.example.cctv.service.StudentService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired(required = false)
	private StudentDao studentDao;

	@Override
	public String getList(Integer limit, Integer page,String sname,String ssex)
	{
		if(ssex!=null && ssex.equals("全部"))
		{
			ssex=null;
		}
		TableModel tableModel=new TableModel();
		tableModel.setCount(studentDao.getSum(sname,ssex));
		tableModel.setData(studentDao.getList(limit,limit*(page-1),sname,ssex));
		return new Gson().toJson(tableModel);
	}

	@Override
	public String updateSname(Long sid,String sname)
	{
		String str="no";
		int n=studentDao.updateSname(sid, sname);
		if(n>0)
		{
			str="yes";
		}
		return str;
	}

	@Override
	public String addStudent(Studentinfo studentinfo)
	{
		String str="no";
		int n=studentDao.addStudent(studentinfo);
		if(n>0)
		{
			str="yes";
		}
		return str;
	}

	@Override
	public String deleteStudent(Long sid)
	{
		String str="no";
		int n=studentDao.deleteStudent(sid);
		if(n>0)
		{
			str="yes";
		}
		return str;
	}
}