package com.restaurant.mvc.aspect;

import com.restaurant.mvc.exception.ClientServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

@ControllerAdvice
public class ClientExceptionAdvice {

    @ExceptionHandler(value = ClientServiceException.class)
    public String getRegistration(ClientServiceException e){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attributes.getRequest().getSession(false);
        session.setAttribute("errorMessage",e.getMessage());
        return "redirect:registration";
    }
}
