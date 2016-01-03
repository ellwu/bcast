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
import com.shnlng.bcast.device.domain.entity.BindingEo;
import com.shnlng.bcast.device.domain.entity.DeviceEo;
import com.shnlng.bcast.device.service.BindingSo;

@Controller
@RequestMapping("/binding")
public class BindingCo {

	private static final Logger logger = Logger.getLogger(BindingCo.class);

	@Autowired
	private BindingSo bSo;
	@Autowired
	private DeviceRepo dRepo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/binding/home";
	}

	@RequestMapping("/history")
	@ResponseBody
	public Page<BindingEo> history(String deviceId, Pageable pageable) {
		logger.debug("enter history");

		Page<BindingEo> result = bSo.findBindingHistory(deviceId, pageable);

		logger.debug("leave history");
		return result;
	}

	@RequestMapping("/release")
	@ResponseBody
	public Map<String, Object> release(DeviceEo d, HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter release");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (d == null || StringUtils.isEmpty(d.getId())) {
			logger.debug("device input empty");

			result.put("msg", requestContext.getMessage("bind.release.error"));
			result.put("status", false);
			return result;
		}

		String deviceId = d.getId();

		try {
			DeviceEo device = dRepo.findOne(deviceId);

			device.setBindStatus("2");

			dRepo.save(device);

			bSo.bRepo.release(deviceId, new Date());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("bind.release.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("bind.release.ok"));
		result.put("status", true);

		logger.debug("leave release");
		return result;
	}

	@RequestMapping("/bind")
	@ResponseBody
	public Map<String, Object> bind(String deviceId, String merchantId, HttpServletRequest req,
			HttpServletResponse resp) {
		logger.debug("enter bind");

		logger.debug("enter delete device");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (StringUtils.isEmpty(deviceId)) {
			logger.debug("device input empty");

			result.put("msg", requestContext.getMessage("bind.create.error"));
			result.put("status", false);
			return result;
		}

		if (StringUtils.isEmpty(merchantId)) {
			logger.debug("device input empty");

			result.put("msg", requestContext.getMessage("bind.create.error"));
			result.put("status", false);
			return result;
		}

		try {
			BindingEo bind = new BindingEo();

			bind.setId(IdGen.id32());
			bind.setMerchantId(merchantId);
			bind.setDeviceId(deviceId);
			bind.setBindTime(new Date());
			bind.setStatus("1");

			bSo.bRepo.save(bind);

			DeviceEo device = dRepo.findOne(deviceId);

			device.setBindStatus("1");

			dRepo.save(device);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("bind.create.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("bind.create.ok"));
		result.put("status", true);

		logger.debug("enter bind");
		return result;
	}
}
