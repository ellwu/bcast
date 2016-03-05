package com.shnlng.bcast.system.domain;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.shnlng.bcast.system.domain.entity.MenuEo;
import com.shnlng.bcast.system.domain.entity.RoleMenuEo;

public interface RoleMenuRepo extends PagingAndSortingRepository<RoleMenuEo, String>{
	
	@Query("select m from MenuEo m where m.id = (select rm.menuId from RoleMenuEo rm where rm.roleId = :roleId)")
	MenuEo findRoleMenu(@Param("roleId") String roleId);
}
