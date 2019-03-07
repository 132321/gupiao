package com.hzyc.intstudio.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hzyc.intstudio.entity.MarketIndex;
import com.hzyc.intstudio.service.StockDataImpl;
import com.hzyc.intstudio.util.JDBCTools;

@Controller
public class StockDataController {

	@Autowired
	StockDataImpl stockDataImpl;
	
	//获取数据
	@RequestMapping("/getAllData")
	public String getData(HttpServletRequest request,Integer page) {
		Integer pageSize = 20;
		JDBCTools jt = new JDBCTools();
		String sql = "select * from table limit "+(page-1)*pageSize+","+pageSize;
		List<HashMap<String,String>> stockList = jt.find(sql);
		StockDataImpl stockDataImpl = new StockDataImpl();
		String stockId = "";
		System.out.println(stockList.size());
		//循环拼接数据
		for(int i = 0;i<stockList.size();i++) {
			if(i == stockList.size()-1) {
				stockId = stockId + "s_sh" + stockList.get(i).get("code");
			}else {
				stockId = stockId + "s_sh" + stockList.get(i).get("code")+",";
			}
		}
		List<MarketIndex> miList = stockDataImpl.getData(stockId);
		request.setAttribute("miList", miList);
		request.setAttribute("page", page+1);
		return "";
	}
	
}
