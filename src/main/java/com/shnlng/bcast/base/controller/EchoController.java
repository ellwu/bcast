package com.shnlng.bcast.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EchoController {

	@RequestMapping("/echo")
	public String echo(){
		return "index";
	}
}
