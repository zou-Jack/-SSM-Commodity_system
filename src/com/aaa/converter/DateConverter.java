package com.aaa.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;


/**
 *@class_name：DateConverter  
 *@param: 工具类
 *@return:  日期格式输出工具类
 *@author:Zoutao
 *@createtime:2018年3月21日
 */
public class DateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String str) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date=sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	

}
