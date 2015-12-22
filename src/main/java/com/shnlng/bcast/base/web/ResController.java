package com.shnlng.bcast.base.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResController {
	private static final Logger logger = Logger.getLogger(ResController.class);
	
	@RequestMapping("/res")
	public String getResource(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter getResource");

		String path = req.getParameter("path");
		if(StringUtils.isEmpty(path)){
			return "404";
		}
		
		logger.debug("leave getResource");
		return path;
	}

}
