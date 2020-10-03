package com.example.cctv.service.impl;

import com.example.cctv.dao.ADao;
import com.example.cctv.entity.Studentinfo;
import com.example.cctv.entity.TableModel;
import com.example.cctv.service.AService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AServiceImpl implements AService
{
	@Autowired(required = false)
	private ADao  aDao;

	@Override
	public String getList(int page, int limit)
	{
		TableModel tableModel=new TableModel();

		int sum=aDao.getSum();//count

		List<Studentinfo> list=aDao.getList(limit*(page-1),limit);//data

		tableModel.setCount(sum);

		tableModel.setData(list);

		Gson gson=new Gson();

		return gson.toJson(tableModel);
	}
}