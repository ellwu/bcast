package com.shnlng.bcast.count.web;

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

import com.shnlng.bcast.count.domain.CountRepo;
import com.shnlng.bcast.count.domain.QrCountRepo;
import com.shnlng.bcast.count.domain.value.CountVo;
import com.shnlng.bcast.count.domain.value.QrCountVo;

@Controller
@RequestMapping("/count")
public class CountCo {

	private static final Logger logger = Logger.getLogger(CountCo.class);

	@Autowired
	private CountRepo countRepo;
	@Autowired
	private QrCountRepo qrCountRepo;
	
	@RequestMapping("/byMerchant")
	public String byMerchant(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter byMerchant");

		logger.debug("enter byMerchant");
		return "/count/byMerchant";
	}	
	
	@RequestMapping("/byResource")
	public String byResource(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter byResource");

		logger.debug("enter byResource");
		return "/count/byResource";
	}
	
	@RequestMapping("/byAdver")
	public String byAdver(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter byAdver");

		logger.debug("enter byAdver");
		return "/count/byAdver";
	}
	
	@RequestMapping("/listByMerchant")
	@ResponseBody
	public Page<CountVo> listByMerchant(String merchantId, Pageable pageable) {
		logger.debug("enter listByMerchant");

		Page<CountVo> result = countRepo.findByMerchantId(merchantId, pageable);

		logger.debug("leave listByMerchant");
		return result;
	}
	
	@RequestMapping("/listByAdver")
	@ResponseBody
	public Page<CountVo> listByAdver(String adverId, Pageable pageable) {
		logger.debug("enter listByAdver");

		Page<CountVo> result = countRepo.findByAdverId(adverId, pageable);

		logger.debug("leave listByAdver");
		return result;
	}
	
	@RequestMapping("/listByResource")
	@ResponseBody
	public Page<QrCountVo> listByResource(String resourceId, Pageable pageable) {
		logger.debug("enter listByResource");

		Page<QrCountVo> result = qrCountRepo.findByResourceId(resourceId, pageable);

		logger.debug("leave listByResource");
		return result;
	}

}
