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
import com.shnlng.bcast.system.entity.CategoryEo;
import com.shnlng.bcast.system.repository.CategoryRepo;

@Controller
@RequestMapping("/category")
public class CategoryCo {
	private static final Logger logger = Logger.getLogger(CategoryCo.class);

	@Autowired
	private CategoryRepo categoryRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/lookup/category/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<CategoryEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<CategoryEo> result = categoryRepo.findAll(pageable); // .findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, CategoryEo category) {
		logger.debug("enter delete category");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (category == null || category.getId() == null) {
			logger.debug("category input empty");

			result.put("msg", requestContext.getMessage("category.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			categoryRepo.delete(category);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("category.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("category.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete category");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, CategoryEo category) {
		logger.debug("enter create category");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (category == null) {
			logger.debug("category input empty");

			result.put("msg", requestContext.getMessage("category.create.error"));
			result.put("status", false);
			return result;
		}

		category.setId(IdGen.id32());

		try {
			category.setCreationTime(new Date());

			categoryRepo.save(category);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("category.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("category.create.ok"));
		result.put("status", true);

		logger.debug("leave create category");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, CategoryEo category) {
		logger.debug("enter edit category");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (category == null || StringUtils.isEmpty(category.getId())) {
			logger.debug("category input empty");

			result.put("msg", requestContext.getMessage("category.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			category.setUpdateTime(new Date());

			categoryRepo.save(category);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("category.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("category.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit category");
		return result;
	}

	@RequestMapping("/options")
	@ResponseBody
	public List<CategoryEo> options() {
		logger.debug("enter options");

		List<CategoryEo> catOptions = categoryRepo.findOptions();

		logger.debug("leave options");
		return catOptions;
	}
}
