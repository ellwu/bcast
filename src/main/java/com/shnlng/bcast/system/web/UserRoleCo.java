package com.shnlng.bcast.system.web;

import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.system.domain.UserRoleRepo;
import com.shnlng.bcast.system.domain.entity.UserRoleEo;

@Controller
@RequestMapping("/userRole")
public class UserRoleCo {

	private static final Logger logger = Logger.getLogger(UserRoleCo.class);

	@Autowired
	private UserRoleRepo userRoleRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/auth/userRole/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<UserRoleEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<UserRoleEo> result = userRoleRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping(path = "/delete", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp,
			@RequestBody UserRoleEo userRole) {
		logger.debug("enter delete userRole");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (userRole == null || userRole.getId() == null) {
			logger.debug("userRole input empty");

			result.put("msg", requestContext.getMessage("userRole.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			userRoleRepo.delete(userRole);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("userRole.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("userRole.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete userRole");
		return result;
	}

	@RequestMapping(path = "/create", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp,
			@RequestBody UserRoleEo userRole) {
		logger.debug("enter create userRole");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (userRole == null) {
			logger.debug("userRole input empty");

			result.put("msg", requestContext.getMessage("userRole.create.error"));
			result.put("status", false);
			return result;
		}

		userRole.setId(IdGen.id32());

		try {
			userRole.setCreationTime(new Date());

			userRoleRepo.save(userRole);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("userRole.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("userRole.create.ok"));
		result.put("status", true);

		logger.debug("leave create userRole");
		return result;
	}

	@RequestMapping(path = "/edit", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp,
			@RequestBody UserRoleEo userRole) {
		logger.debug("enter edit userRole");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (userRole == null || StringUtils.isEmpty(userRole.getId())) {
			logger.debug("userRole input empty");

			result.put("msg", requestContext.getMessage("userRole.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			userRole.setUpdateTime(new Date());
			
			userRoleRepo.save(userRole);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("userRole.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("userRole.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit userRole");
		return result;
	}
}
