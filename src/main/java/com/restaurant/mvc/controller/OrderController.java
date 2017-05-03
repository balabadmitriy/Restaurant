package com.restaurant.mvc.controller;

import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.dto.GetPayFromClient;
import com.restaurant.mvc.service.IndexService;
import com.restaurant.mvc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class OrderController {

    @Autowired
    IndexService indexService;

    @Autowired
    OrderService orderService;


    @RequestMapping(value = "/order", method = RequestMethod.GET, name = "getOrder")
    public ModelAndView getOrder(HttpSession session){
        indexService.setTitle("My orders");
        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        ModelAndView view = new ModelAndView();

        if(clientDTO != null) {
            if (clientDTO.getRole().getNameRole().equals("CLIENT")) {
                view.addObject("orders", orderService.addOrderAndGetOrder(session, clientDTO));
                view.setViewName("myorder");
            } else {
                view.setViewName("redirect:admin");
            }
        }
            return view;
    }

    @RequestMapping(value = "/sendToPayOrder", method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,produces = MediaType.TEXT_HTML_VALUE+";charset=UTF-8",
            name = "sendToPayOrder")
    public @ResponseBody String  sendToPayOrder(@RequestBody GetPayFromClient pay,
                        HttpSession session){
        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        ModelAndView view = new ModelAndView();

        if(clientDTO != null) {
           return "ppppp";
        }
        return "111";
    }
}
