package com.shnlng.bcast.merchant.web;

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
import com.shnlng.bcast.merchant.domain.entity.MerchantEo;
import com.shnlng.bcast.merchant.service.MerchantSo;
import com.shnlng.bcast.resource.domain.entity.TargetEo;
import com.shnlng.bcast.resource.service.TargetSo;

@Controller
@RequestMapping("/merchant")
public class MerchantCo {

	private static final Logger logger = Logger.getLogger(MerchantCo.class);

	@Autowired
	private MerchantSo mSo;
	@Autowired
	private TargetSo tSo;

	@RequestMapping("/home")
	public String home(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter home");

		logger.debug("enter home");
		return "/merchant/home";
	}

	@RequestMapping("/targetSequence")
	@ResponseBody
	public List<TargetEo> targetSequence(String merchantId) {
		logger.debug("enter list");

		List<TargetEo> result = tSo.findMerchantTargets(merchantId);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<MerchantEo> list(String name, String level, String category, Pageable pageable) {
		logger.debug("enter list");

		Page<MerchantEo> result = mSo.queryActive(name, level, category, pageable);

		logger.debug("leave list");
		return result;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest req, HttpServletResponse resp, MerchantEo merchant) {
		logger.debug("enter delete merchant");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (merchant == null || merchant.getId() == null) {
			logger.debug("merchant input empty");

			result.put("msg", requestContext.getMessage("merchant.delete.error"));
			result.put("status", false);
			return result;
		}

		try {

			mSo.merchantRepo.deleteAndDisable(merchant.getId());

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("merchant.delete.error"));
			result.put("status", false);
			return result;
		}
		result.put("msg", requestContext.getMessage("merchant.delete.ok"));
		result.put("status", true);

		logger.debug("enter delete merchant");
		return result;
	}

	@RequestMapping("/create")
	@ResponseBody
	public Map<String, Object> create(HttpServletRequest req, HttpServletResponse resp, MerchantEo merchant) {
		logger.debug("enter create merchant");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (merchant == null) {
			logger.debug("merchant input empty");

			result.put("msg", requestContext.getMessage("merchant.create.error"));
			result.put("status", false);
			return result;
		}

		merchant.setId(IdGen.id32());

		try {
			merchant.setCreationTime(new Date());

			mSo.merchantRepo.save(merchant);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("merchant.create.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("merchant.create.ok"));
		result.put("status", true);

		logger.debug("leave create merchant");
		return result;
	}

	@RequestMapping("/switchTargetSeq")
	@ResponseBody
	public Map<String, Object> switchTargetSeq(HttpServletRequest req, HttpServletResponse resp, String itemId, String destItemId) {
		logger.debug("enter switchTargetSeq");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (StringUtils.isEmpty(itemId) || StringUtils.isEmpty(destItemId)) {
			logger.debug("switch input empty");

			result.put("msg", requestContext.getMessage("merchant.switch.error"));
			result.put("status", false);
			return result;
		}

		try {
			TargetEo item = tSo.targetRepo.findOne(itemId);
			
			TargetEo destItem = tSo.targetRepo.findOne(destItemId);
			
			int tmpSeq = item.getPlaySequence();
			item.setPlaySequence(destItem.getPlaySequence());
			destItem.setPlaySequence(tmpSeq);

			tSo.targetRepo.save(item);
			tSo.targetRepo.save(destItem);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("merchant.switch.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("merchant.switch.ok"));
		result.put("status", true);

		logger.debug("leave switchTargetSeq");
		return result;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req, HttpServletResponse resp, MerchantEo merchant) {
		logger.debug("enter edit merchant");

		Map<String, Object> result = new HashMap<String, Object>();

		RequestContext requestContext = new RequestContext(req);

		if (merchant == null || StringUtils.isEmpty(merchant.getId())) {
			logger.debug("merchant input empty");

			result.put("msg", requestContext.getMessage("merchant.edit.error"));
			result.put("status", false);
			return result;
		}

		try {
			merchant.setUpdateTime(new Date());

			mSo.merchantRepo.save(merchant);

		} catch (Exception e) {
			logger.error(e.getMessage());

			result.put("msg", requestContext.getMessage("merchant.edit.error"));
			result.put("status", false);
			return result;
		}

		result.put("msg", requestContext.getMessage("merchant.edit.ok"));
		result.put("status", true);

		logger.debug("leave edit merchant");
		return result;
	}
}
