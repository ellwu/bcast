package com.shnlng.bcast.device.web;

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
import com.shnlng.bcast.device.domain.DeviceRepo;
import com.shnlng.bcast.device.domain.entity.DeviceEo;

@Controller
@RequestMapping("/device")
public class DeviceCo {

	private static final Logger logger = Logger.getLogger(DeviceCo.class);

	@Autowired
	private DeviceRepo deviceRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/device/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<DeviceEo> list(Pageable pageable) {
		logger.debug("enter list");

		Page<DeviceEo> result = deviceRepo.findAllActive(pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, DeviceEo device) {
		logger.debug("enter delete device");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (device == null || device.getId() == null) {
			logger.debug("device input empty");

			result.put("msg", requestContext.getMessage("device.delete.error"));
			result.put("status", false);
			return result;
		}

		try {
			
			deviceRepo.deleteAndDisable(device.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("device.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("device.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete device");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, DeviceEo device) {
		logger.debug("enter create device");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (device == null) {
			logger.debug("device input empty");

			result.put("msg", requestContext.getMessage("device.create.error"));
			result.put("status", false);
			return result;
		}

		device.setId(IdGen.id32());

		try {
			device.setCreationTime(new Date());

			deviceRepo.save(device);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("device.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("device.create.ok"));
		result.put("status", true);

		logger.debug("leave create device");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, DeviceEo device) {
		logger.debug("enter edit device");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (device == null || StringUtils.isEmpty(device.getId())) {
			logger.debug("device input empty");

			result.put("msg", requestContext.getMessage("device.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			device.setUpdateTime(new Date());

			deviceRepo.save(device);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("device.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("device.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit device");
		return result;
	}
}
