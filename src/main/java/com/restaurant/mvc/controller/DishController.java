package com.restaurant.mvc.controller;

import com.restaurant.mvc.domain.DishCategory;
import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.service.DishService;
import com.restaurant.mvc.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller
public class DishController {

    @Autowired
    private DishService dishService;

    @Autowired
    private IndexService indexService;

    @RequestMapping(value = "/postDish",method = RequestMethod.POST,name = "postDish")
    public ModelAndView postDish(@ModelAttribute("dto") DishCategory category){
        ModelAndView modelView = new ModelAndView();


        modelView.addObject("dishes", dishService.getDishAll(category.getId()));
        modelView.setViewName("dishTempl");
        return modelView;
    }

    @RequestMapping(value = "/getDish",method = RequestMethod.GET,name = "getDish")
    public ModelAndView   getDish(@RequestParam("id") String id, @RequestParam("name") String name,
                                  HttpSession session) throws UnsupportedEncodingException {
        ModelAndView modelView = new ModelAndView();
        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        if (clientDTO != null) {
            if (clientDTO.getRole().getNameRole().equals("CLIENT")) {


                modelView.addObject("dishes", dishService.getDishAll(Long.parseLong(id)));
                modelView.addObject("topMenu", name);
                modelView.setViewName("dishTempl");
            } else {
                modelView.addObject("topMenu", name);
                modelView.setViewName("addMenu");
            }
        }
            return modelView;
    }
}
