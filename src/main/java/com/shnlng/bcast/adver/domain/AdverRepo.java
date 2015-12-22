package com.shnlng.bcast.adver.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.adver.domain.entity.AdverEo;

public interface AdverRepo extends PagingAndSortingRepository<AdverEo, String> {
	@Transactional
	@Modifying
	@Query("update AdverEo a set a.deleteFlag = 1, a.disableFlag = 1 where a.id = :id")
	int deleteAndDisable(@Param("id") String id);

	@Query("select a from AdverEo a where a.deleteFlag = 0")
	Page<AdverEo> findAllActive(Pageable pageable);
}
