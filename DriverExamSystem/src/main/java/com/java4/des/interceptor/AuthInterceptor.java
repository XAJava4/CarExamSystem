package com.java4.des.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.java4.des.auth.Authpassport;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
            Authpassport authPassport = ((HandlerMethod) handler).getMethodAnnotation(Authpassport.class);
            String logined=(String) request.getSession().getAttribute("logined");
            //没有声明需要权限,或者声明不验证权限
                if(authPassport == null || authPassport.validate() == false)
                return true;
            else{                
                //在这里实现自己的权限验证逻辑
            	
                if(logined != null)//如果验证成功返回true（这里直接写false来模拟验证失败的处理）
                    return true;
                else
                	//如果验证失败
                {
                    //返回到登录界面
                    response.sendRedirect("index");
                    return false;
                }       
            }
        }
        else
            return true;   
     }
}
