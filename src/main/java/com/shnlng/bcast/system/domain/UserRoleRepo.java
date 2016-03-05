package com.shnlng.bcast.system.domain;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.system.domain.entity.RoleEo;
import com.shnlng.bcast.system.domain.entity.UserRoleEo;

public interface UserRoleRepo extends PagingAndSortingRepository<UserRoleEo, String>{
	@Query("select r from RoleEo r where r.id = (select ur.roleId from UserRoleEo ur where ur.userId = :userId)")
	RoleEo findUserRole(@Param("userId") String userId);
}
