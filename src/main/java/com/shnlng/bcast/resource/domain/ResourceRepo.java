package com.shnlng.bcast.resource.domain;

import java.util.Date;

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
	
	@Transactional
	@Modifying
	@Query("update ResourceEo r set r.deleteFlag = 1, r.disableFlag = 1 where r.adverId = :adverId")
	int deleteAndDisableByAdver(@Param("adverId") String adverId);

	@Query("select r from ResourceEo r where r.deleteFlag = 0")
	Page<ResourceEo> findAllActive(Pageable pageable);

	@Query("select r from ResourceEo r where r.deleteFlag = 0 and (:adver is null or r.adverId in (select a.id from AdverEo a where a.name like :adver)) and (:originName is null or r.originName like :originName) and (:category is null or r.category = :category) order by r.adverId")
	Page<ResourceEo> queryActive(@Param("adver") String adver, @Param("originName") String originName,
			@Param("category") String category, Pageable pageable);
	
	@Query("select count(t) from TargetEo t where t.status = 1 and t.disableFlag = 0 and t.deleteFlag = 0 and t.resourceId = :resourceId and t.beginTime <= :date and t.endTime >= :date")
	int countActiveTargets(@Param("resourceId") String resourceId, @Param("date") Date date);
}
