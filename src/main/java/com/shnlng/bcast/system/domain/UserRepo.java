package com.shnlng.bcast.system.domain;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.domain.entity.UserEo;

public interface UserRepo extends PagingAndSortingRepository<UserEo, String> {

	UserEo findByName(String name);

	@Query("select new UserEo(u.id, u.name) from UserEo u")
	List<UserEo> findOptions();
}
