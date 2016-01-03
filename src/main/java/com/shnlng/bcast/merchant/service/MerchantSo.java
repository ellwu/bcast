package com.shnlng.bcast.merchant.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.merchant.domain.MerchantRepo;
import com.shnlng.bcast.merchant.domain.entity.MerchantEo;
import com.shnlng.bcast.system.domain.LookupRepo;
import com.shnlng.bcast.system.domain.entity.LookupEo;

@Service
public class MerchantSo {
	@Autowired
	public MerchantRepo merchantRepo;
	@Autowired
	private LookupRepo lRepo;

	public Page<MerchantEo> queryActive(String name, String level, String category, Pageable pageable) {
		if (StringUtils.isEmpty(name)) {
			name = null;
		}

		if (StringUtils.isEmpty(level)) {
			level = null;
		}

		if (StringUtils.isEmpty(category)) {
			category = null;
		}

		Page<MerchantEo> merchants = merchantRepo.queryActive(name, level, category, pageable);

		final List<LookupEo> levels = lRepo.findByCategoryKey("MERCHANT_LEVEL");
		final List<LookupEo> categories = lRepo.findByCategoryKey("MERCHANT_CATEGORY");

		List<MerchantEo> tmps = merchants.getContent();
		for (MerchantEo m : tmps) {
			for (LookupEo l : levels) {
				if (m.getLevel().equals(l.getValue())) {
					m.setLevelDesc(l.getDesc());
					break;
				}
			}

			for (LookupEo c : categories) {
				if (m.getCategory().equals(c.getValue())) {
					m.setCategoryDesc(c.getDesc());
					break;
				}
			}
		}

		return merchants;
	}
}
