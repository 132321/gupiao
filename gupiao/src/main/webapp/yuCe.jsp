<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="./css/iconfont1.css">
  <link rel="stylesheet" href="https://unpkg.com/mint-ui/lib/style.css">
  <link rel="stylesheet" href="./css/main1.css"> 
  <title>Document</title>
</head>
<body>
  <div id="record">
    <mt-header title="充值记录" style="background:#f4f6fa;color:#000;height:50px;">
      <a href="getAllData" slot="left"></router-link>
        <mt-button icon="back" style="color:#1087ff;">返回</mt-button>
      </a>
    </mt-header>
    <div class="nav">
  	  <mt-button size="small" onclick="test1()">换一拨</mt-button>
      <mt-button size="small" onclick="test1()">股票查询</mt-button>
      <mt-button size="small" onclick="test1()">月图</mt-button>
    </div>
    <div class="record-list" :style="{height:curHeight}">
    <span style="visibility:hidden;color:red;margin-left:20px;" id="noJL">无！</span>
      <div class="item" v-for="(item, index) in lists" :key="index">
        <div class="box">
          <div>
            <div class="title">名称:{{ item.name }}</div><br>
            <div class="data">代码:{{ item.code }}</div>
          </div>
          <div class="item" v-if=" item.yuce  > 0" >
           		<div class="rmb" style="color:#f00">+{{ item.yuce }}</div>
           </div>
           <div class="item" v-if=" item.yuce  <= 0" >
           		<div class="rmb" style="color:#0f0">{{ item.yuce }}</div>
           </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <script src="https://unpkg.com/mint-ui/lib/index.js"></script>
  <script>
    var vm = new Vue({
      el: '#record',
      data() {
        return {
          lists: {},
          curHeight: 0
        }
      },
      mounted() {
    	  var vm = this;
        var h = document.documentElement.clientHeight || document.body.clientHeight;
        var ajax = new XMLHttpRequest();
   	 ajax.open('post', '/yuCe' );
   	 ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   	//发送请求
   	 ajax.send(null);
   	 ajax.onreadystatechange = function () {
            if(ajax.readyState==4 && ajax.status==200){
   		    var result = (ajax.responseText);
   		   
   		 	var obj = eval('('+result+')');
   		 	if (obj == '') {
		 		document.getElementById("noJL").style.visibility = 'visible';
		 	} else {
		 		vm.lists = obj;
		 	}
   		 	
   		 }
   	 }
 
        this.curHeight =h - 50 + 'px';
      },
      methods: {

      }
    })
  </script>
   <script type="text/javascript">
   
   	function test1() {
   		var vm = this;
   		var page = Math.ceil(Math.random()*10 + Math.random()*10);
        var h = document.documentElement.clientHeight || document.body.clientHeight;
        var ajax = new XMLHttpRequest();
	   	 ajax.open('post', '/yuCe' );
	   	 ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	   	//发送请求
	   	 ajax.send("page=" + page);
	   	 ajax.onreadystatechange = function () {
	            if(ajax.readyState==4 && ajax.status==200){
	   		    var result = (ajax.responseText);
	   		   
	   		 	var obj = eval('('+result+')');
	   		 	if (obj == '') {
			 		document.getElementById("noJL").style.visibility = 'visible';
			 	} else {
			 		vm.lists = obj;
			 	}
	   		 	
	   		 }
	   	}
   	}
  
  window.onload = function(){
	
  }
  
  </script>
</body>
</html>
