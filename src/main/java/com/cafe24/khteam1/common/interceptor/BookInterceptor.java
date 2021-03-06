package com.cafe24.khteam1.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BookInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(BookInterceptor.class);
	boolean member = false;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(request.getSession().getAttribute("ID") != null) {
			member = true;
		} else {
			response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
			member = false;
		}
		return member;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		 super.postHandle(request, response, handler, modelAndView);
	}
	
	 @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}