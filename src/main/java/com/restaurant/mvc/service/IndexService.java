package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.DishCategory;
import com.restaurant.mvc.repository.DishCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
@Scope(value = "prototype",proxyMode = ScopedProxyMode.TARGET_CLASS)
public class IndexService {

    @Autowired
    DishCategoryRepository category;

    public void setTitle(String title) {
        ServletRequestAttributes servletReq = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest req = (HttpServletRequest) servletReq.getRequest();
        req.setAttribute("title",title);
    }

    public void getItemMenu(Integer idRole) {
        List<String> temp = new ArrayList<>();
        for (DishCategory dish : category.findCategoryByIdRole(idRole)) {
            temp.add(dish.getName());
        }
        System.out.println("---------------"+temp.size());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attributes.getRequest().getSession();
        session.setAttribute("listItem",temp);
    }
}
