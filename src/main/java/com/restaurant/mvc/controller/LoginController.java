package com.restaurant.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

/*    @Autowired
    LoginService loginService;*/

    @RequestMapping(value = "/login", method = RequestMethod.GET, name = "getLogin")
    public ModelAndView getLogin() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

   /* @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "login") String login,
                        @RequestParam(value = "password") String password, HttpSession session) {
        ClientDTO userDTO = loginService.verifyLogin(login, password);
        if (userDTO == null) {
            session.setAttribute("errorMessage", "User doesn't exist");
            return "redirect:login";
        }
        if (userDTO.getRole() == Role.ADMIN) {
            return "redirect:admin";
        }
        return "redirect:chat";
    }*/
}
