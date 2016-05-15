package com.kkbank.util.filter;


import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminFilter extends AbstractInterceptor{
	public String intercept(ActionInvocation invocation) throws Exception
	{
		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();
		Integer power = (Integer) session.get("power");
		
		if(power < 2){
			ctx.put("tip" , "权限不足");
			return "toLogin"; 
		} 
		invocation.invoke();
		return null;
	}
}
