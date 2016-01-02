package com.shnlng.bcast.device.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.device.domain.BindingRepo;
import com.shnlng.bcast.device.domain.entity.BindingEo;
import com.shnlng.bcast.merchant.domain.MerchantRepo;
import com.shnlng.bcast.merchant.domain.entity.MerchantEo;
import com.shnlng.bcast.system.domain.LookupRepo;

@Service
public class BindingSo {
	@Autowired
	public BindingRepo bRepo;
	@Autowired
	private MerchantRepo mRepo;
	@Autowired
	private LookupRepo lRepo;

	public Page<BindingEo> findBindingHistory(String deviceId, Pageable pageable) {
		
		Page<BindingEo> bindings = bRepo.findBindingHistory(deviceId, pageable);
		
		Map<String, String> merchantMaps = new HashMap<String, String>();
		for(BindingEo t : bindings){
			merchantMaps.put(t.getMerchantId(), "");
		}
		
		for(String mId : merchantMaps.keySet()){
			MerchantEo m = mRepo.findOne(mId);
			if(m != null){
				merchantMaps.put(mId, m.getName());
			}
		}
		
		for(BindingEo b : bindings){
			b.setMerchant(merchantMaps.get(b.getMerchantId()));
		}
		return bindings;
	}
}
