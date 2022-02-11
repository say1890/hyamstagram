package com.juhyang.hyamstagram.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.hyamstagram.like.dao.LikeDAO;
import com.juhyang.hyamstagram.like.model.Like;

@Service
public class LikeBO {
	@Autowired
	LikeDAO likeDAO;
	public int addLike(int postId, int userId, String userName){
		return likeDAO.addLike(postId, userId,userName);
		
	}
	public int selectLike(int postId) {
		
		return likeDAO.selectLike(postId);
	}
	public List<Like> getLikeList() {
		return likeDAO.selectLikeList();
	}
}
