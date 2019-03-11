<%@page import="com.hzyc.intstudio.entity.MarketIndex"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
* {
	margin: 0;
	padding: 0
}

.gird {
	width: 70%;
	padding-top: 10px;
	height: 260px;
	border: 1px solid #eee;
	display: inline-block;
	margin-bottom: 10px;
	float: left;
}

.gird .name {
	width: 100%;
	text-align: center;
	font-size: 17px;
	color: #000;
	margin-bottom: 5px;
}

.gird .price {
	width: 100%;
	text-align: center;
	font-size: 18px;
	color: #d00;
}

.gird .lv {
	width: 100%; 
	text-align: center;
	font-size: 18px;
	color: #d00;
}

.gird .lv .left {
	width: 40%;
	text-align: left;
	font-size: 14px;
	color: #d00;
	display: inline-block;
}

.gird .lv .right {
	width: 40%;
	text-align: left;
	font-size: 14px;
	color: #d00;
	display: inline-block;
}

.mint-header {
	background-color: #1184f9;
	color: #fff;
	margin-bottom: 20px;
}

.hr {
	border: 1px dashed #0000fff;
}
</style>
</head>
<body>
	<div id="home1">
		<mt-header title="首页"></mt-header>
		<div style="width: 100%">
			<span onclick="cancel()"> <mt-cell title="股票涨幅" is-link
					style="border-top: 1px solid #f2f3f7;padding: 0 10px;margin-bottom:10px;">
				<img slot="icon" src="./img/chongzhi.jpg" width="24" height="24"
					style="margin-right: 15px;"> </mt-cell>
			</span>
			<div class="gird" onclick="javascript:location.href='k.jsp">
				<mt-field label="股票名称" placeholder="输入编码" v-model="stockId"
					@blur.native.capture="getData"></mt-field>
			</div>
			<div class="gird" style="width: 30%;">
				卖5
				<hr class="hr">
				卖4
				<hr class="hr">
				卖3
				<hr class="hr">
				卖2
				<hr class="hr">
				卖1
				<hr class="hr">
				买1
				<hr class="hr">
				买2
				<hr class="hr">
				买3
				<hr class="hr">
				买4
				<hr class="hr">
				买5
				<hr class="hr">
			</div>
		</div>
		<div style="height: 100px; width: 100%"></div>
		<div class="tabs" style="background-color: #fff">
			<a href="home.html"> <i class="iconfont">&#xe73e;</i></br> <span>首页</span>
			</a> <a href="hangqing.html"> <i class="iconfont"
				style="color: #9c9a9a;">&#xe682;</i></br> <span class="special">行情</span>
			</a> <a href="yuce.html"> <i class="iconfont" style="color: #9c9a9a;">&#xe624;</i></br>
				<span class="special">预测</span>
			</a> <a href="my.html"> <i class="iconfont" style="color: #9c9a9a;">&#xe501;</i></br>
				<span class="special">我的</span>
			</a>
		</div>
	</div>
	<script src="https://unpkg.com/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/mint-ui/lib/index.js"></script>
</body>
<script>
var vm = new Vue({
	  el: '#home1',
	  
	  data() {
	    return {
	    	lists: [
	       ],
	      list: [
	        {
	          icon: 'jieshao.png',
	          text: '厂区介绍',
	          color: 'red'
	        },
	        {
	          icon: 'chongzhi.png',
	          text: '充值中心',
	          color: 'green'
	        },
	        {
	          icon: 'dingdanchaxun.png',
	          text: '订单查询',
	          color: 'yellow'
	        },
	        {
	          icon: 'wuliuchaxun.png',
	          text: '物流查询',
	          color: 'blue'
	        }
	      ],
		  news:''
	    }
	  },
	  methods: {
		  getData(){
			  var vm = this;
			    var ajax3 = new XMLHttpRequest();
				 ajax3.open('post', '/selNameByStockId' );
				 ajax3.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				//发送请求
				 ajax3.send("stockId="+this.stockId);
				 ajax3.onreadystatechange = function () {
			         if(ajax3.readyState==4 && ajax3.status==200){
					    var flag2 = (ajax3.responseText);
					    vm.lists = JSON.parse(flag2);
					    alert(flag2);
					  //  alert(1);
					 }
				 }
		  }
	  },
	  mounted(){
		  var vm = this;
		 
		    var ajax3 = new XMLHttpRequest();
			 ajax3.open('post', '/jzx/selImg1' );
			 ajax3.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			//发送请求
			 ajax3.send(null);
			 ajax3.onreadystatechange = function () {
		         if(ajax3.readyState==4 && ajax3.status==200){
				    var flag2 = (ajax3.responseText);
				    vm.lists = JSON.parse(flag2);
				  //  alert(1);
				 }
			 }
	  }
	  
	})


</script>
</html>
