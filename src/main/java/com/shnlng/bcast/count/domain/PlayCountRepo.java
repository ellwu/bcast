package com.shnlng.bcast.count.domain;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.count.domain.value.PlayCountVo;

public interface PlayCountRepo extends PagingAndSortingRepository<PlayCountVo, String> {

	@Query("select c.resourceOriginName, c.adverName, c.merchantName, sum(c.time), sum(c.count), sum(c.devices) from PlayCountVo c where (:merchantId is null or c.merchantId = :merchantId) and (:adverId is null or c.adverId = :adverId) and (:beginTime is null or c.countTime >= :beginTime) and (:endTime is null or c.countTime <= :endTime) group by c.resourceOriginName, c.adverName, c.merchantName")
	Page<List<String>> findPlayCount(@Param("adverId") String adverId, @Param("merchantId") String merchantId,
			@Param("beginTime") Date beginTime, @Param("endTime") Date endTime, Pageable pageable);
}
