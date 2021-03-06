package com.hzyc.intstudio.controller;

import java.text.DecimalFormat;
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
	public String getData(HttpServletRequest request) {
		String page = request.getParameter("page");
		if(page ==null) {
			page = "2";
		}
		Integer page1 = Integer.parseInt(page);
		Integer pageSize = 20;
		JDBCTools jt = new JDBCTools();
		String sql = "select * from stock limit 0,"+(page1-1)*pageSize;
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
		request.setAttribute("page", page1+1);
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
		String sql = "select * from stock where code like '%"+stockId+"%' or name like '%"+stockId+"%'";
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
		Double total = Double.parseDouble(price)*Integer.parseInt(num);
		DecimalFormat format = new DecimalFormat("0.00");
		orders.setTotal(format.format(total));
		orders.setAmount(num);
		orders.setUserid(users.getId());
		orders.setStockid(stockId);
		orders.setPrice(price);
		orders.setStatus("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orders.setTimes(sdf.format(new Date()));
		JDBCTools jt = new JDBCTools();
		String sql1 = "select money from users where id = '"+users.getId()+"'";
		String money  = jt.find(sql1).get(0).get("money");
		double overMoney = Double.parseDouble(money) - total ;
		if(overMoney >= 0 ) {
			//了可以
			
			String oMoneyString = format.format(overMoney);
			String sql = "update users set money ="+oMoneyString+" where id = '"+users.getId()+"'";
			System.out.println(sql);
			
			int flag = jt.update(sql);
			if(flag>0) {
				ordersMapper.insertSelective(orders);
				return true;
			}else {
				return false;
			}
		}else {
			//余额不足
			return false;
		}
		
	}
	
	/**
	 * 根据用户id查询订单
	 * @param request
	 * @return
	 */
	@RequestMapping("selOrders1")
	public String selOrders1(HttpServletRequest request){
		Users users  = (Users)request.getSession().getAttribute("users");
		List<Orders> oList = ordersMapper.queryAll(users.getId(),"1");
		request.setAttribute("oList", oList);
		return "mybuy.jsp";
	}  
	/**
	 * 根据用户id查询订单
	 * @param request
	 * @return
	 */
	@RequestMapping("selOrders2")
	public String selOrders2(HttpServletRequest request){
		Users users  = (Users)request.getSession().getAttribute("users");
		List<Orders> oList = ordersMapper.queryAll(users.getId(),"2");
		request.setAttribute("oList", oList);
		return "mybuy.jsp";
	}  
	
	/**
	 * 根据用户id查询订单
	 * @param request
	 * @return
	 */
	@RequestMapping("selOrders")
	public String selOrders(HttpServletRequest request){
		Users users  = (Users)request.getSession().getAttribute("users");
		List<Orders> oList = ordersMapper.queryAll1(users.getId());
		System.out.println(oList.size());
		request.setAttribute("oList", oList);
		return "mybuy.jsp";
	}  
	
	@ResponseBody
	@RequestMapping("sellStock")
	public boolean sellStock(HttpServletRequest request) {
		Users users  = (Users)request.getSession().getAttribute("users");
		
		String num = request.getParameter("num");
		String price = request.getParameter("price");
		String stockId = request.getParameter("stockId");
		Orders orders = new Orders();
		Double total = Double.parseDouble(price)*Integer.parseInt(num);
		DecimalFormat format = new DecimalFormat("0.00");
		orders.setTotal(format.format(total));
		orders.setAmount(num);
		orders.setUserid(users.getId());
		orders.setStockid(stockId);
		orders.setPrice(price);
		orders.setStatus("2");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		orders.setTimes(sdf.format(new Date()));
		JDBCTools jt = new JDBCTools();
		String sql1 = "select money from users where id = '"+users.getId()+"'";
		String money  = jt.find(sql1).get(0).get("money");
		double overMoney = Double.parseDouble(money) + total ;
		String oMoneyString = format.format(Double.parseDouble(overMoney+""));
		String sql = "update users set money ="+oMoneyString+" where id = '"+users.getId()+"'";
		System.out.println(sql);
		
		int flag = jt.update(sql);
		if(flag>0) {
			ordersMapper.insertSelective(orders);
			return true;
		}else {
			return false;
		}
		
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
	
	/**
	 * 根据股票代码模糊查询已经购买的股票的名称
	 * @param stockId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/selNameByStockIdBuy")
	public List<HashMap<String,String>> selNameByStockIdBuy(HttpServletRequest request) {
		String stockId = request.getParameter("stockId");
		Users users  = (Users)request.getSession().getAttribute("users");
		JDBCTools jt = new JDBCTools();
		String sql = "SELECT * FROM stock s,orders o WHERE o.stockid = s.code AND o.userid = '"+users.getId()+"' AND s.code LIKE '%"+stockId+"%'";
		List<HashMap<String,String>> stockList = jt.find(sql);
		return stockList;
	}
}
