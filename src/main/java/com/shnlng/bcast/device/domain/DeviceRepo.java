package com.shnlng.bcast.device.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.device.domain.entity.DeviceEo;

public interface DeviceRepo extends PagingAndSortingRepository<DeviceEo, String> {
	@Transactional
	@Modifying
	@Query("update DeviceEo device set device.deleteFlag = 1, device.disableFlag = 1 where device.id = :id")
	int deleteAndDisable(@Param("id") String id);
	
	@Query("select d from DeviceEo d where d.deleteFlag = 0 and (:sn is null or d.sn like :sn) and (:batch is null or d.batch like :batch)")
	Page<DeviceEo> queryActive(@Param("sn") String sn, @Param("batch") String batch, Pageable pageable);
}
