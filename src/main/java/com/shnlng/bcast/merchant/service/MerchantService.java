package com.shnlng.bcast.merchant.service;

import java.util.List;
import java.util.function.Consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.merchant.domain.MerchantRepo;
import com.shnlng.bcast.merchant.domain.entity.MerchantEo;
import com.shnlng.bcast.system.domain.LookupRepo;
import com.shnlng.bcast.system.domain.entity.LookupEo;

@Service
public class MerchantService {
	@Autowired
	public MerchantRepo merchantRepo;
	@Autowired
	private LookupRepo lRepo;
	
	public Page<MerchantEo> findAllActive(Pageable pageable){
		
		Page<MerchantEo> merchants = merchantRepo.findAllActive(pageable); 

		final List<LookupEo> levels = lRepo.findByCategoryKey("MERCHANT_LEVEL");
		final List<LookupEo> categories = lRepo.findByCategoryKey("MERCHANT_CATEGORY");
		
		Consumer<? super MerchantEo> action = new Consumer<MerchantEo>() {

			@Override
			public void accept(MerchantEo m) {
				for(LookupEo l : levels){
					if(m.getLevel() == Integer.parseInt(l.getValue())){
						m.setLevelDesc(l.getDesc());
						break;
					}
				}
				
				for(LookupEo c : categories){
					if(m.getCategory() == Integer.parseInt(c.getValue())){
						m.setCategoryDesc(c.getDesc());
						break;
					}
				}
			}
		};
		
		merchants.forEach(action);
		
		return merchants;
	}
}
