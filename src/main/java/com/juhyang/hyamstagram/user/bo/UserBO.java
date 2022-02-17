package com.juhyang.hyamstagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.hyamstagram.common.EncryptUtils;
import com.juhyang.hyamstagram.common.FileManagerService;
import com.juhyang.hyamstagram.user.dao.UserDAO;
import com.juhyang.hyamstagram.user.model.User;

@Service
public class UserBO {
@Autowired
UserDAO userDAO;




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

public User getAfterEditUser(
		String loginId
		) {
	return userDAO.selectAfterEditUser(loginId);
}


// user ID 중복 확인
public boolean checkUser(String loginId) {
	return userDAO.countUser(loginId);
	
}

public int editUser(int userId, String userName, String loginId, String introduce, MultipartFile file) {
	String filePath = FileManagerService.saveFile(userId, file);
	
	return userDAO.updateUser(userId, userName, loginId,introduce,filePath);
}

public String getImagePath(int post_userId) {
	
	return userDAO.selectImagePath(post_userId);
}


}
