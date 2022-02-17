package com.juhyang.hyamstagram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.hyamstagram.user.model.User;

@Repository
public interface UserDAO {


	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password,
			@Param("user_name") String user_name
			);

	public boolean countUser(@Param("loginId") String loginId);

	public User selectUser(@Param("loginId")String loginId, 
			@Param("password") String password);

	public int updateUser(
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("loginId")  String loginId,
			@Param("introduce") String introduce, 
			@Param("imagePath") String imagePath
			);

	public User selectAfterEditUser(
			@Param("loginId")String loginId);

	public String selectImagePath(@Param("userId") int post_userId);

}
