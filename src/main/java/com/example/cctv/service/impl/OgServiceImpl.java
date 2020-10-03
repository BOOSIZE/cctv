package com.example.cctv.service.impl;

import com.example.cctv.dao.OgDao;
import com.example.cctv.entity.TableModel;
import com.example.cctv.service.OgService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OgServiceImpl implements OgService
{
	@Autowired(required = false)
	private OgDao ogDao;

	@Override
	public String getClubList(Integer limit, Integer page)
	{
		TableModel tableModel=new TableModel();
		tableModel.setCount(ogDao.getClubSum());
		tableModel.setData(ogDao.getClubList(limit,limit*(page-1)));
		return new Gson().toJson(tableModel);
	}

	@Override
	public String getCountryList(Integer limit, Integer page)
	{
		TableModel tableModel=new TableModel();
		tableModel.setCount(ogDao.getCountrySum());
		tableModel.setData(ogDao.getCountryList(limit,limit*(page-1)));
		return new Gson().toJson(tableModel);
	}

	@Override
	public String getList(Integer limit,Integer page,String cname,String country)
	{

		TableModel tableModel=new TableModel();
		if(country!=null && country.equals("全部"))
		{
			country=null;
		}
		tableModel.setData(ogDao.getList(limit,limit*(page-1),cname,country));
		tableModel.setCount(ogDao.getSum(cname, country));


		return new Gson().toJson(tableModel);
	}
}