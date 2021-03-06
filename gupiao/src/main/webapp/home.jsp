<%@page import="com.hzyc.intstudio.entity.MarketIndex"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% List<MarketIndex> miList = (List<MarketIndex>)request.getAttribute("miList");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/iconfont.css">
  <link rel="stylesheet" href="./css/iconfont1.css">
  <link rel="stylesheet" href="./css/iconfont2.css">
  <link rel="stylesheet" href="https://unpkg.com/mint-ui/lib/style.css">
  <link rel="stylesheet" href="./css/main1.css"> 
  <title>Document</title>
  <style>
    *{
    	margin:0;padding:0
    }
  	.gird{
  		width:32%;
  		padding-top:10px;
  		height:100px;
  		border:1px solid #eee;
  		display:inline-block;
  		margin-bottom:10px;
  	}
  	.gird .name{
  		width:100%;
  		text-align:center;
  		font-size:17px;
  		color:#000;
  		margin-bottom:5px;
  	}
  	.gird .price{
  		width:100%;
  		text-align:center;
  		font-size:18px;
  		color:#d00;
  	}
  	.gird .lv{
  		width:100%;
  		//text-align:center;
  		font-size:18px;
  		color:#d00;
  	}
  	.gird .lv .left{
  		width:40%;
  		text-align:left;
  		font-size:14px;
  		color:#d00;
  		
  		display:inline-block;
  	}
  	.gird .lv .right{
  		width:40%;
  		text-align:left;
  		font-size:14px;
  		color:#d00;
  		display:inline-block;
  	}
  	.mint-header {
	 background-color: #1184f9;
	 color:#fff;
	 margin-bottom:20px;
	}
  </style>
</head>
<body style="height:auto">
<div id="home">
	<mt-header  title="首页"></mt-header>
	<div style="width:100%">
		<%for(int i = 0;i<miList.size();i++){
		%>
			<div class="gird" onclick="javascript:location.href='k.jsp?id=<%=miList.get(i).getId() %>&name=<%=miList.get(i).getName() %>' ">
				<div class="name"><%=miList.get(i).getName() %></div>
				<div class="price"><%=miList.get(i).getPrice() %></div>
				<div class="lv">
					<div class="left"><%=miList.get(i).getPoints() %></div>
					<div class="right"><%=miList.get(i).getRate() %>%</div>
				</div>

			</div>
			<%}%>
		</div>
		
		<div style="width:90%;margin:0 auto">
			<button style="width:100%;margin:0 auto;height:35px;color:#555;border:1px solid #00f;background-color:#fff;" onclick="javascript:window.location.href=('getAllData?page=${page}')">加载更多</button>
		</div>
		<div style="height: 100px; width: 100%;background-color:#fff"></div>
		<div class="tabs" style="background-color: #fff">
			<a href="getAllData"> <i class="iconfont">&#xe73e;</i></br> <span>首页</span>
			</a> <a href="hangqing.jsp"> <i class="iconfont"
				style="color: #9c9a9a;">&#xe682;</i></br> <span class="special">搜索</span>
			</a> <a href="yuCe.jsp"> <i class="iconfont" style="color: #9c9a9a;">&#xe624;</i></br>
				<span class="special">预测</span>
			</a> <a href="my.html"> <i class="iconfont" style="color: #9c9a9a;">&#xe501;</i></br>
				<span class="special">我的</span>
			</a>
		</div>
	</div>
	<script src="https://unpkg.com/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/mint-ui/lib/index.js"></script>
	<script src="./js/home.js"></script>
</body>
</html>
