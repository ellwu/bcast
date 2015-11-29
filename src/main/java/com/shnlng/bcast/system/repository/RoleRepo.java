package com.shnlng.bcast.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.entity.RoleEo;

public interface RoleRepo extends PagingAndSortingRepository<RoleEo, String> {
	@Query("select new RoleEo(r.id, r.name, r.desc) from RoleEo r")
	List<RoleEo> findOptions();
}
