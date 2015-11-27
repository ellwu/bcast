package com.shnlng.bcast.system.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.shnlng.bcast.system.entity.ProfileEo;
import com.shnlng.bcast.system.repository.ProfileRepo;

@Controller
@RequestMapping("/profile")
public class ProfileCo {
	private static final Logger logger = Logger.getLogger(ProfileCo.class);

	@Autowired
	private ProfileRepo profileRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/system/auth/profile/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<ProfileEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<ProfileEo> result = profileRepo.findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, ProfileEo p) {
		logger.debug("enter delete");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (p == null || p.getId() == null) {
			logger.debug("input empty");

			result.put("msg", requestContext.getMessage("profile.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			
			profileRepo.delete(p.getId());
			
		} catch (Exception e) {

			result.put("msg", requestContext.getMessage("profile.delete.ok"));
			result.put("status", true);
			return result;
		}

		logger.debug("leave delete");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, ProfileEo p) {
		logger.debug("enter create");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (p == null) {
			logger.debug("input empty");

			result.put("msg", requestContext.getMessage("profile.create.error"));
			result.put("status", false);
			return result;
		}

		p.setId(IdGen.id32());

		ProfileEo savedEo = profileRepo.save(p);
		if (savedEo != null) {

			result.put("msg", requestContext.getMessage("profile.create.ok"));
			result.put("status", true);
			return result;
		}

		logger.debug("leave create");
		return result;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest req, HttpServletResponse resp, ProfileEo p) {
		logger.debug("enter update");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (p == null) {
			logger.debug("input empty");

			result.put("msg", requestContext.getMessage("profile.create.error"));
			result.put("status", false);
			return result;
		}

		p.setId(IdGen.id32());

		ProfileEo savedEo = profileRepo.save(p);
		if (savedEo != null) {

			result.put("msg", requestContext.getMessage("profile.create.ok"));
			result.put("status", true);
			return result;
		}

		logger.debug("leave update");
		return result;
	}
}
