package com.shnlng.bcast.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.entity.FuncEo;

public interface FuncRepo extends PagingAndSortingRepository<FuncEo, String>{

	@Query("select new FuncEo(f.id, f.key, f.prompt) from FuncEo f")
	List<FuncEo> findOptions();
	
}
