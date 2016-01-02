package com.shnlng.bcast.device.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.device.domain.entity.BindingEo;

public interface BindingRepo extends PagingAndSortingRepository<BindingEo, String> {

	@Query("select b from BindingEo b where b.deviceId = :deviceId")
	Page<BindingEo> findBindingHistory(@Param("deviceId") String deviceId, Pageable pageable);
}
