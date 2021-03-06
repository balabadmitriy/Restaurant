package com.restaurant.mvc.controller;

import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.service.IndexService;
import com.restaurant.mvc.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationController {

    @Autowired
    RegistrationService registrationService;

    @Autowired
    IndexService indexService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET, name = "getRegistration")
    public ModelAndView getRegistration(@ModelAttribute("client") @Validated ClientDTO client) {
        indexService.setTitle("Registration");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("formHandler", "/restaurant/registration");
        modelAndView.setViewName("registration");

        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView postRegistration(@ModelAttribute("client") @Validated ClientDTO client) {
        ModelAndView modelAndView = new ModelAndView();

        registrationService.createUser(client);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }
}
