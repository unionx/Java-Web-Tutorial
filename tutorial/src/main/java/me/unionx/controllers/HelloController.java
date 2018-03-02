package me.unionx.controllers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@EnableAutoConfiguration
public class HelloController {

    private static String name = "";

    @RequestMapping("/")
    String index() {
        return "index";
    }

    @RequestMapping("/time")
    @ResponseBody
    String showTime() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        return dateFormat.format(date);
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    String hello(Model model) {
        model.addAttribute("name", name);
        return "hello";
    }

    @RequestMapping(value = "/sayHello", method = RequestMethod.POST)
    String sayHello(String username) {
        name = username;
        return "redirect:/hello";
    }

    @RequestMapping("/plus5/{number}")
    @ResponseBody
    Map plus5(@PathVariable Integer number) {
        String calculation = "5 + " + number;
        Integer result = 5 + number;

        HashMap<String, String> returnValue = new HashMap<String, String>();
        returnValue.put("Calculation is", calculation);
        returnValue.put("Result is", result.toString());
        return returnValue;
    }

    public static void main(String[] args) {
        SpringApplication.run(HelloController.class, args);
    }

}
