package com.shnlng.bcast.device.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.device.domain.DeviceRepo;
import com.shnlng.bcast.device.domain.entity.DeviceEo;
import com.shnlng.bcast.system.domain.LookupRepo;
import com.shnlng.bcast.system.domain.entity.LookupEo;

@Service
public class DeviceService {
	@Autowired
	public DeviceRepo deviceRepo;
	@Autowired
	private LookupRepo lRepo;

	public Page<DeviceEo> queryActive(String sn, String batch, Pageable pageable) {
		if(StringUtils.isEmpty(sn)){
			sn = null;
		}
		
		if(StringUtils.isEmpty(batch)){
			batch = null;
		}

		Page<DeviceEo> devices = deviceRepo.queryActive(sn, batch, pageable);

		List<LookupEo> status = lRepo.findByCategoryKey("DEVICE_STATUS");
		List<LookupEo> bindStatus = lRepo.findByCategoryKey("DEVICE_BIND_STATUS");

		List<DeviceEo> tmps = devices.getContent();
		for (DeviceEo d : tmps) {
			for (LookupEo s : status) {
				if (d.getStatus().equals(s.getValue())) {
					d.setStatusDesc(s.getDesc());
					break;
				}
			}

			for (LookupEo bs : bindStatus) {
				if (d.getBindStatus().equals(bs.getValue())) {
					d.setBindStatusDesc(bs.getDesc());
					break;
				}
			}
		}

		return devices;
	}
}
