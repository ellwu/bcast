package com.shnlng.bcast.system.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.entity.MenuEo;

public interface MenuRepo extends PagingAndSortingRepository<MenuEo, String> {
	@SuppressWarnings("unchecked")
	MenuEo save(MenuEo menu);

	MenuEo findByKey(String key);

	List<MenuEo> findByParentIdOrderBySequenceAsc(String parentId);
	
}
