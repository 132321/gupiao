package com.hzyc.intstudio.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hzyc.intstudio.entity.Users;
import com.hzyc.intstudio.entity.YuCe;
import com.hzyc.intstudio.util.JDBCTools;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class StockYuCeController {

	//获取数据
	@ResponseBody
	@RequestMapping(value="/yuCe")
	public List<YuCe> getData(HttpServletRequest request,Integer page) {
		
		String day = request.getParameter("day");
		
		if(page ==null) {
			page = 1;
		}
		Integer pageSize = 10;
		JDBCTools jt = new JDBCTools();
		String sql = "select * from stock limit "+(page-1)*pageSize+","+pageSize;
		List<HashMap<String,String>> stockList = jt.find(sql);
		String stockId = "";
		
		List<YuCe> yuList = new ArrayList<YuCe>();
		
		//循环拼接数据
		for(int i = 0;i<stockList.size();i++) {
			YuCe yuCe = new YuCe();
			if(i == stockList.size()-1) {
				stockId = stockId + "cn_" + stockList.get(i).get("code");
				yuCe.setCode("cn_" + stockList.get(i).get("code"));
				yuCe.setName(stockList.get(i).get("name"));
			}else {
				stockId = stockId + "cn_" + stockList.get(i).get("code")+",";
				yuCe.setCode("cn_" + stockList.get(i).get("code"));
				yuCe.setName(stockList.get(i).get("name"));
			}
			yuList.add(yuCe);
		}
		List<YuCe> yList = new ArrayList<YuCe>();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    	Date date = new Date();
    	Calendar calendar = Calendar.getInstance();
    	if (!"".equals(day) && day != null) {
    		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - Integer.parseInt(day) + 1);
    	} else {
    		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 6);
    	}
          
        Date today = calendar.getTime(); 
        
		yList = diaoyong(sdf.format(today), sdf.format(date), stockId, yuList);
		
		if (yList == null) {
			sql = "select * from stock limit 0,"+pageSize;
			stockList = jt.find(sql);
			stockId = "";
			
			yuList = new ArrayList<YuCe>();
			
			//循环拼接数据
			for(int i = 0;i<stockList.size();i++) {
				YuCe yuCe = new YuCe();
				if(i == stockList.size()-1) {
					stockId = stockId + "cn_" + stockList.get(i).get("code");
					yuCe.setCode("cn_" + stockList.get(i).get("code"));
					yuCe.setName(stockList.get(i).get("name"));
				}else {
					stockId = stockId + "cn_" + stockList.get(i).get("code")+",";
					yuCe.setCode("cn_" + stockList.get(i).get("code"));
					yuCe.setName(stockList.get(i).get("name"));
				}
				yuList.add(yuCe);
			}
	        
			yList = diaoyong(sdf.format(today), sdf.format(date), stockId, yuList);
		}
		Collections.sort(yList);
		
		return yList;
	}
	
	//获取数据
		@ResponseBody
		@RequestMapping(value="/yuCeEach")
		public List<YuCe> getDataEach(HttpServletRequest request) {
			
			String stockId = request.getParameter("stockId");
			String name = request.getParameter("name");
			stockId = stockId.replace("sh", "cn_");
			List<YuCe> yList = new ArrayList<YuCe>();
			YuCe yuCe = new YuCe();
			yuCe.setName(name);
			yuCe.setCode(stockId);
			yList.add(yuCe);
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	    	Date date = new Date();
	    	Calendar calendar = Calendar.getInstance();
    		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 6);
	        Date today = calendar.getTime(); 
			yList = diaoyong(sdf.format(today), sdf.format(date), stockId, yList);
			return yList;
		}
		
	public static List<YuCe> diaoyong(String start, String end, String code, List<YuCe> yuList) {
		URL ur = null;
		List<YuCe> yList = new ArrayList<YuCe>();
		String line;
		BufferedReader reader = null;
		try {
			ur = new URL("http://q.stock.sohu.com/hisHq?code=" + code + "&start=" + start + "&end=" + end + "&stat=1&order=D&period=d&callback=historySearchHandler&rt=jsonp");
            HttpURLConnection uc = (HttpURLConnection) ur.openConnection();
            reader = new BufferedReader(new InputStreamReader(ur.openStream(),"GBK"));
            while ((line = reader.readLine()) != null) {

				String result = line.substring(line.indexOf("[") + 1, line.lastIndexOf("]"));
				if (!"".equals(result)) {
					String[] resultArray = result.split("\\},\\{");
					int length = resultArray.length - 1;
					for (int i = 0; i < length + 1; i++) {
						String rs = "";
						if (resultArray.length != 1) {
							//结尾
							if (i == length) {
								rs = "{" + resultArray[i];
							} else if (i != 0 && i != length) {
								//中间
								rs = "{" + resultArray[i] + "}";
							} else {
								//开头
								rs = resultArray[i] + "}";
							}
						} else {
							rs = resultArray[i];
						}
						JSONObject json = JSONObject.fromObject(rs);
						JSONArray array = json.getJSONArray("stat");
						YuCe e = new YuCe();
						code = json.getString("code");

						for (YuCe yuCe : yuList) {
							if (code.equals(yuCe.getCode())) {
								e.setName(yuCe.getName());
								yuList.remove(yuCe);
								break;
							}
						}
						e.setCode(code);
						e.setYuce(array.get(2).toString());
						yList.add(e);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return yList;
	}
	
	@ResponseBody
	@RequestMapping(value="/maichu")
	public boolean maichu(HttpServletRequest request) {
		
		boolean flag = false;
		Users users = null;
		try {
			String code = request.getParameter("code");
			int num = Integer.parseInt(request.getParameter("num"));
			HttpSession session = request.getSession();
			if (session.getAttribute("users") != null && session.getAttribute("users") != "") {
				users = (Users) session.getAttribute("users");
				JDBCTools jt = new JDBCTools();
				String sql = "SELECT * FROM orders t WHERE t.userid = '" + users.getId() + "' AND t.stockid = '" + code
						+ "'";
				List<HashMap<String, String>> stockList = jt.find(sql);
				if (stockList != null && stockList.size() > 0) {
					for (int i = 0; i < stockList.size(); i++) {
						// 1买
						if ("1".equals(stockList.get(i).get("status"))) {
							num -= Integer.parseInt(stockList.get(i).get("amount"));
						} else {
							num += Integer.parseInt(stockList.get(i).get("amount"));
						}
					}
				}
				if (num <= 0) {
					flag = true;
				}
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	
}
