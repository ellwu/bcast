package com.shnlng.bcast.system.controller;

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
import com.shnlng.bcast.system.entity.RoleEo;
import com.shnlng.bcast.system.repository.RoleRepo;

@Controller
@RequestMapping("/role")
public class RoleCo {

	private static final Logger logger = Logger.getLogger(RoleCo.class);

	@Autowired
	private RoleRepo roleRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/auth/role/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<RoleEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<RoleEo> result = roleRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, RoleEo role) {
		logger.debug("enter delete role");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (role == null || role.getId() == null) {
			logger.debug("role input empty");

			result.put("msg", requestContext.getMessage("role.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			roleRepo.delete(role);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("role.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("role.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete role");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, RoleEo role) {
		logger.debug("enter create role");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (role == null) {
			logger.debug("role input empty");

			result.put("msg", requestContext.getMessage("role.create.error"));
			result.put("status", false);
			return result;
		}

		role.setId(IdGen.id32());

		try {
			role.setCreationTime(new Date());

			roleRepo.save(role);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("role.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("role.create.ok"));
		result.put("status", true);

		logger.debug("leave create role");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, RoleEo role) {
		logger.debug("enter edit role");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (role == null || StringUtils.isEmpty(role.getId())) {
			logger.debug("role input empty");

			result.put("msg", requestContext.getMessage("role.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			role.setUpdateTime(new Date());

			roleRepo.save(role);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("role.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("role.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit role");
		return result;
	}

	@RequestMapping("/options")
	@ResponseBody
	public List<RoleEo> options() {
		logger.debug("enter options");

		List<RoleEo> roleOptions = roleRepo.findOptions();

		logger.debug("leave options");
		return roleOptions;
	}
}
