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
import com.shnlng.bcast.system.entity.FuncEo;
import com.shnlng.bcast.system.repository.FuncRepo;

@Controller
@RequestMapping("/func")
public class FuncCo {

	private static final Logger logger = Logger.getLogger(FuncCo.class);

	@Autowired
	private FuncRepo funcRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/auth/func/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<FuncEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<FuncEo> result = funcRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, FuncEo func) {
		logger.debug("enter delete func");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (func == null || func.getId() == null) {
			logger.debug("func input empty");

			result.put("msg", requestContext.getMessage("func.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			funcRepo.delete(func);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("func.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("func.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete func");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, FuncEo func) {
		logger.debug("enter create func");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (func == null) {
			logger.debug("func input empty");

			result.put("msg", requestContext.getMessage("func.create.error"));
			result.put("status", false);
			return result;
		}

		func.setId(IdGen.id32());

		try {
			func.setCreationTime(new Date());

			funcRepo.save(func);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("func.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("func.create.ok"));
		result.put("status", true);

		logger.debug("leave create func");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, FuncEo func) {
		logger.debug("enter edit func");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (func == null || StringUtils.isEmpty(func.getId())) {
			logger.debug("func input empty");

			result.put("msg", requestContext.getMessage("func.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			func.setUpdateTime(new Date());

			funcRepo.save(func);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("func.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("func.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit func");
		return result;
	}

	@RequestMapping("/options")
	@ResponseBody
	public List<FuncEo> options() {
		logger.debug("enter options");

		List<FuncEo> funcOptions = funcRepo.findOptions();

		logger.debug("leave options");
		return funcOptions;
	}
}
