package com.shnlng.bcast.count.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.count.domain.value.CountVo;

public interface CountRepo extends PagingAndSortingRepository<CountVo, String> {

	@Query("select c from CountVo c where c.merchantId = :merchantId")
	Page<CountVo> findByMerchantId(@Param("merchantId") String merchantId, Pageable pageable);
	
	@Query("select c from CountVo c where c.adverId = :adverId")
	Page<CountVo> findByAdverId(@Param("adverId") String adverId, Pageable pageable);
}
