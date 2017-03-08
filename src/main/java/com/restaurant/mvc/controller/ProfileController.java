package com.restaurant.mvc.controller;

import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.service.IndexService;
import com.restaurant.mvc.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ProfileController {

    @Autowired
    ProfileService profileService;

    @Autowired
    IndexService indexService;


    @RequestMapping(value = "/profile", method = RequestMethod.GET, name = "getProfile")
    public ModelAndView getRegistration(HttpSession session) {
        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        ModelAndView modelAndView = new ModelAndView();
        if (clientDTO != null ){
            indexService.setTitle(clientDTO.getFio());
            profileService.addImg();
            System.out.println("------------------");
            return profileService.getRedirectModel(clientDTO, modelAndView);
        }
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }
}
