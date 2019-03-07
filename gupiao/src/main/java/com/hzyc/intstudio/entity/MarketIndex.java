package com.hzyc.intstudio.entity;

public class MarketIndex {

	//指数名称，当前点数，当前价格，涨跌率，成交量（手），成交额（万元）；
	private String name ="";
	private String points = "";
	private String price = "";
	private String rate = "";
	private String volume = "";
	private String turnVolume = "";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoints() {
		return points;
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
		return rate;
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
