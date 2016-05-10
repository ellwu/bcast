package com.shnlng.bcast.count.domain;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.count.domain.value.QrCountVo;

public interface QrCountRepo extends PagingAndSortingRepository<QrCountVo, String> {

	@Query("select qc from QrCountVo qc where qc.id = :resourceId")
	Page<QrCountVo> findByResourceId(@Param("resourceId") String resourceId, Pageable pageable);
}
