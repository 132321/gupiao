package com.hzyc.intstudio.entity;

public class YuCe implements java.lang.Comparable<YuCe>{
	
	private String name;
	private String code;
	private String yuce;
	
	@Override
    public int compareTo(YuCe yuCe) {
        int result = 0;
        //小数降序
        result = - this.yuce.compareTo(yuCe.yuce);
        return result;
    }
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getYuce() {
		return yuce;
	}
	public void setYuce(String yuce) {
		this.yuce = yuce;
	}
	
	

}
