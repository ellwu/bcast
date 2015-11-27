package com.shnlng.bcast.system.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.entity.UserEo;

public interface UserRepo extends PagingAndSortingRepository<UserEo, String>{
	@SuppressWarnings("unchecked")
	UserEo save(UserEo user);

	UserEo findByName(String name);
}
