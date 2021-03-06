var vm = new Vue({
  el: '#k',
  data() {
    return {
    	active: 'tab-container1',
    		lists: {},
            curHeight: 0
    }
  },
  mounted(){
	  var vm = this;
	     var ajax = new XMLHttpRequest();
	   	 ajax.open('post', '/yuCeEach' );
	   	 ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	   	 var h = document.documentElement.clientHeight || document.body.clientHeight;
	   	 var id = document.getElementById("id").value;
	   	 var name = document.getElementById("name").value;
	   	//发送请求
	   	 ajax.send("stockId=" + id+"&name="+name);
	   	 ajax.onreadystatechange = function () {
	            if(ajax.readyState==4 && ajax.status==200){
	   		    var result = (ajax.responseText);
	   		 	var obj = eval('('+result+')');
	   		 	if (obj == '') {
	   		 		
			 	} else {
			 		vm.lists = obj;
			 	}
	   		 	
	   		 }
	   	 }
	   	 this.curHeight =h - 50 + 'px';
	 /*var vm = this;
	  var ajax = new XMLHttpRequest();
	 ajax.open('post', '/jzx/mine' );
	 ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	//发送请求
	 ajax.send(null);
	 ajax.onreadystatechange = function () {
         if(ajax.readyState==4 && ajax.status==200){
		    var flag = (ajax.responseText);
		    if(flag == ''){
		    	alert("登录已超时");
		    	window.location.href="login.jsp";
		    }
		 	var obj = eval("("+flag+")");  
		 	vm.name = (obj.username);
		 	vm.id = (obj.id);
		 	vm.rmb = (obj.money);
		 	vm.userlogo = 'images/'+ obj.username+'.jpg';
		 }
	 }  */
  },
  methods: {
    btn() {
      this.$toast('提示信息');
    },
    cancel(){
    	if(confirm('确认退出登录吗?')){
    		this.$toast('正在注销...');
    		window.location.href="logout";
    	}
    },
    chongzhi(){
    	window.location.href="recharge.jsp";
    },
    tiaozhuan(){
    	var code = document.getElementById("code").value;
    	window.location.href="buy.jsp?code='" + code + "'";
    }
  }
})
