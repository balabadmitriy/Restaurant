package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.domain.DishCategory;
import com.restaurant.mvc.repository.DishCategoryRepository;
import com.restaurant.mvc.repository.DishRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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

    @Autowired
    DishRepository dishRepository;

    public void setTitle(String title) {
        ServletRequestAttributes servletReq = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest req = (HttpServletRequest) servletReq.getRequest();
        req.setAttribute("title",title);
    }

    public void getItemMenu(Long idRole) {
        List<DishCategory> temp = category.findCategoryByIdRole(idRole);
       /* for (DishCategory dish : category.findCategoryByIdRole(idRole)) {
            temp.add(dish.getName());
        }*/
        System.out.println("----------> " + temp.size());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attributes.getRequest().getSession();
        session.setAttribute("listItem",temp);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class )
    public List<DishCategory> getItemMenu() {
        List<DishCategory> temp = new ArrayList<>();
        for (DishCategory category1 : category.findCategoryByIdRole(0L)){
            category1.setDish(getDishTop(category1.getId()));
            temp.add(category1);
        }
        return temp;
    }

    private List<Dish> getDishTop(Long id) {
        List<Dish> tmp = new ArrayList<>();
        List<Dish> full = dishRepository.findAllByCategoryId(id);
        if (full != null && full.size() != 0) {
            for (int i = 0; i < 3; i++) {
                tmp.add(full.get(i));
            }
        }
        return tmp;
    }

}
