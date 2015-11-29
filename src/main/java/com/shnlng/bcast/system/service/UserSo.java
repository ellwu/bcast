package com.shnlng.bcast.system.service;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shnlng.bcast.system.entity.UserEo;
import com.shnlng.bcast.system.repository.UserRepo;

@Service
public class UserSo {
	private static final Logger logger = Logger.getLogger(UserSo.class);

	@Autowired
	private UserRepo userRepository;
	
	public boolean validateUserCredential(UserEo user){
		logger.debug("enter validateUserCredential");
		
		if(user == null || StringUtils.isEmpty(user.getName())){
			logger.debug("empty user input");
			return false;
		}
		
		UserEo rightUser = userRepository.findByName(user.getName());
		
		if(rightUser == null){
			logger.debug("validate user not exists");
			return false;
		}
		
		String testPwd = user.getPassword();
		String dbPwd = rightUser.getPassword();

		logger.debug("leave validateUserCredential");
		return testPwd.equals(dbPwd);
	}
}