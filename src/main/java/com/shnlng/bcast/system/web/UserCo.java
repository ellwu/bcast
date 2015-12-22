package com.shnlng.bcast.system.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.system.domain.UserRepo;
import com.shnlng.bcast.system.domain.entity.UserEo;

@Controller
@RequestMapping("/user")
public class UserCo {

	private static final Logger logger = Logger.getLogger(UserCo.class);

	@Autowired
	private UserRepo userRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/user/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<UserEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<UserEo> result = userRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, UserEo user) {
		logger.debug("enter delete user");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (user == null || user.getId() == null) {
			logger.debug("user input empty");

			result.put("msg", requestContext.getMessage("user.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			
			userRepo.delete(user);
			
		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("user.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("user.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete user");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, UserEo user) {
		logger.debug("enter create user");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (user == null) {
			logger.debug("user input empty");

			result.put("msg", requestContext.getMessage("user.create.error"));
			result.put("status", false);
			return result;
		}

		user.setId(IdGen.id32());
		
		try {
			user.setCreationTime(new Date());
			
			userRepo.save(user);
			
		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("user.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("user.create.ok"));
		result.put("status", true);

		logger.debug("leave create user");
		return result;
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, UserEo user) {
		logger.debug("enter edit user");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (user == null || StringUtils.isEmpty(user.getId())) {
			logger.debug("user input empty");

			result.put("msg", requestContext.getMessage("user.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			user.setUpdateTime(new Date());
			
			userRepo.save(user);
			
		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("user.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("user.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit user");
		return result;
	}
	
	@RequestMapping("/options")
	@ResponseBody
	public List<UserEo> options() {
		logger.debug("enter options");

		List<UserEo> userOptions = userRepo.findOptions();

		logger.debug("leave options");
		return userOptions;
	}
}
