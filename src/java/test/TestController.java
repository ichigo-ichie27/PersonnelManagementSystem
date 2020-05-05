package com.graduationDesign.test;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/test")
	public String testThymeleaf(Model model) {
		model.addAttribute("plabel","我是一个p标签");
		model.addAttribute("plabel2","我是第二个p标签");
		model.addAttribute("thEach",Arrays.asList("哈哈","你好","嗯嗯"));
		return "test";
	}
}
