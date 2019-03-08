package com.hzyc.intstudio.entity;

import java.text.DecimalFormat;

public class MarketIndex {

	//指数名称，当前点数，当前价格，涨跌率，成交量（手），成交额（万元）；
	private String id = "";
	private String name ="";
	private String points = "";
	private String price = "";
	private String rate = "";
	private String volume = "";
	private String turnVolume = "";
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoints() {
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(Double.parseDouble(points));
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRate() {
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(Double.parseDouble(rate));
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getTurnVolume() {
		return turnVolume;
	}
	public void setTurnVolume(String turnVolume) {
		this.turnVolume = turnVolume;
	}
	
	
}
