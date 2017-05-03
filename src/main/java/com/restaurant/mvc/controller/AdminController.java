package com.restaurant.mvc.controller;

import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.dto.ItemMenuDTO;
import com.restaurant.mvc.dto.ProcessingDTO;
import com.restaurant.mvc.service.DishCategoryService;
import com.restaurant.mvc.service.IndexService;
import com.restaurant.mvc.service.OrderService;
import com.restaurant.mvc.service.StatusService;
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
public class AdminController {

    @Autowired
    IndexService indexService;

    @Autowired
    DishCategoryService categoryService;

    @Autowired
    OrderService orderService;

    @Autowired
    private StatusService statusSirvice;


    @RequestMapping(value = "/admin",method = RequestMethod.GET,name = "getAdmin")
    public ModelAndView getIndex(HttpSession session){
        indexService.setTitle("Administration");

        ClientDTO clientDTO = (ClientDTO) session.getAttribute("client");
        ModelAndView modelAndView = new ModelAndView();
        if (clientDTO != null) {
//            indexService.getItemMenu(clientDTO.getRole().getId());


            modelAndView.addObject("orderMap",orderService.getOrderDishes());
            modelAndView.addObject("status",statusSirvice.getStatus());
            modelAndView.setViewName("admin");

            return modelAndView;
        }
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @RequestMapping(value = "/addItemMenu",method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,produces = "text/html")
    public @ResponseBody String  addItemMenu(@RequestBody ItemMenuDTO item){
        indexService.setTitle("Administration");
        categoryService.createItemMenu(item);

        return item.toString();
    }

    @RequestMapping(value = "/processingOrder",method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,
            produces = MediaType.TEXT_XML_VALUE+";charset=UTF-8")
    public @ResponseBody String  processingOrder(@RequestBody ProcessingDTO processing){
        orderService.setStatusToOrder(processing.getId(),processing.getStatus());
        return processing.getId() + " = " + processing.getStatus();
    }
}
