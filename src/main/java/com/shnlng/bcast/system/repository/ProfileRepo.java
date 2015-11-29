package com.shnlng.bcast.system.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.entity.ProfileEo;

public interface ProfileRepo extends PagingAndSortingRepository<ProfileEo, String>{
}
