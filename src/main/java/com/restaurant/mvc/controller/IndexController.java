package com.restaurant.mvc.controller;

import com.restaurant.mvc.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    IndexService indexService;


    @RequestMapping(value = "/",method = RequestMethod.GET,name = "getIndex")
    public ModelAndView getIndex(HttpSession session){
        indexService.setTitle("Balaba Restaurant");
        ModelAndView modelView = new ModelAndView();

        modelView.setViewName("index");

        return modelView;
    }

}
