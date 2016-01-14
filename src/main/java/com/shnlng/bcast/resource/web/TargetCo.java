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
import com.shnlng.bcast.resource.domain.entity.TargetEo;
import com.shnlng.bcast.resource.service.TargetSo;

@Controller
@RequestMapping("/target")
public class TargetCo {

	private static final Logger logger = Logger.getLogger(TargetCo.class);

	@Autowired
	private TargetSo targetSo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/target/home";
	}

	@RequestMapping("/createTarget")
	public String createTarget(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter createTarget");

		logger.debug("enter createTarget");
		return "/target/createTarget";
	}

	@RequestMapping("/editTarget")
	public String editTarget(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter editTarget");

		logger.debug("enter editTarget");
		return "/target/editTarget";
	}

	@RequestMapping("/editOne")
	@ResponseBody
	public TargetEo editOne(String targetId, HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter editOne");

		TargetEo target = targetSo.editOne(targetId);

		logger.debug("enter editOne");
		return target;
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<TargetEo> list(String sn, String resource, String merchant, Pageable pageable) {
		logger.debug("enter list");

		Page<TargetEo> result = targetSo.queryActive(sn, resource, merchant, pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, TargetEo target) {
		logger.debug("enter delete target");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (target == null || target.getId() == null) {
			logger.debug("target input empty");

			result.put("msg", requestContext.getMessage("target.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			targetSo.targetRepo.deleteAndDisable(target.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("target.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("target.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete target");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, TargetEo target) {
		logger.debug("enter create target");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (target == null) {
			logger.debug("target input empty");

			result.put("msg", requestContext.getMessage("target.create.error"));
			result.put("status", false);
			return result;
		}

		target.setId(IdGen.id32());

		try {
			Integer maxSeq = targetSo.targetRepo.findMaxSequence(target.getMerchantId());
			
			if(maxSeq == null){
				maxSeq = 1;
			}else{
				maxSeq += 1;
			}
			
			target.setPlaySequence(maxSeq);
			target.setStatus(1);
			
			target.setCreationTime(new Date());

			targetSo.targetRepo.save(target);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("target.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("target.create.ok"));
		result.put("status", true);

		logger.debug("leave create target");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, TargetEo target) {
		logger.debug("enter edit target");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (target == null || StringUtils.isEmpty(target.getId())) {
			logger.debug("target input empty");

			result.put("msg", requestContext.getMessage("target.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			target.setUpdateTime(new Date());

			targetSo.targetRepo.save(target);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("target.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("target.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit target");
		return result;
	}

}
