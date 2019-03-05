var vm = new Vue({
  el: '#home',
  
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
	  czzx(){
		  window.location.href="recharge.jsp";
	  },
	  ceshi(){
		  vm.$toast('更多功能,敬请期待...');
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
