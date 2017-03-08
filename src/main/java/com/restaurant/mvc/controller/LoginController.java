package com.restaurant.mvc.controller;

import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.service.IndexService;
import com.restaurant.mvc.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    @Autowired
    IndexService indexService;
/*
    @RequestMapping(value = "/login", method = RequestMethod.POST, name = "postLogin")
    public String postLogin(@RequestParam(value = "login") @Validated String login,
                            @RequestParam(value = "password") @Validated String password,
                            HttpSession session) {
        System.out.println("login = " + login);
        System.out.println("password = " + password);

        ClientDTO clientDTO = loginService.verifyLogin(login.substring(1,login.length())
                , password.substring(1,password.length()));

        if (clientDTO == null) {
            session.setAttribute("errorMessage", "Login incorrect");
            return "redirect:login";
        }

        session.setAttribute("success", "Successfully logged in");
        session.setAttribute("client", clientDTO);
        if (clientDTO.getRole().getNameRole().equals("ADMINISTRATOR") == true) {
            return "redirect:admin";
        }
        return "redirect:profile";
    }*/



/*
    @RequestMapping(value = "/myjquery",method = RequestMethod.POST,produces = "text/html")
    public @ResponseBody String postAjax(@RequestParam("login") String login,
                                         HttpSession session) {
        ClientDTO clientDTO = loginService.verifyLogin(login);

        if (clientDTO == null) {
            return "{\"login\":\"no\",\"gotourl\":\"\"}";
        }
        session.setAttribute("success", "Successfully logged in");
        session.setAttribute("client", clientDTO);
        if (clientDTO.getRole().getNameRole().equals("ADMINISTRATOR") == true) {
            return "{\"login\":\"yes\",\"gotourl\":\"admin\"}";
        }
        return "{\"login\":\"yes\",\"gotourl\":\"profile\"}";
    }
*/

    @RequestMapping(value = "/myjquery",method = RequestMethod.POST,produces = "text/html")
    public @ResponseBody String postAjax(@RequestParam(value = "login") @Validated String login,
                            @RequestParam(value = "password") @Validated String password,
                            HttpSession session) {

        ClientDTO clientDTO = loginService.verifyLogin(login,password);

        if (clientDTO == null) {
            return "no";
        }

        session.setAttribute("success", "Successfully logged in");
        session.setAttribute("client", clientDTO);
        if (clientDTO.getRole().getNameRole().equals("ADMINISTRATOR") == true) {
            return "admin";
        }
        return "profile";
    }


}
