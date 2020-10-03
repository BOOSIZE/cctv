package com.example.cctv;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class CctvApplication
{

	public static void main(String[] args)
	{
		SpringApplication.run(CctvApplication.class, args);
		System.out.println("服务器已启动");
	}

}
