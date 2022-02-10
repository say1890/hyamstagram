package com.juhyang.hyamstagram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	int addLike(@Param("postId") int postId, 
			@Param("userId")int userId,
			@Param("userName")String userName);

	int selectLike(@Param("postId") int postId);

}
