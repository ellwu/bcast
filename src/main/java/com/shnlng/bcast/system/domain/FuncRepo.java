package com.shnlng.bcast.system.domain;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.system.domain.entity.FuncEo;

public interface FuncRepo extends PagingAndSortingRepository<FuncEo, String>{

	@Query("select new FuncEo(f.id, f.key, f.prompt) from FuncEo f")
	List<FuncEo> findOptions();
	
	@Query("select f from FuncEo f where f.key = :key")
	FuncEo findByKey(@Param("key") String key);
}
