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
<title>KKBank | Transaction History</title>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
</head>
<body>
<div class="container">
<%@include file="./userHeader.jsp"%>
</div>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked left-nav-custom">
				    <li role="presentation" class="active">
				        <a href="toAccountEnquiry">Account Enquiry</a>
				    </li>
				    <li role="presentation">
				        <a href="fund/listFund">Fund</a>
				    </li>
				    <li role="presentation">
				        <a href="toTimeDeposit">Time Deposit</a>
				    </li>
				    <li role="presentation">
				        <a href="toTransfer">Transfer</a>
				    </li>
				    <li role="presentation">
				        <a href="toForeignExchange">Foreign Exchange</a>
				    </li>
				    <li role="presentation">
				        <a href="user/toPayment">Payment</a>
				    </li>
				</ul>
			</div>
			<div class="col-md-9">
				<aside class="right-content-custom" style="font-family:Microsoft YaHei">
					<section>
						<div class="box box-grey">
							<div class="box-header">
								<h3 class="box-title" style="font-family:Microsoft YaHei">History Transaction Records</h3>
							</div>
							<div class="box-body">
													<div class="row">
                        		<div class="col-md-10">
									<div class="form-group" style="padding-left: 10px;">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right active"
												id="reservation">
										</div>
									</div>
								</div>
                        		<div class="col-md-2">
                        			<button class="btn" style="color:white;background-color:grey"  id="search_btn">Search</button>
                        		</div>
                        	</div>
                        <div class="box-body no-padding">
                            <table class="table table-striped"  style="text-align:center">
                            	<thead>
                            		<tr>
	                                    <th style="text-align:center">ID</th>
	                                    <th style="text-align:center">Transaction Date</th>
	                                    <th style="text-align:center">Transaction Type</th>
	                                    <th style="text-align:center">Transaction Amount</th>
	                                </tr>
                            	</thead>
                            	<tbody>
                            	</tbody>
                            </table>
                        </div>
							</div>
							<div class="box-footer">
								<a class="btn" style="color:white;background-color:grey"  href="javascript:void(0)" id="prev_btn">Prev</a>
								<a class="btn" style="color:white;background-color:grey"  href="javascript:void(0)" id="next_btn">Next</a>
								<a class="btn btn-default"  href="toAccountEnquiry.action">Return</a>
							</div>
						</div> 
				    </section>
				</aside>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="simpleDialog" style="font-family:Microsoft YaHei">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" style="font-family:Microsoft YaHei">Warning</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" data-dismiss="modal"
					aria-label="Close">Return</a>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="./adminJsp/javascript.jsp"%>
<script type="text/javascript">
	var list = [
		<s:iterator value="#list" status="st">
		{
			id: ${st.index + 1},
			date: new Date('<s:date name="date" format="yyyy.MM.dd" />'),
			type: '${type}',
			amount: ${amount}
		},
         </s:iterator>
	];
	
	var dialog = {
		el: $('#simpleDialog'),
		show: function(msg) {
			this.el.find('.modal-body').text(msg);
			this.el.modal('show');
		},
		hide: function() {
			this.el.modal('hide');
		}
	};
	
	var timer = {
		el: $('#reservation'),
		format: function(d, idx) {
			var ret = new Date(d);
			return idx === 0 ? ret : new Date(ret.setDate(ret.getDate() + 1));
		},
		render: function(d) {
			return d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
		},
		getTime: function() {
			var val = this.el.val();
			if(val) {
				var date = val.split(' - ');
				return date.map(this.format);
			} else {
				return false;
			}
		}
	};
	
	var tableCtl = {
		el: $('table tbody'),
		list: [],
		page: 0,
		timer: null,
		tmpl: '<tr><td>{id}</td><td>{date}</td><td>{type}</td><td style="{inlineStyle}">{amount}</td></tr>',
		nothing: '<tr><td colspan="4">No Records</td></tr>',
		init: function() {
			this.list = list.map(this.formatAmount);
			this.bindEvent();
			this.render();
		},
		formatAmount: function(item){
			val = +item.amount; //转数字
			val = val.toFixed(2) + ''; //加小数点
			var reg = /(\d)(?=(\d\d\d)+(?!\d))/g; 
    		val = val.replace(reg, '$1,');
    		item.amount = val;
    		return item;
		},
		render: function() {
			var list = ([]).concat(this.list);
			var data = list.splice(this.page * 10, 10);
			var content = [];
			var tmpl = this.tmpl;
			
			data.map(function(item) {
				var plus = item.type.match(/^(Transfer in|Deposit|Fund Sell)/i);
				var inlineStyle = plus ? 'color:red' : 'color:green';
				if(plus){
					content.push(tmpl.replace('{id}', item.id).replace('{type}', item.type).replace('{amount}', item.amount).replace('{date}', timer.render(item.date)).replace('{inlineStyle}', inlineStyle));
				}else{
					content.push(tmpl.replace('{id}', item.id).replace('{type}', item.type).replace('{amount}', '-'+item.amount).replace('{date}', timer.render(item.date)).replace('{inlineStyle}', inlineStyle));
				}
				
			});
			
			var str = content.join('') || this.nothing;
			
			if(this.timer) {
				loading.show();
			}
			
			clearTimeout(this.timer);
			this.timer = setTimeout(function() {
				this.el.html(str);
				loading.hide();
			}.bind(this), 500);
			
		},
		next: function() {
			var page = this.page + 1;
			var max = Math.floor(this.list.length / 10);
			
			if(page > max) {
				dialog.show('It\'s the last page.');
			} else {
				this.page = page;
				this.render();
			}
		},
		prev: function() {
			var page = this.page - 1;
			var min = 0;
			
			if(page < min) {
				dialog.show('It\'s the first page.');
			} else {
				this.page = page;
				this.render();
			}
		},
		search: function() {
			this.updateList();
			this.page = 0;
			this.render();			
		},
		updateList: function() {
			var d = timer.getTime();
			if(d) {
				this.list = list.filter(function(item) {
					return item.date >= d[0] && item.date <= d[1];
				});
			} else {
				this.list = list;
			}
		},
		bindEvent: function() {
			var self = this;
			$('#prev_btn').on('click', function() {
				self.prev();
			});
			$('#next_btn').on('click', function() {
				self.next();
			});
			$('#search_btn').on('click', function() {
				self.search();
			});
		}
	}
	$(function() {
	    $('#reservation').daterangepicker();
	    tableCtl.init();
	});
</script>
</html>