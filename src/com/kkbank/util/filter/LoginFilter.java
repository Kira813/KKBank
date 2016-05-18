package com.kkbank.util.filter;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginFilter extends AbstractInterceptor{

	public String intercept(ActionInvocation invocation) throws Exception
	{
		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();
		Integer power = (Integer) session.get("power");
		
		return invocation.invoke();
		
//		if(power == null){
//			ctx.put("tip" , "error password");
//			return "toLogin"; 
//		} else{
//			ctx.put("power", power);
//			String name = (String) session.get("name");
//			Integer id = (Integer) session.get("id");
//			ctx.put("id", id);
//			ctx.put("name",name);
//		}
		// 返回视图
//		return invocation.invoke();
	}
}
