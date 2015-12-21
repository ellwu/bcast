package com.shnlng.bcast.merchant.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.merchant.entity.MerchantEo;

public interface MerchantRepo extends PagingAndSortingRepository<MerchantEo, String> {
	@Transactional
	@Modifying
	@Query("update MerchantEo m set m.deleteFlag = 1, m.disableFlag = 1 where m.id = :id")
	int deleteAndDisable(@Param("id") String id);

	@Query("select m from MerchantEo m where m.deleteFlag = 0")
	Page<MerchantEo> findAllActive(Pageable pageable);
}
