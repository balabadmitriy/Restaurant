package com.restaurant.mvc.controller;

import com.restaurant.mvc.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/")
public class IndexController {

    @Autowired
    IndexService indexService;


    @RequestMapping(method = RequestMethod.GET, name = "getIndex")
    public ModelAndView getIndex(HttpSession session, HttpServletResponse resp) {
        indexService.setTitle("Balaba Restaurant");
        ModelAndView modelView = new ModelAndView();

        modelView.addObject("items", indexService.getItemMenu());
        modelView.setViewName("index");

        return modelView;
    }


  /*  @RequestMapping(value = "/getTitle",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody
    String getItem(){

        DishCategoryName categoryName = new DishCategoryName();
        categoryName.setName(indexService.getDishAll());

        return  new Gson().toJson(categoryName);
    }*/
}