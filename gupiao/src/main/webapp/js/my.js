var vm = new Vue({
  el: '#my',
  data() {
    return {
      name: '默认',
      id: 'Tmfnnfknkjk',
      rmb: '0',
      userlogo:'img/cat.jpg',
      errorImg: 'this.src="img/cat.jpg"',
      money:''
    }
  },
  mounted(){
	 var vm = this;
	  var ajax = new XMLHttpRequest();
	 ajax.open('post', '/mine' );
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
		 	console.log(obj);
		 	vm.money = (obj.money);
		 	/*vm.id = (obj.id);
		 	vm.rmb = (obj.money);
		 	vm.userlogo = 'images/'+ obj.username+'.jpg';*/
		 }
	 } 
  },
  methods: {
    btn() {
      this.$toast('提示信息');
    },
    cancel(){
    	if(confirm('确认退出登录吗?')){
    		this.$toast('正在注销...');
    		window.location.href="logOut";
    	}
    },
    chongzhi(){
    	window.location.href="recharge.jsp";
    }
  }
})
