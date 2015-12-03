package com.shnlng.bcast.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.system.entity.LookupEo;

public interface LookupRepo extends PagingAndSortingRepository<LookupEo, String>{
	
	@Query("select new LookupEo(l.key, l.value, l.desc) from LookupEo l, CategoryEo c where c.id = l.categoryId and c.key = :key")
	List<LookupEo> findByCategoryKey(@Param("key") String categoryKey);
}
