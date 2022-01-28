package com.juhyang.hyamstagram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

}
