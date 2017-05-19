package com.restaurant.mvc.controller;

import com.restaurant.mvc.domain.Dish;
import com.restaurant.mvc.service.BagService;
import com.restaurant.mvc.service.IndexService;
import com.restaurant.mvc.service.PaymentMethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BagController {

    @Autowired
    BagService bagService;

    @Autowired
    IndexService indexService;

    @Autowired
    private PaymentMethodService paymentMethodService;

    @RequestMapping(value = "/getBag", method = RequestMethod.GET, name = "getBag")
    public ModelAndView  getBag(HttpSession session){
        indexService.setTitle("Bags");

        ModelAndView view = new ModelAndView();

        List<Dish> dishes =  bagService.getDishForomBags(session);
        view.addObject("bagsModel", bagService.getDishForomBags(session));
        if (dishes != null)
            view.addObject("paymentsModel",paymentMethodService.findAll());

        view.setViewName("bags");
        return view;
    }

    @RequestMapping(value = "/increase", method = RequestMethod.GET, name = "increase",produces = {"text/html; charset=UTF-8"})
    public @ResponseBody String increase(@RequestParam String  increase){
        Integer val = Integer.valueOf(increase);
        return String.valueOf(val++);
    }

    @RequestMapping(value = "/setSessionBag", method = RequestMethod.POST, name = "setSessionBag")
    public @ResponseBody String  setSessionBag(@RequestParam(value = "sessionReq") List<String>  sessionReq,
                                               @RequestParam(value = "payment") String payment,
                                               @RequestParam(value = "del") String del,
                                               HttpSession session){
        session.setAttribute("sessionReq",sessionReq);
        session.setAttribute("payment",payment);
        session.setAttribute("del",del);
        return sessionReq.toString();
    }
}
