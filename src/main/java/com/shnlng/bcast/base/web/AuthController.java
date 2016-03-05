package com.shnlng.bcast.base.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContext;

import com.shnlng.bcast.system.domain.RoleMenuRepo;
import com.shnlng.bcast.system.domain.UserRoleRepo;
import com.shnlng.bcast.system.domain.entity.MenuEo;
import com.shnlng.bcast.system.domain.entity.RoleEo;
import com.shnlng.bcast.system.domain.entity.UserEo;
import com.shnlng.bcast.system.service.MenuSo;
import com.shnlng.bcast.system.service.UserSo;

@Controller
public class AuthController {
	private static final Logger logger = Logger.getLogger(AuthController.class);

	@Autowired
	private UserSo userService;

	@Autowired
	private MenuSo menuSo;
	@Autowired
	private RoleMenuRepo rmRepo;
	@Autowired
	private UserRoleRepo urRepo;

	@RequestMapping("/login")
	public String loginIndex() {

		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter logout");

		resetSession(req, resp);

		logger.debug("leave logout");
		return "login";
	}

	@RequestMapping("/valLogin")
	public String valLogin(UserEo user, HttpServletRequest req, HttpServletResponse resp, Model model) {
		logger.debug("enter valLogin");

		boolean validateUser = userService.validateUserCredential(user);

		RequestContext requestContext = new RequestContext(req);

		if (!validateUser) {
			logger.debug("validate failed");

			model.addAttribute("loginMsg", requestContext.getMessage("login.error"));
			return "login";
		}

		initSession(user, req, resp);

		logger.debug("leave valLogin");
		return "index";
	}

	private void initSession(UserEo user, HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter initSession");

		UserEo dbUser = userService.userRepository.findByName(user.getName());

		RoleEo userRole = urRepo.findUserRole(dbUser.getId());

		if (userRole == null) {
			return;
		}

		MenuEo userMenu = rmRepo.findRoleMenu(userRole.getId());

		if (userMenu == null) {
			return;
		}

		MenuEo rootMenu = menuSo.getMenuTree(userMenu.getKey());

		HttpSession session = req.getSession();

		session.setAttribute("_MENU", rootMenu);
		session.setAttribute("_ROLE", userRole.getName());

		logger.debug("leave initSession");
	}

	private void resetSession(HttpServletRequest req, HttpServletResponse resp) {
		logger.debug("enter resetSession");

		HttpSession session = req.getSession();

		session.invalidate();

		logger.debug("leave resetSession");
	}
}
