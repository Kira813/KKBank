<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- jQuery 2.0.2 -->
<script src="resource/js/jquery.min.js"></script>
<!-- jQuery UI 1.10.3 -->
<script src="resource/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="resource/js/bootstrap.min.js" type="text/javascript"></script>
<!-- Morris.js charts -->
<script src="resource/js/raphael-min.js"></script>
<script src="resource/js/plugins/morris/morris.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="resource/js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="resource/js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="resource/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="resource/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="resource/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

<!-- AdminLTE App -->
<script src="resource/js/AdminLTE/app.js" type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="resource/js/AdminLTE/dashboard.js" type="text/javascript"></script> -->

<!-- Bootbox -->
<script src="resource/js/bootbox.min.js" type="text/javascript"></script>

<script type="text/javascript">
	/**
	 * 格式化金额
	 */
	$(function() {
		$('[format-balance]').each(function(idx, item) {
			var el = $(item); //拿到jquery对象
			var val = el.text(); //把jquery对象的字符串拿出来
			
			val = $.trim(val); //去除字符串两边空格
			val = +val; //转数字
			val = val.toFixed(2) + ''; //加小数点
			var reg = /(\d)(?=(\d\d\d)+(?!\d))/g; 
    		val = val.replace(reg, '$1,');
    		el.text(val);
		});
	});
</script>