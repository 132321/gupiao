package com.hzyc.intstudio.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.hzyc.intstudio.entity.MarketIndex;
import com.hzyc.intstudio.entity.StockData;

@Service
public class StockDataImpl {
	public static void main(String[] args) {
		StockDataImpl c = new StockDataImpl();
		c.getData("s_sh000001,s_sh000003");
	}
	/**
	 * 通过股票id查询大盘数据
	 * @param stockId
	 * @return list类型的大盘数据
	 */
	public List<MarketIndex> getData(String stockId) {
		String url = "http://hq.sinajs.cn/list="+stockId;
		List<MarketIndex> miList = new ArrayList<MarketIndex>();
		 try {
	            CloseableHttpClient client = null;
	            CloseableHttpResponse response = null;
	            try {
	            	//获取连接
	                HttpGet httpGet = new HttpGet(url);
	                client = HttpClients.createDefault();
	                response = client.execute(httpGet);
	                //得到实体
	                HttpEntity entity = response.getEntity();
	                String result = EntityUtils.toString(entity);
	                //通过;拆分数据
	                String[] temp = result.split(";");
	                //拆分的中间值
	                String data = "";
	                for(int i = 0;i<temp.length-1;i++) {
	                	//截取股票代码
	                	String id = temp[i].substring(temp[i].lastIndexOf("_")+1, temp[i].lastIndexOf("="));
	                	//截取数据
	                	data = temp[i].substring(temp[i].indexOf("\"")+1, temp[i].lastIndexOf("\""));
	                	if(!data.equals("")) {
	                		String[] temp2 = data.split(",");
		                	MarketIndex mi = new MarketIndex();
		                	mi.setId(id);
		                	mi.setName(temp2[0]);
		                	mi.setPoints(temp2[1]);
		                	mi.setPrice(temp2[2]);
		                	mi.setRate(temp2[3]);
		                	mi.setVolume(temp2[4]);
		                	mi.setTurnVolume(temp2[5]);
		                	miList.add(mi);
	                	}
	                }
	                
	            } finally {
	                if (response != null) {
	                    response.close();
	                }
	                if (client != null) {
	                    client.close();
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 return miList;
	}
	
	
	/**
	 * 查询股票的数据，封装在实体里
	 * @param stockId
	 * @return
	 */
	public StockData getStockData(String stockId) {
		String url = "http://hq.sinajs.cn/list="+stockId;
		StockData sd = new StockData();
		try {
	            CloseableHttpClient client = null;
	            CloseableHttpResponse response = null;
	            try {
	            	//获取连接
	                HttpGet httpGet = new HttpGet(url);
	                client = HttpClients.createDefault();
	                response = client.execute(httpGet);
	                //得到实体
	                HttpEntity entity = response.getEntity();
	                String result = EntityUtils.toString(entity);
	                //通过;拆分数据
	                String[] temp = result.split(";");
	                //拆分的中间值
	                String data = "";
	                for(int i = 0;i<temp.length-1;i++) {
	                	//截取股票代码
	                	String id = temp[i].substring(temp[i].lastIndexOf("_")+3, temp[i].lastIndexOf("="));
	                	//截取数据
	                	data = temp[i].substring(temp[i].indexOf("\"")+1, temp[i].lastIndexOf("\""));
	                	if(!data.equals("")) {
	                		String[] temp2 = data.split(",");
	                		sd.setId(id);
	                		sd.setName(temp2[0]);
	                		sd.setKaipan(temp2[1]);
	                		sd.setShoupan(temp2[2]);
	                		sd.setCurrent(temp2[3]);
	                		sd.setHighest(temp2[4]);
	                		sd.setLowest(temp2[5]);
	                		sd.setBuy(temp2[6]);
	                		sd.setSell(temp2[7]);
	                		sd.setNums(temp2[8]);
	                		sd.setMoney(temp2[9]);
	                		sd.setBuynum1(temp2[10]);
	                		sd.setBuymoney1(temp2[11]);
	                		sd.setBuynum2(temp2[12]);
	                		sd.setBuymoney2(temp2[13]);
	                		sd.setBuynum3(temp2[14]);
	                		sd.setBuymoney3(temp2[15]);
	                		sd.setBuynum4(temp2[16]);
	                		sd.setBuymoney4(temp2[17]);
	                		sd.setBuynum5(temp2[18]);
	                		sd.setBuymoney5(temp2[19]);
	                		sd.setSellnum1(temp2[20]);
	                		sd.setSellmoney1(temp2[21]);
	                		sd.setSellnum2(temp2[22]);
	                		sd.setSellmoney2(temp2[23]);
	                		sd.setSellnum3(temp2[24]);
	                		sd.setSellmoney3(temp2[25]);
	                		sd.setSellnum4(temp2[26]);
	                		sd.setSellmoney4(temp2[27]);
	                		sd.setSellnum5(temp2[28]);
	                		sd.setSellmoney5(temp2[29]);
	                		sd.setDate(temp2[30]);
	                		sd.setTime(temp2[31]);
	                	}
	                }
	                
	            } finally {
	                if (response != null) {
	                    response.close();
	                }
	                if (client != null) {
	                    client.close();
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 return sd;
	}
}
