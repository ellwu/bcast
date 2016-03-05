package com.shnlng.bcast.device.domain;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.shnlng.bcast.device.domain.entity.BindingEo;

public interface BindingRepo extends PagingAndSortingRepository<BindingEo, String> {

	@Query("select b from BindingEo b where b.deviceId = :deviceId order by b.bindTime desc")
	Page<BindingEo> findBindingHistory(@Param("deviceId") String deviceId, Pageable pageable);

	@Transactional
	@Modifying
	@Query("update BindingEo b set b.status = '2', b.releaseTime = :releaseTime where b.releaseTime is null and b.deviceId = :deviceId")
	int release(@Param("deviceId") String deviceId, @Param("releaseTime") Date releaseTime);
	
}
