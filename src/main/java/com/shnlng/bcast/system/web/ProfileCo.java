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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.system.domain.ProfileRepo;
import com.shnlng.bcast.system.domain.entity.ProfileEo;

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
		return "/system/profile/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<ProfileEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<ProfileEo> result = profileRepo.findAll(pageable); // .findAll(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, ProfileEo profile) {
		logger.debug("enter delete profile");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (profile == null || profile.getId() == null) {
			logger.debug("profile input empty");

			result.put("msg", requestContext.getMessage("profile.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			profileRepo.delete(profile);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("profile.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("profile.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete profile");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, ProfileEo profile) {
		logger.debug("enter create profile");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (profile == null) {
			logger.debug("profile input empty");

			result.put("msg", requestContext.getMessage("profile.create.error"));
			result.put("status", false);
			return result;
		}

		profile.setId(IdGen.id32());

		try {
			profile.setCreationTime(new Date());

			profileRepo.save(profile);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("profile.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("profile.create.ok"));
		result.put("status", true);

		logger.debug("leave create profile");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, ProfileEo profile) {
		logger.debug("enter edit profile");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (profile == null || StringUtils.isEmpty(profile.getId())) {
			logger.debug("profile input empty");

			result.put("msg", requestContext.getMessage("profile.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			profile.setUpdateTime(new Date());

			profileRepo.save(profile);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("profile.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("profile.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit profile");
		return result;
	}

	@RequestMapping("/value")
	@ResponseBody
	public String value(String key) {
		logger.debug("enter value");

		String value = profileRepo.findValueByKey(key);

		logger.debug("enter value");
		return value;
	}
}
