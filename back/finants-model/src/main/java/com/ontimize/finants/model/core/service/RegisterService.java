package com.ontimize.finants.model.core.service;

import com.ontimize.finants.api.core.service.IRegisterService;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.Map;


@Lazy
@Service("RegisterService")
public class RegisterService implements IRegisterService {
    private final UserService userService;
    @Autowired
    public RegisterService(UserService userService) {
        this.userService = userService;
    }
    @Override
    public EntityResult register(Map<String, Object> registrationData) throws OntimizeJEERuntimeException {
        return userService.userInsert(registrationData);
    }

}
