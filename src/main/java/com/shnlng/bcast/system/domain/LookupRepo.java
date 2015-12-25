package com.shnlng.bcast.system.domain;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.system.domain.entity.LookupEo;

public interface LookupRepo extends PagingAndSortingRepository<LookupEo, String>{
	
	@Cacheable(value="lookupCache", key="#categoryKey")
	@Query("select new LookupEo(l.key, l.value, l.desc) from LookupEo l, CategoryEo c where c.id = l.categoryId and c.key = :key")
	List<LookupEo> findByCategoryKey(@Param("key") String categoryKey);
	
	@Query("select l from LookupEo l order by l.categoryId, l.key desc")
	Page<LookupEo> findAllOrderByCategoryAndKey(Pageable pageable);
}
