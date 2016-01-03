package com.shnlng.bcast.resource.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.merchant.domain.MerchantRepo;
import com.shnlng.bcast.merchant.domain.entity.MerchantEo;
import com.shnlng.bcast.resource.domain.ResourceRepo;
import com.shnlng.bcast.resource.domain.TargetRepo;
import com.shnlng.bcast.resource.domain.entity.ResourceEo;
import com.shnlng.bcast.resource.domain.entity.TargetEo;

@Service
public class TargetSo {

	@Autowired
	public TargetRepo targetRepo;
	@Autowired
	private MerchantRepo mRepo;
	@Autowired
	private ResourceRepo rRepo;

	public Page<TargetEo> queryActive(String sn, String resource, String merchant, Pageable pageable) {
		if (StringUtils.isEmpty(merchant)) {
			merchant = null;
		}

		if (StringUtils.isEmpty(resource)) {
			resource = null;
		}
		if (StringUtils.isEmpty(sn)) {
			sn = null;
		}

		Page<TargetEo> targets = targetRepo.queryActive(sn, resource, merchant, pageable);

		Map<String, String> merchantMaps = new HashMap<String, String>();
		for (TargetEo t : targets) {
			if (!StringUtils.isEmpty(t.getMerchantId())) {
				merchantMaps.put(t.getMerchantId(), "");
			}
		}

		for (String mId : merchantMaps.keySet()) {
			MerchantEo m = mRepo.findOne(mId);
			if (m != null) {
				merchantMaps.put(mId, m.getName());
			}
		}

		for (TargetEo t : targets) {
			t.setMerchant(merchantMaps.get(t.getMerchantId()));
		}

		Map<String, String> resourceMaps = new HashMap<String, String>();
		for (TargetEo t : targets) {
			if (!StringUtils.isEmpty(t.getResourceId())) {
				resourceMaps.put(t.getResourceId(), "");
			}
		}

		for (String rId : resourceMaps.keySet()) {
			ResourceEo r = rRepo.findOne(rId);
			if (r != null) {
				resourceMaps.put(rId, r.getOriginName());
			}
		}

		for (TargetEo t : targets) {
			t.setResource(resourceMaps.get(t.getResourceId()));
		}

		return targets;
	}

	public TargetEo editOne(String targetId) {

		if (StringUtils.isEmpty(targetId)) {
			return null;
		}

		TargetEo target = targetRepo.findOne(targetId);

		ResourceEo resource = rRepo.findOne(target.getResourceId());
		if (resource != null) {
			target.setResource(resource.getOriginName());
		}

		MerchantEo merchant = mRepo.findOne(target.getMerchantId());
		if (merchant != null) {
			target.setMerchant(merchant.getName());
		}

		return target;
	}

	public List<TargetEo> findMerchantTargets(String merchantId) {

		if (StringUtils.isEmpty(merchantId)) {
			return null;
		}

		List<TargetEo> targets = targetRepo.findMerchantTargets(merchantId);

		for (TargetEo t : targets) {
			ResourceEo resource = rRepo.findOne(t.getResourceId());
			if (resource != null) {
				t.setResource(resource.getOriginName());
			}
		}

		return targets;
	}

}
