package com.shnlng.bcast.count.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shnlng.bcast.count.domain.PlayCountRepo;
import com.shnlng.bcast.count.domain.ScanCountRepo;

@Controller
@RequestMapping("/count")
public class CountCo {

	private static final Logger logger = Logger.getLogger(CountCo.class);
	
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired
	private PlayCountRepo playCountRepo;
	@Autowired
	private ScanCountRepo scanCountRepo;
	
	@RequestMapping("/scanCount")
	public String scanCount(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter scanCount");

		logger.debug("enter scanCount");
		return "/count/scanCount";
	}	
	
	@RequestMapping("/playCount")
	public String playCount(HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter playCount");

		logger.debug("enter playCount");
		return "/count/playCount";
	}	
	
	@RequestMapping("/findScanCount")
	@ResponseBody
	public Page<List<String>> findScanCount(String adverId, String merchantId, String beginTime, String endTime, Pageable pageable) {
		logger.debug("enter findScanCount");
		
		Date beginTimeo = null;
		if(!StringUtils.isEmpty(beginTime)){
			try {
				beginTimeo = DATE_FORMAT.parse(beginTime);
			} catch (ParseException e) {
				beginTimeo = null;
				e.printStackTrace();
			}
		}
		
		Date endTimeo = null;
		if(!StringUtils.isEmpty(endTime)){
			try {
				endTimeo = DATE_FORMAT.parse(endTime);
			} catch (ParseException e) {
				endTimeo = null;
				e.printStackTrace();
			}
		}

		Page<List<String>> result = scanCountRepo.findScanCount(adverId, merchantId, beginTimeo, endTimeo, pageable);

		logger.debug("leave findScanCount");
		return result;
	}
	
	@RequestMapping("/findPlayCount")
	@ResponseBody
	public Page<List<String>> findPlayCount(String adverId, String merchantId, String beginTime, String endTime, Pageable pageable) {
		logger.debug("enter findPlayCount");
		
		Date beginTimeo = null;
		if(!StringUtils.isEmpty(beginTime)){
			try {
				beginTimeo = DATE_FORMAT.parse(beginTime);
			} catch (ParseException e) {
				beginTimeo = null;
				e.printStackTrace();
			}
		}
		
		Date endTimeo = null;
		if(!StringUtils.isEmpty(endTime)){
			try {
				endTimeo = DATE_FORMAT.parse(endTime);
			} catch (ParseException e) {
				endTimeo = null;
				e.printStackTrace();
			}
		}

		Page<List<String>> result = playCountRepo.findPlayCount(adverId, merchantId, beginTimeo, endTimeo, pageable);

		logger.debug("leave findPlayCount");
		return result;
	}

}
