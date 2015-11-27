package com.shnlng.bcast.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.system.entity.MenuEo;
import com.shnlng.bcast.system.service.MenuSo;

@Controller
@RequestMapping("/menu")
public class MenuCo {
	private static final Logger logger = Logger.getLogger(MenuCo.class);
	
	@Autowired
	private MenuSo menuService;
	
	@RequestMapping("/find")
	@ResponseBody
	public MenuEo findMenu(@RequestParam String key){
		logger.debug("enter findMenu");
		
		logger.debug("find menu " + key);
		MenuEo menu = menuService.getMenu(key);
		
		logger.debug("leave findMenu");
		return menu;
	}
	
	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model){
		logger.debug("enter home");
		
		logger.debug("enter home");
		return "/system/auth/menu/home";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Page<MenuEo> list(Pageable pageable){
		logger.debug("enter list");
		
		Page<MenuEo> result = menuService.getAllMenus(pageable);
		
		logger.debug("leave list");
		return result;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, MenuEo menu){
		logger.debug("enter delete menu");

		Map<String, Object> result = new HashMap<String, Object>();
		
		RequestContext requestContext = new RequestContext(req);
		
		if(menu == null || menu.getId() == null){
			logger.debug("menu input empty");
			
			result.put("msg", requestContext.getMessage("menu.delete.error"));
			result.put("status", false);
			return result;
		}
		
		boolean deleted = menuService.deleteMenu(menu);
		if(deleted){
			
			result.put("msg", requestContext.getMessage("menu.delete.ok"));
			result.put("status", true);
			return result;
		}
		
		logger.debug("enter delete menu");
		return result;
	}
	
	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, MenuEo menu){
		logger.debug("enter create menu");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		RequestContext requestContext = new RequestContext(req);
		
		if(menu == null){
			logger.debug("menu input empty");
			
			result.put("msg", requestContext.getMessage("menu.create.error"));
			result.put("status", false);
			return result;
		}
		
		menu.setId(IdGen.id32());
		
		MenuEo savedMenu = menuService.saveMenu(menu);
		if(savedMenu != null){
			
			result.put("msg", requestContext.getMessage("menu.create.ok"));
			result.put("status", true);
			return result;
		}
		
		logger.debug("leave create menu");
		return result;
	}
}
