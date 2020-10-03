package com.example.cctv.service.impl;

import com.example.cctv.dao.ClassDao;
import com.example.cctv.entity.Classinfo;
import com.example.cctv.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService
{
	@Autowired(required = false)
	private ClassDao classDao;

	@Override
	public List<Classinfo> getList()
	{
		return classDao.getList();
	}
}