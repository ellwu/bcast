package com.shnlng.bcast.resource.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.adver.domain.AdverRepo;
import com.shnlng.bcast.adver.domain.entity.AdverEo;
import com.shnlng.bcast.resource.domain.ResourceRepo;
import com.shnlng.bcast.resource.domain.entity.ResourceEo;
import com.shnlng.bcast.system.domain.LookupRepo;
import com.shnlng.bcast.system.domain.entity.LookupEo;

@Service
public class ResourceSo {

	@Autowired
	public ResourceRepo resourceRepo;
	@Autowired
	private LookupRepo lRepo;
	@Autowired
	private AdverRepo adverRepo;

	public Page<ResourceEo> queryActive(String adver, String originName, String category, Pageable pageable) {
		if (StringUtils.isEmpty(adver)) {
			adver = null;
		}else{
			adver = "%" + adver + "%";
		}

		if (StringUtils.isEmpty(originName)) {
			originName = null;
		}else{
			originName = "%" + originName + "%";
		}

		if (StringUtils.isEmpty(category)) {
			category = null;
		}

		Page<ResourceEo> resources = resourceRepo.queryActive(adver, originName, category, pageable);

		List<LookupEo> categories = lRepo.findByCategoryKey("RESOURCE_CATEGORY");

		List<Object[]> advers = adverRepo.findAllNames();
		Map<String, String> adverIdNameMap = new HashMap<String, String>();
		for (Object[] a : advers) {
			adverIdNameMap.put((String) a[0], (String) a[1]);
		}

		List<ResourceEo> tmps = resources.getContent();
		for (ResourceEo a : tmps) {
			for (LookupEo c : categories) {
				if (c.getValue() != null && c.getValue().equals(a.getCategory())) {
					a.setCategoryDesc(c.getDesc());
					break;
				}
			}

			a.setAdver(adverIdNameMap.get(a.getAdverId()));
		}

		return resources;
	}

	public ResourceEo editOne(String resourceId) {

		ResourceEo resource = resourceRepo.findOne(resourceId);

		AdverEo adver = adverRepo.findOne(resource.getAdverId());
		
		if (adver != null) {
			resource.setAdver(adver.getName());
		}

		return resource;
	}
}
