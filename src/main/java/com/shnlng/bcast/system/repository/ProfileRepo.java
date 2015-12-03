package com.shnlng.bcast.system.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.system.entity.ProfileEo;

public interface ProfileRepo extends PagingAndSortingRepository<ProfileEo, String>{
	
	@Query("select value from ProfileEo where key = :key")
	String findValueByKey(@Param("key") String key);
}
