package com.shnlng.bcast.app.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.app.domain.entity.VersionEo;

public interface VersionRepo extends PagingAndSortingRepository<VersionEo, String> {
	@Transactional
	@Modifying
	@Query("update VersionEo appVersion set appVersion.deleteFlag = 1, appVersion.disableFlag = 1 where appVersion.id = :id")
	int deleteAndDisable(@Param("id") String id);

	@Query("select appVersion from VersionEo appVersion where appVersion.deleteFlag = 0")
	Page<VersionEo> findAllActive(Pageable pageable);
}
