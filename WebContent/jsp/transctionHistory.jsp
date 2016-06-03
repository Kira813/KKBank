<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="./adminJsp/headMeta.jsp"%></head>
<body class="skin-blue">
<%@include file="./adminJsp/header.jsp"%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="right-side" style="font-family:Microsoft YaHei">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">The last 10 transfer</h3>
						</div>
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
                        			<button class="btn btn-primary" id="search_btn">Search</button>
                        		</div>
                        	</div>
                        <div class="box-body no-padding">
                            <table class="table table-striped"  style="text-align:center">
                            	<thead>
                            		<tr>
	                                    <th style="text-align:center">id</th>
	                                    <th style="text-align:center">date</th>
	                                    <th style="text-align:center">type</th>
	                                    <th style="text-align:center">amount</th>
	                                </tr>
                            	</thead>
                            	<tbody>
                            	</tbody>
                            </table>
                        </div>
					</div>
					<a class="btn btn-primary" href="javascript:void(0)" id="prev_btn">Prev</a>
					<a class="btn btn-primary" href="javascript:void(0)" id="next_btn">Next</a>
					<a class="btn btn-primary" href="userIndex.action">Return</a>
				</div>
			</div>
		</section>
	</aside>
</div>
<div class="modal fade" id="simpleDialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Warn</h4>
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
		format: function(d) {
			return new Date(d);
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
		list: list,
		page: 0,
		tmpl: '<tr><td>{id}</td><td>{date}</td><td>{type}</td><td>{amount}</td></tr>',
		nothing: '<tr><td colspan="4">No Records</td></tr>',
		init: function() {
			this.bindEvent();
			this.render();
		},
		render: function() {
			var list = ([]).concat(this.list);
			var data = list.splice(this.page * 10, 10);
			var content = [];
			var tmpl = this.tmpl;
			data.map(function(item) {
				content.push(tmpl.replace('{id}', item.id).replace('{type}', item.type).replace('{amount}', item.amount).replace('{date}', timer.render(item.date)));
			});
			
			var str = content.join('') || this.nothing;
			this.el.html(str);
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
					return item.date > d[0] && item.date < d[1];
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
</body>
</html>