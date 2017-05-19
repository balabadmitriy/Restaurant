package com.restaurant.mvc.service.util;

import com.restaurant.mvc.domain.Client;
import com.restaurant.mvc.domain.DishCategory;
import com.restaurant.mvc.domain.Role;
import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.dto.ItemMenuDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Stepan
 */
public class ConverterUtilDTO {

    public static Client convertClientDTOToClient(ClientDTO newClient) {
        Client c = new Client();
        c.setFio(newClient.getFio());
        c.setLogin(newClient.getLogin());
        c.setPassword(newClient.getPassword());
        c.setAddressDelivery(newClient.getAddressDelivery());
        c.setEmailClient(newClient.getEmailClient());
        c.setDateOfRegistration(newClient.getDateOfRegistration());
        c.setPhoneClient(newClient.getPhoneClient());
        c.setRole(newClient.getRole());
        return c;
    }

    public static ClientDTO convertClientToClientDTO(Client newClient) {
        ClientDTO c = new ClientDTO();
        c.setFio(newClient.getFio());
        c.setLogin(newClient.getLogin());
        c.setPassword(newClient.getPassword());
        c.setAddressDelivery(newClient.getAddressDelivery());
        c.setEmailClient(newClient.getEmailClient());
        c.setDateOfRegistration(newClient.getDateOfRegistration());
        c.setPhoneClient(newClient.getPhoneClient());
        c.setRole(newClient.getRole());
        return c;
    }

    public static List<DishCategory> convertCategoryDTOToCategory(ItemMenuDTO dto, Role admin,Role client){

        List<String> nameMenu = dto.getNameMenu();
        List<String> roleMenu = dto.getRoleMenu();
        List<DishCategory> categories = new ArrayList<>();

        for (int i = 0; i < nameMenu.size(); i++){
            DishCategory category = new DishCategory();
            category.setName(nameMenu.get(i));
            if(admin.getNameRole().equals(roleMenu.get(i)))
                category.setRole(admin);
            else
                category.setRole(client);

            categories.add(category);
        }

        return categories;
    }
}
