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
		String ID = (String)session.get("loginID");

		if(ID == null){
			ctx.put("tip" , "You have not logged in. Please login.");
			return "userLogin"; 
		} else{
			ctx.put("ID",ID);
		}
		
		// 返回视图
		return invocation.invoke();
	}
}
