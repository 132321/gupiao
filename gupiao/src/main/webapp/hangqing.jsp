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
	height: 260px;
	border: 1px solid #eee;
	display: inline-block;
	margin-bottom: 10px;
	float: left;
}
.gird1 {
	width: 100%;
	height: 260px;
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
.sell{
	font-size : 14px;
	width : 50px;
	margin-left :10px;
}
#mai{
	width:39%!important;
	height: 260px;
	border: 1px solid #eee;
	border-bottom:0px;
	display: inline-block;
	margin-bottom: 10px;
	float: left;
}
#mai div{
	height:28px;
	line-height:28px;
	border-bottom:1px #e3e3e3 solid;
	
	
}
#mai div span{
	font-size:13px;
	color:#26a2ff;
}
</style>
</head>
<%
	String code = request.getParameter("code");
%>
<body onload="moren(<%=code%>)">
	<div id="home1">
		  <mt-header title="搜索" style="background: #f4f6fa;color:#000;height:50px;">
      <a href="getAllData" slot="left">
        <mt-button icon="back" style="color:#1087ff;">返回</mt-button>
      </a>
    </mt-header>
		<div style="width: 100%">
			<div class="gird1" onclick="javascript:location.href='k.jsp">
				<mt-popup v-model="popupVisible" position="bottom"></mt-popup>
					<mt-search v-model="stockId" placeholder="输入股票编码/股票名称" @keyup.native.enter="getData">
			</div>
		</div>
		<div style="height: 100px; width: 100%"></div>
		<div class="tabs" style="background-color: #fff">
			<a href="getAllData"> <i class="iconfont" style="color: #9c9a9a;">&#xe73e;</i></br> <span class="special">首页</span>
			</a> <a href="hangqing.jsp"> <i class="iconfont"
				>&#xe682;</i></br> <span >搜索</span>
			</a> <a href="yuce.html"> <i class="iconfont" style="color: #9c9a9a;">&#xe624;</i></br>
				<span class="special">预测</span>
			</a> <a href="my.html"> <i class="iconfont" style="color: #9c9a9a;">&#xe501;</i></br>
				<span class="special">我的</span>
			</a>
		</div>
	
	<template style="width:100%;height:400px;">
		<div style="width:100%;height:400px;">
		<!--分享弹出窗 begin-->
		<mt-popup style="width:100%;height:400px;background-color:#fff" class="sharePopup" model="true"   popup-transition="popup-fade" v-model="popupVisible" position="bottom">
		<div class="item" v-for="(item, index) in lists" :key="index">
        <div class="box"  @click="returnCode(item.code)">
        
        	<mt-cell :title="item.code" style="border-top: 1px solid #f2f3f7;padding: 0 10px;">
	  			<span>{{item.name}}</span>
		        <img slot="icon" src="./img/chongzhi.jpg" width="24" height="24" style="margin-right:15px;">
		      </mt-cell>
          </div>
        </div>
      </div>
		</mt-popup>
		<!--分享弹出窗 end-->
	</template>
	</div>
	<script src="https://unpkg.com/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/mint-ui/lib/index.js"></script>
</body>
<script>
function moren(x){
	if (x != null) {
		this.stockId = x;
		 // var vm = this;
		    var ajax4 = new XMLHttpRequest();
		    ajax4.open('post', '/getStockData');
		    ajax4.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			//发送请求
			 ajax4.send("stockId="+this.stockId);
			 ajax4.onreadystatechange = function () {
		         if(ajax4.readyState==4 && ajax4.status==200){
		        	 var result = (ajax4.responseText);
		    		 	var obj = eval('('+result+')');
		    		if (obj == '') {
		 		 	} else {
		 		 	}
				 }
			 }
	}
}
var vm = new Vue({
	  el: '#home1',
	  
	  data() {
	    return {
	    	lists: [
	       ],
	      list: [
	      ],
		  news:'',
		  popupVisible :false,
		  stockId:'',
		  price:'',
		  num:'1'
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
			        	var result = (ajax3.responseText);
		    		 	var obj = eval('('+result+')');
		    		 	if (obj == '') {
		 		 		} else {
		 		 			vm.lists = obj;
		 		 		}
		    		 	vm.popupVisible = true;
					 }
				 }
		  },
		  returnCode(x){
			  this.stockId = x;
			 // var vm = this;
			    var ajax4 = new XMLHttpRequest();
			    ajax4.open('post', '/getStockData');
			    ajax4.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				//发送请求
				 ajax4.send("stockId="+this.stockId);
				 ajax4.onreadystatechange = function () {
			         if(ajax4.readyState==4 && ajax4.status==200){
			        	 var result = (ajax4.responseText);
			    		 	var obj = eval('('+result+')');
			    		if (obj == '') {
			 		 	} else {
			 		 		window.location.href="k.jsp?id=sh"+obj.id+"&name="+obj.name;
			 		 	}
					 }
				 }
				 this.popupVisible = false; 
		  },
	  }
	  
	});
</script>
</html>
