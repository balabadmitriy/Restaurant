package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Client;
import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.exception.ClientServiceException;
import com.restaurant.mvc.repository.ClientRepository;
import com.restaurant.mvc.service.util.ClientConverterUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegistrationService {

    @Autowired
    ClientRepository clientRepository;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class )
    public void createUser(ClientDTO newClient) {
        try {
            System.out.println("------------------------------------------");
            Client client = ClientConverterUtil.convertClientDTOToClient(newClient);
            clientRepository.save(client);
        } catch (JpaSystemException e) {
            throw new ClientServiceException("Client already exist");
        }
    }
}
