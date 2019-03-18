<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% String id = request.getParameter("id"); 
     String name = request.getParameter("name");
    %>
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
  <style>
  	ul li{
  		height:200px;
  		list-style: none;
  	}
  	img{
  		width:100%;
  	}
  	.item {
    display: inline-block;
  }
 
  .nav {
    padding: 10px;
  }
 
  .link {
    color: inherit;
    padding: 20px;
    display: block;
  }
  </style>
</head>
<body>
  <div id="k">

<mt-header title="股票走势" style="background: #f4f6fa;color:#000;height:50px;">
      <a href="getAllData" slot="left">
        <mt-button icon="back" style="color:#1087ff;">返回</mt-button>
        <input type="hidden" id="id" value="<%=id %>"/>
        <input type="hidden" id="name" value="<%=name %>"/>
      </a>
    </mt-header>
<div class="nav">
      <mt-button size="small" @click.native.prevent="active = 'tab-container1'">日图</mt-button>
      <mt-button size="small" @click.native.prevent="active = 'tab-container2'">周图</mt-button>
      <mt-button size="small" @click.native.prevent="active = 'tab-container3'">月图</mt-button>
    </div>
    <input type="hidden" value="<%=id.substring(2)%>" id="code">
    <div class="page-tab-container">
      <mt-tab-container class="page-tabbar-tab-container" v-model="active" swipeable>
        <mt-tab-container-item id="tab-container1">
        	<!-- cell组件 -->
            <mt-cell title="K线图" value="说明文字"></mt-cell>


<img src="http://image.sinajs.cn/newchart/daily/n/<%=id %>.gif" alt="">
<mt-cell title="分时图" value="说明文字"></mt-cell>
<img src="https://image.sinajs.cn/newchart/min/n/<%=id %>.gif" alt="">
   
        </mt-tab-container-item>
        <mt-tab-container-item id="tab-container2">
        	<mt-cell title="K线图" value="说明文字"></mt-cell>


<img src="http://image.sinajs.cn/newchart/weekly/n/<%=id %>.gif" alt="">
<mt-cell title="分时图" value="说明文字"></mt-cell>
<img src="https://image.sinajs.cn/newchart/weekly/n/<%=id %>.gif" alt="">
		 
        </mt-tab-container-item>
        <mt-tab-container-item id="tab-container3">
        	<mt-cell title="K线图" value="说明文字"></mt-cell>


<img src="http://image.sinajs.cn/newchart/monthly/n/<%=id %>.gif" alt="">
<mt-cell title="分时图" value="说明文字"></mt-cell>
<img src="https://image.sinajs.cn/newchart/monthly/n/<%=id %>.gif" alt=""> 
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <div id="record">
    <div class="record-list" :style="{height:curHeight}">
    <span style="visibility:hidden;color:red;margin-left:20px;" id="noJL">请在换一拨！</span>
      <div class="item" v-for="(item, index) in lists" :key="index">
        <div @click="tiaozhuan(item.code)">
          <div>
            <div class="title">{{ item.name }}预测</div><br>
          </div>
          <div class="item" v-if=" item.yuce  > 0 && item.yuce < 1" >
           		<div class="title" style="color:#f00">预计上升:+{{ item.yuce }}</div>
           </div>
          <div class="item" v-if=" item.yuce  >= 1" >
           		<div class="rmb" style="color:#f00">建议购买:+{{ item.yuce }}<i class="iconfont" style="color: #9c9a9a;">&#xe73a;</i></div>
           </div>
           <div class="item" v-if=" item.yuce  == 0" >
           		<div class="title" style="color:yellow">比较平稳，不建议购买</div>
           </div>
           <div class="item" v-if=" item.yuce  < 0" >
           		<div class="title" style="color:#0f0">预计下降:{{ item.yuce }}</div>
           </div>
        </div>
      </div>
    </div>
    </div>

	<mt-button type="danger" style="width:100%;;position:fixed;bottom:0px;left:0" @click="tiaozhuan">模拟买入</mt-button>
  </div>
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <script src="https://unpkg.com/mint-ui/lib/index.js"></script>
  <script src="./js/k.js"></script>
</body>
</html>

