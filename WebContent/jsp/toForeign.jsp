<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KKBank | Transaction</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<%@include file="./userHeader.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<aside class="center-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">Exchange to Foreign Currency</h3>
				</div>	
				<div class="box-body">		
					 <div class="input-group">
					 	<span class="input-group-addon">RMB</span>
						<span class="input-group-addon"><i class="fa fa-exchange"></i></span>	
						<select class="form-control" id="rate_list">
							<option value="" selected>Please select the target currency</option>
						</select>
					 </div>
					<p>
					<div class="input-group">
						<span class="input-group-addon" >
							<span class="fa fa-bar-chart-o" ></span> Exchange Rate
						</span>
						<div class="form-control">
							<span id="rate_count"></span>
						</div>
					</div>
					<p>
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-arrow-up"></i> Maximum Exchange Amount
						</span>
						<div class="form-control">
							<span id="rate_maxchange"></span>
						</div>
						<span class="input-group-addon">.00</span>
					</div>
					<p>
					<form role="form" action="toForeignConfirm" method="post">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-money"></i></span>
							<input type="text" name="amount" id="amount" class="form-control"
								placeholder="Exchange Amount" required="required"> 
						<span class="input-group-addon">.00</span>
					</div>
					</form>
					<p>
					</div>
					<div class="box-footer">
						<a class="btn btn-success" id="next_btn" href="javascript:void(0)">Next</a>	
						<a class="btn btn-default" href="toForeignExchange">Return</a>	
					</div>
				</div>
	    </section>
	</aside>
</div>
 (USD, JPY, HKD, GBP and AUD)
  after selecting,show the exchange offer rate and the maximum amount the user can buy base
   on the current RMB balance
- text box to input the amount for how much foreign currency the user want to buy. 
  After inputting the amount, it will show the required RMB amount
   which is auto calculated base on the exchange offer rate. 
  - “Return” and “Next” button can be seen, 
  when click the “Return” button, will turn to foreign exchange page, 
  when click the “Next” button, it will turn to the 【confirmation page. 】

</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
var res = ${res};
var countries = ['USD', 'JPY', 'HKD', 'GBP' ,'AUD'];

$(function() {
	var dom = {
		select: $('#rate_list'),
		rate:　$('#rate_count'),
		maxChange: $('#rate_maxchange')
	};
	var list = res['showapi_res_body'].list;
	var optionTmpl = '<option value="{country}">{country}</option>';
	var balance = ${balance};
	
	// 初始化 select
	countries.map(function(country) {
		dom.select.append(optionTmpl.replace(/{country}/g, country));
	});
	
	// 绑定下拉菜单改变事件
	dom.select.on('change', updateRate);
	
	// 一开始的时候显示汇率
	updateRate();
	
	function updateRate() {
		var country = dom.select.val();
		var obj = getRate(country);
		//银行现汇卖出价 bid rate
		var rate = (+obj['hui_out']) / 100;
		
		rate = rate.toFixed(4);
		dom.rate.text(rate);
		
		
		//var reg = /(\d)(?=(\d\d\d)+(?!\d))/g; 
		//var max1 = max.replace(/(\d+\.\d*)/, function($1) {
		//	return (+$1).toFixed(2);
		//}).replace(reg, '$1,');
		
		var city = (balance/rate).toFixed(0);
		//看分子分母 ， 这里的情况人民币全为分子， 所以： 人民币/外币=利率  能换外币数=人民币/利率
		dom.maxChange.text(city);
		//如果是外币换人民币 即offer rate 银行买入价    能换的人民币=外币*利率   利率越高，能换的人民币越多，所以银行的offer rate比较低，赚
		
	}
	
	function getRate(country) {
		var map = list.filter(function(obj) {
			return obj.code === country;
		});
		
		return map[0]
	}
	console.log(list);
})
$(function() {
		var form = document.querySelector('form');
		$('#next_btn').click(function() {
				var amount = $('input[name=amount]').val();
				var balance = ${balance};
				if(amount < 50){
					$('.info-custom').show();
				}
				else if(balance < amount){
					form.amount.value="";
					form.amount.focus();
					alert('Balance is not enough.');
					
				} else {
					$('input[name="ac_No"]').val(ac_no);
					$('input[name="term"]').val(period);
					$('form').submit();
				}
			}
		});
	});

</script>
</html>