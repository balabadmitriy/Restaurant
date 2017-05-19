package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.StatusOrder;
import com.restaurant.mvc.repository.StatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatusService {

    @Autowired
    StatusRepository statusRepository;

    public List<StatusOrder> getStatus() {
        List<StatusOrder> l =statusRepository.findAll();
        return l;
    }
}
