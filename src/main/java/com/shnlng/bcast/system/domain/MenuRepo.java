package com.shnlng.bcast.system.domain;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.shnlng.bcast.system.domain.entity.MenuEo;

public interface MenuRepo extends PagingAndSortingRepository<MenuEo, String> {

	MenuEo findByKey(String key);

	List<MenuEo> findByParentIdOrderBySequenceAsc(String parentId);
	
	@Query("select m from MenuEo m order by m.sequence asc")
	Page<MenuEo> findAllPaged(Pageable pageable);
	
	@Query("select new MenuEo(m.id, m.key, m.prompt) from MenuEo m order by m.sequence asc")
	List<MenuEo> findOptions();
	
}
