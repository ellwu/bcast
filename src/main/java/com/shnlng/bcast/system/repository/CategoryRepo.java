package com.shnlng.bcast.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.entity.CategoryEo;

public interface CategoryRepo extends PagingAndSortingRepository<CategoryEo, String> {

	@Query("select new CategoryEo(c.id, c.key, c.prompt) from CategoryEo c")
	List<CategoryEo> findOptions();
}
