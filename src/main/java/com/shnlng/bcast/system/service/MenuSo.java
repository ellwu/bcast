package com.shnlng.bcast.system.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.system.entity.MenuEo;
import com.shnlng.bcast.system.repository.MenuRepo;

@Service
public class MenuSo {
	private static final Logger logger = Logger.getLogger(MenuSo.class);

	@Autowired
	public MenuRepo menuRepository;

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
}
