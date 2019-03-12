package com.hzyc.intstudio.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzyc.intstudio.dao.OrdersMapper;
import com.hzyc.intstudio.entity.MarketIndex;
import com.hzyc.intstudio.entity.Orders;
import com.hzyc.intstudio.entity.StockData;
import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.service.StockDataImpl;
import com.hzyc.intstudio.util.JDBCTools;

@Controller
public class StockDataController {

	@Autowired
	StockDataImpl stockDataImpl;
	
	@Autowired
	OrdersMapper ordersMapper;
	
	//获取数据
	@RequestMapping("/getAllData")
	public String getData(HttpServletRequest request,Integer page) {
		if(page ==null) {
			page = 1;
		}
		Integer pageSize = 20;
		JDBCTools jt = new JDBCTools();
		String sql = "select * from stock limit "+(page-1)*pageSize+","+pageSize;
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
		return "home.jsp";
	}
	
	/**
	 * 根据股票代码模糊查询股票的名称
	 * @param stockId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selNameByStockId")
	public List<HashMap<String,String>> selNameByStockId(HttpServletRequest request) {
		String stockId = request.getParameter("stockId");
		JDBCTools jt = new JDBCTools();
		String sql = "select * from stock where code like '%"+stockId+"%'";
		List<HashMap<String,String>> stockList = jt.find(sql);
		return stockList;
	}
	
	/**
	 * 买股票
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("buyStock")
	public boolean buyStock(HttpServletRequest request) {
		Users users  = (Users)request.getSession().getAttribute("users");
		
		String num = request.getParameter("num");
		String price = request.getParameter("price");
		String stockId = request.getParameter("stockId");
		Orders orders = new Orders();
		orders.setAmount(num);
		orders.setUserid(users.getId());
		orders.setStockid(stockId);
		orders.setPrice(price);
		orders.setStatus("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orders.setTimes(sdf.format(new Date()));
		ordersMapper.insertSelective(orders);
		return true;
	}
	
	/**
	 * 根据用户id查询订单
	 * @param request
	 * @return
	 */
	public List<Orders> selOrders(HttpServletRequest request){
		Users users  = (Users)request.getSession().getAttribute("users");
		List<Orders> oList = ordersMapper.queryAll(users.getId());
		return oList;
	}
	
	public boolean sellStock(HttpServletRequest request) {
        Users users  = (Users)request.getSession().getAttribute("users");
		
		String num = request.getParameter("num");
		String price = request.getParameter("price");
		String stockId = request.getParameter("stockId");
		Orders orders = new Orders();
		orders.setAmount(num);
		orders.setUserid(users.getId());
		orders.setStockid(stockId);
		orders.setPrice(price);
		orders.setStatus("2");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orders.setTimes(sdf.format(new Date()));
		ordersMapper.insertSelective(orders);
		return true;
	}
	
	@ResponseBody
	@RequestMapping("/getStockData")
	public StockData getStockData(HttpServletRequest request) {
		String stockId = request.getParameter("stockId");
		
		StockData sd = stockDataImpl.getStockData("sh"+stockId);
		if(sd.getName()!=null && !sd.getName().equals("")) {
			return sd;
		}else {
			return stockDataImpl.getStockData("sz"+stockId);
		}
	}
}
