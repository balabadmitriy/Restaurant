package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Role;
import com.restaurant.mvc.dto.ItemMenuDTO;
import com.restaurant.mvc.repository.DishCategoryRepository;
import com.restaurant.mvc.repository.RoleRepository;
import com.restaurant.mvc.service.util.ConverterUtilDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DishCategoryService {

    @Autowired
    DishCategoryRepository categoryRepository;

    @Autowired
    RoleRepository roleRepository;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class )
    public void createItemMenu(ItemMenuDTO item) {
        Role roleClient = roleRepository.findRoleByName("CLIENT");
        Role roleAdmin = roleRepository.findRoleByName("ADMINISTRATOR");

        ConverterUtilDTO.convertCategoryDTOToCategory(item,roleAdmin,roleClient)
                .forEach(categories -> categoryRepository.save(categories));

    }
}
