package me.unionx.controllers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@EnableAutoConfiguration
public class HelloController {

    @RequestMapping("/")
    @ResponseBody
    String hello() {
        return "Hello, world.";
    }

    @RequestMapping("/time")
    @ResponseBody
    String showTime() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        return dateFormat.format(date);
    }

    @RequestMapping("/hello/{name}")
    String hello(Model model, @PathVariable String name) {
        model.addAttribute("name", name);
        return "hello";
    }

    @RequestMapping("/plus5/{number}")
    @ResponseBody
    Integer plus5(@PathVariable Integer number) {
        return 5 + number;
    }

    @RequestMapping("/home")
    String home() {
        return "index";
    }

    public static void main(String[] args) {
        SpringApplication.run(HelloController.class, args);
    }

}
