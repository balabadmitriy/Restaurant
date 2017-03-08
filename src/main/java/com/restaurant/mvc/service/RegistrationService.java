package com.restaurant.mvc.service;

import com.restaurant.mvc.domain.Client;
import com.restaurant.mvc.domain.Role;
import com.restaurant.mvc.dto.ClientDTO;
import com.restaurant.mvc.exception.ClientServiceException;
import com.restaurant.mvc.repository.ClientRepository;
import com.restaurant.mvc.repository.RoleRepository;
import com.restaurant.mvc.service.util.ClientConverterUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;


@Service
@Validated
public class RegistrationService {

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    RoleRepository roleRepository;


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class )
    public void createUser(ClientDTO newClient) {
        try{
            Role role = roleRepository.findRoleByName("CLIENT");

            Client client = ClientConverterUtil.convertClientDTOToClient(newClient);
            client.setRole(role);
            clientRepository.save(client);
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            HttpSession session = attributes.getRequest().getSession();
            session.setAttribute("client",client);
        } catch (JpaSystemException e) {
            throw new ClientServiceException("Client already exist");
        }
    }
}
