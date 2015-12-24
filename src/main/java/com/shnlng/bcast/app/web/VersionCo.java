package com.shnlng.bcast.app.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.app.domain.VersionRepo;
import com.shnlng.bcast.app.domain.entity.VersionEo;
import com.shnlng.bcast.base.util.IdGen;

@Controller
@RequestMapping("/app/version")
public class VersionCo {

	private static final Logger logger = Logger.getLogger(VersionCo.class);

	@Autowired
	private VersionRepo appRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/app/version/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<VersionEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<VersionEo> result = appRepo.findAllActive(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, VersionEo app) {
		logger.debug("enter delete versioin");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (app == null || app.getId() == null) {
			logger.debug("version input empty");

			result.put("msg", requestContext.getMessage("version.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			
			appRepo.deleteAndDisable(app.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("version.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("version.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete version");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, VersionEo app) {
		logger.debug("enter create version");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (app == null) {
			logger.debug("version input empty");

			result.put("msg", requestContext.getMessage("version.create.error"));
			result.put("status", false);
			return result;
		}

		app.setId(IdGen.id32());

		try {
			app.setCreationTime(new Date());

			appRepo.save(app);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("version.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("version.create.ok"));
		result.put("status", true);

		logger.debug("leave create version");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, VersionEo app) {
		logger.debug("enter edit version");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (app == null || StringUtils.isEmpty(app.getId())) {
			logger.debug("version input empty");

			result.put("msg", requestContext.getMessage("version.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			app.setUpdateTime(new Date());

			appRepo.save(app);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("version.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("version.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit version");
		return result;
	}
}
