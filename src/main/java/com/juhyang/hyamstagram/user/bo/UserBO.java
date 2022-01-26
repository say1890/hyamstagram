package com.juhyang.hyamstagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.hyamstagram.common.EncryptUtils;
import com.juhyang.hyamstagram.user.dao.UserDAO;
import com.juhyang.hyamstagram.user.model.User;

@Service
public class UserBO {
@Autowired
UserDAO userDAO;


public String login(String loginId,
		String password) {
	
	return userDAO.login(loginId, password);
}


// 회원가입 ( + 암호화 )

public int addUser(
		String loginId,
		String password,
		String user_name
		) {
	
	String encPassword = EncryptUtils.md5(password);
	return userDAO.insertUser(loginId, encPassword, user_name);

}

public User getUser
(	String loginId,
	String password
) {
	String encPw = EncryptUtils.md5(password);
	return userDAO.selectUser(loginId, encPw);
	
}


// user ID 중복 확인
public boolean checkUser(String loginId) {
	return userDAO.countUser(loginId);
	
}


}
