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
	width: 60%;
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
<body>
	<div id="home1">
		<mt-header title="首页"></mt-header>
		<div style="width: 100%">
			<span onclick="cancel()"> <mt-cell title="股票涨幅" is-link
					style="border-top: 1px solid #f2f3f7;padding: 0 10px;margin-bottom:10px;">
				<img slot="icon" src="./img/chongzhi.jpg" width="24" height="24"
					style="margin-right: 15px;"> </mt-cell>
			</span>
			<div class="gird1" onclick="javascript:location.href='k.jsp">
				<mt-popup v-model="popupVisible" position="bottom"></mt-popup>
				<mt-field label="股票名称" placeholder="输入编码" v-model="stockId" 
					@keyup.native="getData"></mt-field>
				<mt-field label="金额" placeholder="输入金额"  readonly v-model="price" ></mt-field>
				<mt-field label="数量" placeholder="输入数量"  v-model="num" type="number"></mt-field>
				<mt-button type="primary" style="width:150px;margin-top:20px;margin-left:30px;" @click="buy" >买入</mt-button>
			</div>
			<div  id="mai" style="width: 30%;">
				<div>
				<span id="sell5" class="sell">卖5</span>
				<span id="sellmoney5" class="sell">--</span>
				<span id="sellmount5" class="sell">--</span>
				</div>
				<div>
				<span id="sell4" class="sell">卖4</span>
				<span id="sellmoney4" class="sell">--</span>
				<span id="sellmount4" class="sell">--</span>
				</div>
				<div>
				<span id="sell3" class="sell">卖3</span>
				<span id="sellmoney3" class="sell">--</span>
				<span id="sellmount3" class="sell">--</span>
				</div>
				<div>
				<span id="sell2" class="sell">卖2</span>
				<span id="sellmoney2" class="sell">--</span>
				<span id="sellmount2" class="sell">--</span>
				</div>
				<div>
				<span id="sell1" class="sell">卖1</span>
				<span id="sellmoney1" class="sell">--</span>
				<span id="sellmount1" class="sell">--</span>
				</div>
				<div>
				<span id="buy1" class="sell">买1</span>
				<span id="buymoney1" class="sell">--</span>
				<span id="buymount1" class="sell">--</span>
				</div>
				<div>
				<span id="buy2" class="sell">买2</span>
				<span id="buymoney2" class="sell">--</span>
				<span id="buymount2" class="sell">--</span>
				</div>
				<div>
				<span id="buy3" class="sell">买3</span>
				<span id="buymoney3" class="sell">--</span>
				<span id="buymount3" class="sell">--</span>
				</div>
				<div>
				<span id="buy4" class="sell">买4</span>
				<span id="buymoney4" class="sell">--</span>
				<span id="buymount4" class="sell">--</span>
				</div>
				<div>
				<span id="buy5" class="sell">买5</span>
				<span id="buymoney5" class="sell">--</span>
				<span id="buymount5" class="sell">--</span>
				</div>
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
	
	<template style="width:100%;height:300px;">
		<div style="width:100%;height:300px;">
		<!--分享弹出窗 begin-->
		<mt-popup style="width:100%;height:300px;background-color:#fff" class="sharePopup" model="true"   popup-transition="popup-fade" v-model="popupVisible" position="bottom">
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
			 		 		vm.price = (obj.current);
			 		 		document.getElementById("sellmoney1").innerHTML = obj.sellmoney1;
			 		 		document.getElementById("sellmoney2").innerHTML = obj.sellmoney2;
			 		 		document.getElementById("sellmoney3").innerHTML = obj.sellmoney3;
			 		 		document.getElementById("sellmoney4").innerHTML = obj.sellmoney4;
			 		 		document.getElementById("sellmoney5").innerHTML = obj.sellmoney5;
			 		 		
			 		 		document.getElementById("sellmount1").innerHTML = obj.sellnum1;
			 		 		document.getElementById("sellmount2").innerHTML = obj.sellnum2;
			 		 		document.getElementById("sellmount3").innerHTML = obj.sellnum3;
			 		 		document.getElementById("sellmount4").innerHTML = obj.sellnum4;
			 		 		document.getElementById("sellmount5").innerHTML = obj.sellnum5;
			 		 		
			 		 		document.getElementById("buymoney1").innerHTML = obj.buymoney1;
			 		 		document.getElementById("buymoney2").innerHTML = obj.buymoney2;
			 		 		document.getElementById("buymoney3").innerHTML = obj.buymoney3;
			 		 		document.getElementById("buymoney4").innerHTML = obj.buymoney4;
			 		 		document.getElementById("buymoney5").innerHTML = obj.buymoney5;
			 		 		
			 		 		document.getElementById("buymount1").innerHTML = obj.sellnum1;
			 		 		document.getElementById("buymount2").innerHTML = obj.sellnum2;
			 		 		document.getElementById("buymount3").innerHTML = obj.sellnum3;
			 		 		document.getElementById("buymount4").innerHTML = obj.sellnum4;
			 		 		document.getElementById("buymount5").innerHTML = obj.sellnum5;
			 		 		
			 		 		
			 		 		
			 		 	}
					 }
				 }
				 this.popupVisible = false; 
		  },
		  buy(){
			  var vm = this;
			    var ajax5 = new XMLHttpRequest();
				 ajax5.open('post', '/buyStock');
				 ajax5.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				//发送请求
				 ajax5.send("stockId="+this.stockId+"&price="+this.price+"&num="+this.num);
				 ajax5.onreadystatechange = function () {
			         if(ajax5.readyState==4 && ajax5.status==200){
			        	 var result = (ajax5.responseText);
			    		 	var obj = result;
			    		 	if(obj == 'true'){
			    		 		alert('购买成功!');
			    		 		window.location.href="my.html";
			    		 	}else{
			    		 		alert('购买失败');
			    		 	}
				 		 	
					 }
				 }
		  }
	  }
	  
	});
</script>
</html>
