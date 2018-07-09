package com.aaa.entity;

import java.util.Date;

/**
 * @class_name：Items
 * @param: 1.items
 * @return: 商品实体类
 * @author:Zoutao
 * @createtime:2018年3月22日
 */
public class Items {

	private int id; // 商品id
	private String name; // 商品名
	private float price; // 商品价格
	private String detail; // 商品描述
	private String pic; // 商品图片
	private Date createtime; // 创建日期

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	// 重写构造方法-这样不会出现数据初始化异常
	public Items(int id, String name, float price, String detail, String pic, Date createtime) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.pic = pic;
		this.createtime = createtime;
	}

	public Items() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Items [id=" + id + ", name=" + name + ", price=" + price + ", detail=" + detail + ", pic=" + pic
				+ ", createtime=" + createtime + "]";
	}
}
