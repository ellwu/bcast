package com.shnlng.bcast.base.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shnlng.bcast.system.domain.FuncRepo;
import com.shnlng.bcast.system.domain.entity.FuncEo;
import com.shnlng.bcast.system.domain.entity.MenuEo;
import com.shnlng.bcast.system.service.MenuSo;

@Controller
public class RouteController {
	private static final Logger logger = Logger.getLogger(RouteController.class);

	@Autowired
	private FuncRepo funcRepo;
	@Autowired
	private MenuSo menuSo;

	@RequestMapping("/route")
	public String toFunc(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter toFunc");

		String from = req.getParameter("from");
		if (StringUtils.isEmpty(from)) {
			return "404";
		}

		String currentMenuKey = req.getParameter("to");
		if (StringUtils.isEmpty(currentMenuKey)) {
			return "404";
		}

		MenuEo currentMenu = menuSo.getMenuTree(currentMenuKey);
		if (currentMenu == null) {
			return "404";
		}
		
		List<MenuEo> childMenus = currentMenu.getChildMenus();

		HttpSession session = req.getSession();
		
		session.setAttribute("_CRUMBS", menuSo.crumbs(currentMenu));

		boolean clickFromTopMenu = "top".equals(from);
		if (clickFromTopMenu) {
			session.setAttribute("_SIDE", childMenus);
			session.setAttribute("_TOP_KEY", currentMenu.getKey());
			session.setAttribute("_TOP_MENU", currentMenu);
		}

		String sideKey = null;
		boolean clickFromSideMenu = "side".equals(from);
		if (clickFromSideMenu) {
			sideKey = currentMenuKey;
		}

		String forwardToFuncId = null;
		for (MenuEo cM : childMenus) {

			if (!StringUtils.isEmpty(cM.getFuncId())) {
				forwardToFuncId = cM.getFuncId();

				if (clickFromTopMenu) {
					sideKey = cM.getKey();
				}
				break;
			}

		}

		String currentFuncId = currentMenu.getFuncId();
		if (!StringUtils.isEmpty(currentFuncId)) {
			forwardToFuncId = currentFuncId;
		}

		session.setAttribute("_SIDE_KEY", sideKey);

		if (StringUtils.isEmpty(forwardToFuncId)) {
			return "404";
		}

		FuncEo func = funcRepo.findOne(forwardToFuncId);
		if (func == null) {
			return "404";
		}

		try {
			logger.debug("forward to " + func.getUrl());

			req.getRequestDispatcher(func.getUrl()).forward(req, resp);
		} catch (ServletException e) {
			logger.error(e.getMessage());
		} catch (IOException e) {
			logger.error(e.getMessage());
		}

		logger.debug("leave toFunc");
		return null;
	}

	
}
