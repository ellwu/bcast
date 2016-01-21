package com.shnlng.bcast.adver.web;

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

import com.shnlng.bcast.adver.domain.entity.AdverEo;
import com.shnlng.bcast.adver.service.AdverService;
import com.shnlng.bcast.base.util.IdGen;

@Controller
@RequestMapping("/adver")
public class AdverCo {

	private static final Logger logger = Logger.getLogger(AdverCo.class);

	@Autowired
	private AdverService adverSo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/adver/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<AdverEo> list(String name, String category, Pageable pageable) {
		logger.debug("enter list");

		Page<AdverEo> result = adverSo.queryActive(name, category, pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, AdverEo adver) {
		logger.debug("enter delete adver");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (adver == null || adver.getId() == null) {
			logger.debug("adver input empty");

			result.put("msg", requestContext.getMessage("adver.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			adverSo.adverRepo.deleteAndDisable(adver.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("adver.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("adver.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete adver");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, AdverEo adver) {
		logger.debug("enter create adver");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (adver == null) {
			logger.debug("adver input empty");

			result.put("msg", requestContext.getMessage("adver.create.error"));
			result.put("status", false);
			return result;
		}
		
		if (StringUtils.isEmpty(adver.getName())) {
			logger.debug("adver input empty");

			result.put("msg", requestContext.getMessage("adver.create.error.name"));
			result.put("status", false);
			return result;
		}

		adver.setId(IdGen.id32());

		try {
			adver.setCreationTime(new Date());

			adverSo.adverRepo.save(adver);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("adver.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("adver.create.ok"));
		result.put("status", true);

		logger.debug("leave create adver");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, AdverEo adver) {
		logger.debug("enter edit adver");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (adver == null || StringUtils.isEmpty(adver.getId())) {
			logger.debug("adver input empty");

			result.put("msg", requestContext.getMessage("adver.edit.error"));
			result.put("status", false);
			return result;
		}
		
		if (StringUtils.isEmpty(adver.getName())) {
			logger.debug("adver input empty");

			result.put("msg", requestContext.getMessage("adver.edit.error.name"));
			result.put("status", false);
			return result;
		}

		try {
			adver.setUpdateTime(new Date());

			adverSo.adverRepo.save(adver);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("adver.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("adver.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit adver");
		return result;
	}
	
}

