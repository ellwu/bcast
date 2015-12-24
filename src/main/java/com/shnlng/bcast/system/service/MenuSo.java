package com.shnlng.bcast.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.system.domain.MenuRepo;
import com.shnlng.bcast.system.domain.entity.MenuEo;

@Service
public class MenuSo {
	private static final Logger logger = Logger.getLogger(MenuSo.class);

	@Autowired
	public MenuRepo menuRepository;

	public MenuEo buildTree() {
		logger.info("enter build menu tree");

		MenuEo rootMenu = popMenus("M_ROOT");

		logger.info("leave build menu tree");
		return rootMenu;
	}

	public MenuEo getMenuTree(String key) {
		logger.info("enter build menu tree");
		MenuEo menu = null;

		if (StringUtils.isEmpty(key)) {
			return menu;
		}

		menu = popMenus(key);

		logger.info("leave build menu tree");
		return menu;
	}
	
	public List<MenuEo> crumbs(MenuEo currentMenu) {
		List<MenuEo> returns = new ArrayList<MenuEo>();
		
		Stack<MenuEo> menus = new Stack<MenuEo>();

		MenuEo cMenu = currentMenu;
		MenuEo parentMenu = cMenu.getParentMenu();

		while (parentMenu != null && parentMenu.getParentMenu() != null) {
			menus.push(parentMenu);

			cMenu = parentMenu;
			parentMenu = cMenu.getParentMenu();
		}

		while(!menus.isEmpty()){
			returns.add(menus.pop());
		}
		returns.add(currentMenu);
		
		return returns;
	}

	private MenuEo popMenus(String key) {
		List<MenuEo> menus = menuRepository.findAllOrderBySequenceAsc();

		Map<String, MenuEo> parentMenus = new HashMap<String, MenuEo>();
		for (MenuEo m : menus) {
			parentMenus.put(m.getId(), m);
		}

		for (MenuEo c : menus) {
			MenuEo p = parentMenus.get(c.getParentId());
			if (p != null) {
				p.getChildMenus().add(c);
				c.setParentMenu(p);
			}
		}

		MenuEo popedMenu = null;
		for (MenuEo m : menus) {
			if (key.equals(m.getKey())) {
				popedMenu = m;
				break;
			}
		}

		return popedMenu;
	}

}
