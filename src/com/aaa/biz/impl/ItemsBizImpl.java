package com.aaa.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.biz.ItemsBiz;
import com.aaa.entity.Items;
import com.aaa.mapper.ItemsDaoMapper;

/**
 * @class_name：ItemsBizImpl
 * @param: 5.ItemsImpl层
 * @return: 商品service实现类
 * @author:Zoutao
 * @createtime:2018年3月22日
 */

@Service
public class ItemsBizImpl implements ItemsBiz {

	@Autowired
	private ItemsDaoMapper itemsDaoMapper;

	@Override
	public Items findOne(int id) {
		// TODO Auto-generated method stub
		return itemsDaoMapper.findOne(id);
	}

	@Override
	public List<Items> findAll() {
		// TODO Auto-generated method stub
		return itemsDaoMapper.findAll();
	}

	@Override
	public void add(Items items) {
		// TODO Auto-generated method stub
		itemsDaoMapper.add(items);
	}

	@Override
	public void upd(Items items) {
		// TODO Auto-generated method stub
		itemsDaoMapper.upd(items);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		itemsDaoMapper.del(id);
	}

}
