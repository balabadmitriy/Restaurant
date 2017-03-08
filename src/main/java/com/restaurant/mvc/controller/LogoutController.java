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
public class LogoutController {

    @Autowired
    IndexService indexService;

    @RequestMapping(value = "/logout",method = RequestMethod.GET,name = "getLogout")
    public ModelAndView getLogout(HttpSession session){

        indexService.setTitle("Balaba Restaurant");

        ModelAndView modelView = new ModelAndView();
        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        if (clientDTO != null){
            session.removeAttribute("client");
        }
        indexService.getItemMenu(null);
        modelView.setViewName("redirect:/");
        return modelView;
    }
}
