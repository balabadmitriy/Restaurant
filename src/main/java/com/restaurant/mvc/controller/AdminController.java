package com.restaurant.mvc.controller;

import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    IndexService indexService;

    @RequestMapping(value = "/admin",method = RequestMethod.GET,name = "getAdmin")
    public ModelAndView getIndex(HttpSession session){
        indexService.setTitle("Administration");

        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        ModelAndView modelAndView = new ModelAndView();
        if (clientDTO != null) {
            indexService.getItemMenu(clientDTO.getRole().getId());
            modelAndView.setViewName("admin");

            return modelAndView;
        }
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }
}
