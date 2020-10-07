package com.example.cctv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/go/")
public class GoController
{
	@RequestMapping("to/{path}")
	public String to(@PathVariable("path") String path)
	{
		return path;
	}

	//2的分支
}