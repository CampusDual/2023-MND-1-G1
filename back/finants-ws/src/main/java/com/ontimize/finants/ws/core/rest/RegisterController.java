package com.ontimize.finants.ws.core.rest;

import com.ontimize.finants.api.core.service.IRegisterService;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.Map;

@RestController
@RequestMapping("/app")
public class RegisterController extends ORestController<IRegisterService> {
    @Autowired
    private IRegisterService registerServ;

    @Override
    public IRegisterService getService() {
        return this.registerServ;
    }

    @RequestMapping(
            value = "/register",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<EntityResult> registerNewUser(@RequestBody Map<String, Object> registrationData) {
        Map<String, Object> data = (Map<String, Object>) registrationData.get("data");
        EntityResult result = (EntityResult) registerServ.register(data);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
