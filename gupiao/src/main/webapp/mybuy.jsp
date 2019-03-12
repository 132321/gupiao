<%@page import="com.hzyc.intstudio.entity.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/iconfont.css">
  <link rel="stylesheet" href="./css/iconfont1.css">
  <link rel="stylesheet" href="./css/iconfont2.css">
  <link rel="stylesheet" href="https://unpkg.com/mint-ui/lib/style.css">
  <link rel="stylesheet" href="./css/main1.css"> 
  <title>Document</title>
  <script>
  	window.onload = function(){
  		
  		
  	}
  	function record(){
  		window.location.href = "record.jsp"
  	}
  	function consumption(){
  		window.location.href = "consumption.jsp"
  	}
  	function  cancel(){
    	if(confirm('确认退出登录吗?')){
    		//this.$toast('正在注销...');
    		window.location.href="logout";
    	}
    }
  </script>
</head>
<body>
  <div id="my">
    <div class="h-lists">
    	<%
    	List<Orders> orders  = (List<Orders>)request.getAttribute("oList");
    	if(orders != null && orders.size() > 0 ){
    		for(Orders o : orders){
      		%>
      			
      		  <mt-cell title="<%=o.getStockid()%>-<%=o.getName()%>" is-link label="购买数量<%=o.getAmount()%>,单价<%=o.getPrice()%>,合计<%=o.getTotal()%>" style="border-top: 1px solid #f2f3f7;padding: 0 10px;" onclick="javascript:window.location.href='order.jsp?url=my.jsp'">
		        <img slot="icon" src="./img/chaxun.jpg" width="24" height="24" style="margin-right:15px;">
		      </mt-cell>
      		
      		<%  		
        	}	
    	}
    	
    	%>
      
      </a>
      <mt-cell title="我的卖出" is-link to="updater" style="border-top: 1px solid #f2f3f7;padding: 0 10px;">
        <img slot="icon" src="./img/xiugai.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
      <span onclick="cancel()">
      <mt-cell title="交易记录" is-link style="border-top: 1px solid #f2f3f7;padding: 0 10px;"  >
        <img slot="icon" src="./img/tuichu.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
      </span>
      <span onclick="cancel()">
      <mt-cell title="退出登录" is-link style="border-top: 1px solid #f2f3f7;padding: 0 10px; margin-bottom:66px;"  >
        <img slot="icon" src="./img/tuichu.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
      </span>
    </div>
   </div>
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <script src="https://unpkg.com/mint-ui/lib/index.js"></script>
  <script>
  
  
  </script>
</body>
</html>
