package com.shnlng.bcast.count.domain;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.count.domain.value.ScanCountVo;

public interface ScanCountRepo extends PagingAndSortingRepository<ScanCountVo, String> {

	@Query("select qc from ScanCountVo qc where qc.adverId = :adverId")
	Page<ScanCountVo> findByAdverId(@Param("adverId") String adverId, Pageable pageable);

	@Query("select qc.resourceName, qc.adverName, qc.merchantName ,count(qc.id) as c from ScanCountVo qc where (:adverId is null or qc.adverId = :adverId) and (:merchantId is null or qc.merchantId = :merchantId) and (:beginTime is null or qc.creationTime >= :beginTime) and (:endTime is null or qc.creationTime <= :endTime) group by qc.id, qc.merchantId, qc.adverId")
	Page<List<String>> findScanCount(@Param("adverId") String adverId, @Param("merchantId") String merchantId,
			@Param("beginTime") Date beginTime, @Param("endTime") Date endTime, Pageable pageable);
}
