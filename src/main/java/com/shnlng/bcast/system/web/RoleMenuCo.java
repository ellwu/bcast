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
import com.shnlng.bcast.system.domain.RoleMenuRepo;
import com.shnlng.bcast.system.domain.entity.RoleMenuEo;

@Controller
@RequestMapping("/roleMenu")
public class RoleMenuCo {

	private static final Logger logger = Logger.getLogger(RoleMenuCo.class);

	@Autowired
	private RoleMenuRepo roleMenuRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/auth/roleMenu/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<RoleMenuEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<RoleMenuEo> result = roleMenuRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping(path = "/delete", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp,
			@RequestBody RoleMenuEo roleMenu) {
		logger.debug("enter delete roleMenu");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (roleMenu == null || roleMenu.getId() == null) {
			logger.debug("roleMenu input empty");

			result.put("msg", requestContext.getMessage("roleMenu.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			roleMenuRepo.delete(roleMenu);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("roleMenu.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("roleMenu.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete roleMenu");
		return result;
	}

	@RequestMapping(path = "/create", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp,
			@RequestBody RoleMenuEo roleMenu) {
		logger.debug("enter create roleMenu");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (roleMenu == null) {
			logger.debug("roleMenu input empty");

			result.put("msg", requestContext.getMessage("roleMenu.create.error"));
			result.put("status", false);
			return result;
		}

		roleMenu.setId(IdGen.id32());

		try {
			roleMenu.setCreationTime(new Date());

			roleMenuRepo.save(roleMenu);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("roleMenu.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("roleMenu.create.ok"));
		result.put("status", true);

		logger.debug("leave create roleMenu");
		return result;
	}

	@RequestMapping(path = "/edit", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp,
			@RequestBody RoleMenuEo roleMenu) {
		logger.debug("enter edit roleMenu");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (roleMenu == null || StringUtils.isEmpty(roleMenu.getId())) {
			logger.debug("roleMenu input empty");

			result.put("msg", requestContext.getMessage("roleMenu.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			roleMenu.setUpdateTime(new Date());
			roleMenuRepo.save(roleMenu);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("roleMenu.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("roleMenu.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit roleMenu");
		return result;
	}
}
