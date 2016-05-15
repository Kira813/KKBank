package com.kkbank.util.filter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.StrutsResultSupport;
import org.apache.struts2.json.JSONResult;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.config.entities.ActionConfig;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class ActionDebugInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L;

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init() {
		// TODO Auto-generated method stub

	}

	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("-----------Action动作...begin-----------");
		String actionName = invocation.getAction().getClass().getName();	        
		int index = actionName.indexOf("$$");
		if (index > -1) {
			actionName = actionName.substring(0, index);
		}
		System.out.println("请求 Action 名称:" + actionName);
		ActionProxy proxy = invocation.getProxy();
		ActionConfig config = proxy.getConfig();
		System.out.println("调用 method:" + config.getMethodName());
		System.out.println("传给 action 参数:");
		// ????????????request.parameters
		Map<String, Object> parameters = invocation.getInvocationContext().getParameters();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		ActionContext ctx = invocation.getInvocationContext();
		ctx.put("path", basePath);
		
		for (String key : parameters.keySet()) {
			String[] params = (String[]) parameters.get(key);
			StringBuffer buffer = new StringBuffer();
			for (String param : params) {
				buffer.append("," + param);
			}
			String paramValue = buffer.toString();
			paramValue = paramValue.substring(1);
			System.out.println("\t" + key + "=" + paramValue);
		}
		
		final String resultCode = invocation.invoke();
		if(!"file".equals(resultCode))
		{
			try
			{
				if(invocation.getResult() instanceof JSONResult)
				{
					System.out.println("json result");
				}
				else if(invocation.getResult() instanceof StrutsResultSupport)
				{
					StrutsResultSupport result = (StrutsResultSupport)invocation.getResult();
					if (result != null) {
						System.out.println("返回 jsp 页面:" + result.getLocation());
					}
					System.out.println("-----------Action动作...end-----------\n");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return resultCode;
	}

}
