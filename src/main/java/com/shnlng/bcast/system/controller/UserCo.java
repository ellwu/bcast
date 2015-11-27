package com.shnlng.bcast.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shnlng.bcast.base.util.IdGen;
import com.shnlng.bcast.system.entity.UserEo;
import com.shnlng.bcast.system.repository.UserRepo;

@Controller
@RequestMapping("/user")
public class UserCo {

	@Autowired
	private UserRepo userRepo;
	
	@RequestMapping("/home")
	public String toHome(){
		return "/base/user/home";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Page<UserEo> listUsers(Pageable pageable) {

		Page<UserEo> users = userRepo.findAll(pageable);
		return users;
	}

	@RequestMapping("/create")
	public String createUser() {
		UserEo user = new UserEo();
		user.setId(IdGen.id32());
		user.setName("admin");
		user.setPassword("admin");
		user.setDesc("admin");

		userRepo.save(user);

		return "index";
	}
}
