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
	                	//截取数据
	                	data = temp[i].substring(temp[i].indexOf("\"")+1, temp[i].lastIndexOf("\""));
	                	if(!data.equals("")) {
	                		String[] temp2 = data.split(",");
		                	MarketIndex mi = new MarketIndex();
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
}
