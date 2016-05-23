/**
 * Send a request to make sure the auth_code is correct, need jQuery support
 * @param	{String}	auth_code
 * @param	{Function}	onSuccess	A function to be execute when get right result, to do something like submiting the form
 * @param	{Function}	onSuccess	A function to be execute when get error result, to do something like alert error dialog
 */
function validAuthCode(auth_code, onSuccess, onError) {
	var action = 'ajax/validAuthCodeAjax.action';

	// 发送请求到 action
	$.post(action, {
		'auth_code': auth_code
	}, function(data) {
		// 处理结果，data 的内容为 {status: true} 或者 {status: false}
		if(data.status) {
			onSuccess();
		} else {
			onError();
		}
	});
}