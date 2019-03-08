<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/iconfont.css">
  <link rel="stylesheet" href="https://unpkg.com/mint-ui/lib/style.css">
  <link rel="stylesheet" href="./css/main.css"> 
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
    <div class="my-head">
      <img src="./img/img5.jpg" />
      <div class="user">
        <div class="user-img">
           <img :src="userlogo"  :onerror="errorImg" style="border-radius: 50px;"/>  
        </div>
        <p class="name">昵称：{{ name }}</p>
        <p style="font-size:13px"><!-- ID：{{ id }} --></p>
      </div>
    </div>
    <div class="list-wrapper">
      <div class="yuan">
     
       <span style="font-size: 14px;"> ID：{{ id }}</span></br>
       <!--  <span class="balance">{{ rmb }}</span></br>
        <span>余额(元)</span> -->
      </div>
      <div class="chong" onclick="javascript:window.location.href='recharge.jsp?url=my.jsp'">
        <a>
          <img src="./img/chong.jpg" />
        </a>
      </div>
    </div>
    <div class="h-lists">
      <mt-cell title="充值记录" is-link style="border-top: 1px solid #f2f3f7;padding: 0 10px;" onclick="record()">
        <img slot="icon" src="./img/chongzhi.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
     <!--  <mt-cell title="消费记录" is-link style="border-top: 1px solid #f2f3f7;padding: 0 10px;" onclick="consumption()">
        <img slot="icon" src="./img/xiaofei.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell> -->
      <mt-cell title="订单查询" is-link style="border-top: 1px solid #f2f3f7;padding: 0 10px;" onclick="javascript:window.location.href='order.jsp?url=my.jsp'">
        <img slot="icon" src="./img/chaxun.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
      <mt-cell title="修改资料" is-link to="updater" style="border-top: 1px solid #f2f3f7;padding: 0 10px;">
        <img slot="icon" src="./img/xiugai.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
      <span onclick="cancel()">
      <mt-cell title="退出登录" is-link style="border-top: 1px solid #f2f3f7;padding: 0 10px; margin-bottom:66px;"  >
        <img slot="icon" src="./img/tuichu.jpg" width="24" height="24" style="margin-right:15px;">
      </mt-cell>
      </span>
    </div>
    <div class="tabs" style="background-color: #fff">
      <a href="home.jsp">
        <i class="iconfont" style="color: #9c9a9a;">&#xe73e;</i></br>
        <span class="special">首页</span>
      </a>
      <a href="my.jsp">
        <i class="iconfont" style="color: #37a6ff;">&#xe501;</i></br>
        <span>我的</span>
      </a>
    </div>
  </div>
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <script src="https://unpkg.com/mint-ui/lib/index.js"></script>
  <script src="./js/my.js"></script>
</body>
</html>
