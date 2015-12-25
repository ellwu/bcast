package com.shnlng.bcast.resource.web;

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

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.resource.domain.ResourceRepo;
import com.shnlng.bcast.resource.domain.entity.ResourceEo;

@Controller
@RequestMapping("/resource")
public class ResourceCo {

	private static final Logger logger = Logger.getLogger(ResourceCo.class);

	@Autowired
	private ResourceRepo resourceRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/resource/home";
	}
	
	@RequestMapping("/createResource")
	public String createResource(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter createResource");

		logger.debug("enter createResource");
		return "/resource/createResource";
	}
	
	@RequestMapping("/editResource")
	public String editResource(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter editResource");

		logger.debug("enter editResource");
		return "/resource/editResource";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<ResourceEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<ResourceEo> result = resourceRepo.findAllActive(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, ResourceEo resource) {
		logger.debug("enter delete resource");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (resource == null || resource.getId() == null) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			resourceRepo.deleteAndDisable(resource.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("resource.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete resource");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, ResourceEo resource) {
		logger.debug("enter create resource");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (resource == null) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		resource.setId(IdGen.id32());

		try {
			resource.setCreationTime(new Date());

			resourceRepo.save(resource);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("resource.create.ok"));
		result.put("status", true);

		logger.debug("leave create resource");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, ResourceEo resource) {
		logger.debug("enter edit resource");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (resource == null || StringUtils.isEmpty(resource.getId())) {
			logger.debug("resource input empty");

			result.put("msg", requestContext.getMessage("resource.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			resource.setUpdateTime(new Date());

			resourceRepo.save(resource);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("resource.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("resource.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit resource");
		return result;
	}

}
