package com.shnlng.bcast.system.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.system.entity.MenuEo;
import com.shnlng.bcast.system.repository.MenuRepo;

@Service
public class MenuSo {
	private static final Logger logger = Logger.getLogger(MenuSo.class);

	@Autowired
	private MenuRepo menuRepository;

	public MenuEo saveMenu(MenuEo menu) {
		logger.debug("enter save menu");

		MenuEo result = menuRepository.save(menu);

		logger.debug("leave save menu");
		return result;
	}
	
	public boolean deleteMenu(MenuEo menu) {
		logger.debug("enter delete menu");
		
		if(menu == null || menu.getId() == null){
			return false;
		}

		menuRepository.delete(menu.getId());

		logger.debug("leave delete menu");
		return true;
	}

	public MenuEo getMenu(String key) {
		logger.debug("enter getMenu");

		MenuEo menuTree = menuRepository.findByKey(key);

		logger.debug("leave getMenu");
		return menuTree;
	}

	public MenuEo getMenuTree(String key) {
		logger.debug("enter getMenuTree");

		MenuEo menuTree = menuRepository.findByKey(key);

		setChildMenus(menuTree);

		logger.debug("leave getMenuTree");
		return menuTree;
	}

	public void setChildMenus(MenuEo parentMenu) {
		logger.debug("enter getChildMenus");

		String parentId = parentMenu.getId();

		if (!StringUtils.isEmpty(parentId)) {
			logger.debug("set child menus");

			List<MenuEo> childMenus = menuRepository.findByParentIdOrderBySequenceAsc(parentId);

			if (childMenus != null && childMenus.size() > 0) {
				logger.debug("get child " + childMenus.size());

				parentMenu.setChildMenus(childMenus);

				for (MenuEo childM : childMenus) {
					setChildMenus(childM);
				}
			}
		}

		logger.debug("leave setChildMenus");
	}

	public Page<MenuEo> getAllMenus(Pageable pageable) {
		logger.debug("enter getAllMenus pageable");

		Page<MenuEo> pageMenus = menuRepository.findAll(pageable);

		logger.debug("leave getAllMenus pageable");
		return pageMenus;
	}
}
