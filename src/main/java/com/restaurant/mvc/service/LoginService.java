package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Client;
import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.repository.ClientRepository;
import com.restaurant.mvc.service.util.ConverterUtilDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

@Service
@Validated
public class LoginService {
    @Autowired
    ClientRepository clientRepository;

    public ClientDTO verifyLogin(String login, String password) {
        Client client = clientRepository.findUserByLogin(login);
        if (client != null && client.getPassword().equals(password)) {
            return ConverterUtilDTO.convertClientToClientDTO(client);
        }
        return null;
    }

    public ClientDTO verifyLogin(String login) {
        Client client = clientRepository.findUserByLogin(login);
        if (client != null) {
            return ConverterUtilDTO.convertClientToClientDTO(client);
        }
        return null;
    }
}
