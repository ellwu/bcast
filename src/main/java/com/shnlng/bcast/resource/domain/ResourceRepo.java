package com.shnlng.bcast.resource.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.resource.domain.entity.ResourceEo;

public interface ResourceRepo extends PagingAndSortingRepository<ResourceEo, String> {
	@Transactional
	@Modifying
	@Query("update ResourceEo r set r.deleteFlag = 1, r.disableFlag = 1 where r.id = :id")
	int deleteAndDisable(@Param("id") String id);

	@Query("select r from ResourceEo r where r.deleteFlag = 0")
	Page<ResourceEo> findAllActive(Pageable pageable);
}
