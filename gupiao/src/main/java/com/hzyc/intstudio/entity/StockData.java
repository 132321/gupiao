package com.hzyc.intstudio.entity;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * @author asus
 *
 */
public class StockData {

	private String name;
	private String kaipan;
	private String shoupan;
	private String current;
	private String highest;
	private String lowest;
	private String buy;
	private String sell;
	private String nums;
	private String money;
	private String buynum1;
	private String buymoney1;
	private String buynum2;
	private String buymoney2;
	private String buynum3;
	private String buymoney3;
	private String buynum4;
	private String buymoney4;
	private String buynum5;
	private String buymoney5;
	private String sellnum1;
	private String sellmoney1;
	private String sellnum2;
	private String sellmoney2;
	private String sellnum3;
	private String sellmoney3;
	private String sellnum4;
	private String sellmoney4;
	private String sellnum5;
	private String sellmoney5;
	private String date;
	private String time;
	DecimalFormat format = new DecimalFormat("0.00");
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKaipan() {
		return kaipan;
	}
	public void setKaipan(String kaipan) {
		this.kaipan = kaipan;
	}
	public String getShoupan() {
		return shoupan;
	}
	public void setShoupan(String shoupan) {
		this.shoupan = shoupan;
	}
	public String getCurrent() {
		return current;
	}
	public void setCurrent(String current) {
		this.current = current;
	}
	public String getHighest() {
		return highest;
	}
	public void setHighest(String highest) {
		this.highest = highest;
	}
	public String getLowest() {
		return lowest;
	}
	public void setLowest(String lowest) {
		this.lowest = lowest;
	}
	public String getBuy() {
		return buy;
	}
	public void setBuy(String buy) {
		this.buy = buy;
	}
	public String getSell() {
		return sell;
	}
	public void setSell(String sell) {
		this.sell = sell;
	}
	public String getNums() {
		return nums;
	}
	public void setNums(String nums) {
		this.nums = nums;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getBuynum1() {
		return format.format(new BigDecimal(buynum1));
	}
	public void setBuynum1(String buynum1) {
		this.buynum1 = buynum1;
	}
	public String getBuymoney1() {
		return format.format(new BigDecimal(buymoney1));
	}
	public void setBuymoney1(String buymoney1) {
		this.buymoney1 = buymoney1;
	}
	public String getBuynum2() {
		return buynum2;
	}
	public void setBuynum2(String buynum2) {
		this.buynum2 = buynum2;
	}
	public String getBuymoney2() {
		return format.format(new BigDecimal(buymoney2));
	}
	public void setBuymoney2(String buymoney2) {
		this.buymoney2 = buymoney2;
	}
	public String getBuynum3() {
		return buynum3;
	}
	public void setBuynum3(String buynum3) {
		this.buynum3 = buynum3;
	}
	public String getBuymoney3() {
		return format.format(new BigDecimal(buymoney3));
	}
	public void setBuymoney3(String buymoney3) {
		this.buymoney3 = buymoney3;
	}
	public String getBuynum4() {
		return buynum4;
	}
	public void setBuynum4(String buynum4) {
		this.buynum4 = buynum4;
	}
	public String getBuymoney4() {
		return format.format(new BigDecimal(buymoney4));
	}
	public void setBuymoney4(String buymoney4) {
		this.buymoney4 = buymoney4;
	}
	public String getBuynum5() {
		return buynum5;
	}
	public void setBuynum5(String buynum5) {
		this.buynum5 = buynum5;
	}
	public String getBuymoney5() {
		return format.format(new BigDecimal(buymoney5));
	}
	public void setBuymoney5(String buymoney5) {
		this.buymoney5 = buymoney5;
	}
	public String getSellnum1() {
		return sellnum1;
	}
	public void setSellnum1(String sellnum1) {
		this.sellnum1 = sellnum1;
	}
	public String getSellmoney1() {
		return format.format(new BigDecimal(sellmoney1));
	}
	public void setSellmoney1(String sellmoney1) {
		this.sellmoney1 = sellmoney1;
	}
	public String getSellnum2() {
		return sellnum2;
	}
	public void setSellnum2(String sellnum2) {
		this.sellnum2 = sellnum2;
	}
	public String getSellmoney2() {
		return format.format(new BigDecimal(sellmoney2));
	}
	public void setSellmoney2(String sellmoney2) {
		this.sellmoney2 = sellmoney2;
	}
	public String getSellnum3() {
		return sellnum3;
	}
	public void setSellnum3(String sellnum3) {
		this.sellnum3 = sellnum3;
	}
	public String getSellmoney3() {
		return format.format(new BigDecimal(sellmoney3));
	}
	public void setSellmoney3(String sellmoney3) {
		this.sellmoney3 = sellmoney3;
	}
	public String getSellnum4() {
		return sellnum4;
	}
	public void setSellnum4(String sellnum4) {
		this.sellnum4 = sellnum4;
	}
	public String getSellmoney4() {
		return format.format(new BigDecimal(sellmoney4));
	}
	public void setSellmoney4(String sellmoney4) {
		this.sellmoney4 = sellmoney4;
	}
	public String getSellnum5() {
		return sellnum5;
	}
	public void setSellnum5(String sellnum5) {
		this.sellnum5 = sellnum5;
	}
	public String getSellmoney5() {
		return format.format(new BigDecimal(sellmoney5));
	}
	public void setSellmoney5(String sellmoney5) {
		this.sellmoney5 = sellmoney5;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
