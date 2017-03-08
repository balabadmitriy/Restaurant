package com.restaurant.mvc.service.util;

import com.restaurant.mvc.domain.Client;
import com.restaurant.mvc.dto.ClientDTO;

/**
 * @author Stepan
 */
public class ClientConverterUtil {

    public static Client convertClientDTOToClient(ClientDTO newClient) {
        Client c = new Client();
        c.setFio(newClient.getFio());
        c.setLogin(newClient.getLogin());
        c.setPassword(newClient.getPassword());
        c.setAddressDelivery(newClient.getAddressDelivery());
        c.setBill(newClient.getBill());
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
        c.setBill(newClient.getBill());
        c.setEmailClient(newClient.getEmailClient());
        c.setDateOfRegistration(newClient.getDateOfRegistration());
        c.setPhoneClient(newClient.getPhoneClient());
        c.setRole(newClient.getRole());
        return c;
    }

}
