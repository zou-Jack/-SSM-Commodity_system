package com.aaa.mapper;

import java.util.List;

import com.aaa.entity.Items;

/**
 *@class_name：ItemsDaoMapper  
 *@param: 2.ItemsDao
 *@return: 商品Dao接口类
 *@author:Zoutao
 *@createtime:2018年3月22日
 */
public interface ItemsDaoMapper {
	
	//1.单条查询-id
	public Items findOne(int id);
		
	//2.查询所有商品
	public List<Items> findAll();
	
	//3.增加
	public void add (Items items);
	
	//4.更新
	public void upd(Items items);
	
	//5.删除
	public void del(int id);
	

}
