package com.shnlng.bcast.adver.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.adver.domain.AdverRepo;
import com.shnlng.bcast.adver.domain.entity.AdverEo;
import com.shnlng.bcast.system.domain.LookupRepo;
import com.shnlng.bcast.system.domain.entity.LookupEo;

@Service
public class AdverService {
	@Autowired
	public AdverRepo adverRepo;
	@Autowired
	private LookupRepo lRepo;

	public Page<AdverEo> queryActive(String name, String category, Pageable pageable) {
		if (StringUtils.isEmpty(name)) {
			name = null;
		}else{
			name = "%" + name + "%";
		}

		if (StringUtils.isEmpty(category)) {
			category = null;
		}else{
			category = "%" + category + "%";
		}

		Page<AdverEo> advers = adverRepo.queryActive(name, category, pageable);

		List<LookupEo> categories = lRepo.findByCategoryKey("ADVER_CATEGORY");

		List<AdverEo> tmps = advers.getContent();
		for (AdverEo a : tmps) {
			for (LookupEo c : categories) {
				if (c.getValue().equals(a.getCategory())) {
					a.setCategoryDesc(c.getDesc());
					break;
				}
			}
		}

		return advers;
	}
}
