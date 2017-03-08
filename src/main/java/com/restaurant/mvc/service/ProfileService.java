package com.restaurant.mvc.service;

import com.restaurant.mvc.dto.ClientDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class ProfileService {

    @Autowired
    IndexService indexService;

    public void addImg() {
        File[] flist;
        File f = new File("/home/dimon/Documents/ipWEB/Task/_Restaurant/Restaurant/src/main/webapp/static/img/profile");

        flist = f.listFiles();
        List<String> listImg = new ArrayList<>();

        Arrays.stream(flist).forEach(i -> {
            listImg.add("/static/img/profile/" + i.getName());
        });

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attributes.getRequest().getSession();
        session.setAttribute("listImg",listImg);
    }


    public ModelAndView getRedirectModel(ClientDTO clientDTO, ModelAndView modelAndView) {

        indexService.getItemMenu(clientDTO.getRole().getId());

        if(clientDTO.getRole().getNameRole().equals("CLIENT"))
        {
            modelAndView.setViewName("profile");
            return modelAndView;
        }else {
            modelAndView.setViewName("redirect:admin");
            return modelAndView;
        }
    }
}
