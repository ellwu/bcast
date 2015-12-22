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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.system.domain.LookupRepo;
import com.shnlng.bcast.system.domain.entity.LookupEo;

@Controller
@RequestMapping("/lookup")
public class LookupCo {

	private static final Logger logger = Logger.getLogger(LookupCo.class);

	@Autowired
	private LookupRepo lookupRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/lookup/value/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<LookupEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<LookupEo> result = lookupRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping(path = "/delete", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, @RequestBody LookupEo lookup) {
		logger.debug("enter delete lookup");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (lookup == null || lookup.getId() == null) {
			logger.debug("lookup input empty");

			result.put("msg", requestContext.getMessage("lookup.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			lookupRepo.delete(lookup);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("lookup.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("lookup.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete lookup");
		return result;
	}

	@RequestMapping(path = "/create", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, @RequestBody LookupEo lookup) {
		logger.debug("enter create lookup");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (lookup == null) {
			logger.debug("lookup input empty");

			result.put("msg", requestContext.getMessage("lookup.create.error"));
			result.put("status", false);
			return result;
		}

		lookup.setId(IdGen.id32());

		try {
			lookup.setCreationTime(new Date());

			lookupRepo.save(lookup);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("lookup.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("lookup.create.ok"));
		result.put("status", true);

		logger.debug("leave create lookup");
		return result;
	}

	@RequestMapping(path = "/edit", consumes = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, @RequestBody LookupEo lookup) {
		logger.debug("enter edit lookup");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (lookup == null || StringUtils.isEmpty(lookup.getId())) {
			logger.debug("lookup input empty");

			result.put("msg", requestContext.getMessage("lookup.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			lookup.setUpdateTime(new Date());

			lookupRepo.save(lookup);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("lookup.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("lookup.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit lookup");
		return result;
	}

	@RequestMapping("/values")
	@ResponseBody
	public List<LookupEo> values(String categoryKey) {
		logger.debug("enter values");

		List<LookupEo> result = lookupRepo.findByCategoryKey(categoryKey);

		logger.debug("leave values");
		return result;
	}
}
