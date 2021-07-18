package com.awsbt.ngspringboot.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//we allow localhost:4200 for testing purposes
@CrossOrigin(origins = "http://192.168.1.6:7003")
public class HelloController {

 @RequestMapping(value = "/message", produces = MediaType.APPLICATION_JSON_VALUE)
 public Map<String, String> index() {
     return Collections.singletonMap("message", "Greetings from awsbt Spring Boot!");
 }

}
