package com.shnlng.bcast.resource.domain;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.resource.domain.entity.TargetEo;

public interface TargetRepo extends PagingAndSortingRepository<TargetEo, String> {
	@Transactional
	@Modifying
	@Query("update TargetEo t set t.deleteFlag = 1, t.disableFlag = 1 where t.id = :id")
	int deleteAndDisable(@Param("id") String id);

	@Query("select t from TargetEo t where t.deleteFlag = 0 and (:sn is null or t.sn like :sn) and (:merchant is null or t.merchantId in (select m.id from MerchantEo m where m.name like :merchant)) and (:resource is null or t.resourceId in (select r.id from ResourceEo r where r.originName like :resource))")
	Page<TargetEo> queryActive(@Param("sn") String sn, @Param("resource") String resource,
			@Param("merchant") String merchant, Pageable pageable);
	
	@Query("select t from TargetEo t where t.deleteFlag = 0 and t.disableFlag = 0 and t.merchantId = :merchantId order by t.playSequence asc")
	List<TargetEo> findMerchantTargets(@Param("merchantId") String merchantId);
	
	@Query("select max(t.playSequence) from TargetEo t where t.merchantId = :merchantId")
	Integer findMaxSequence(@Param("merchantId") String merchantId);
}
