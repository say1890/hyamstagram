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
	public int addLike(int postId, int userId){
		return likeDAO.addLike(postId, userId);
		
	}
	public Integer selectLike(int postId) {
		
		return likeDAO.selectLike(postId);
	}
	public List<Like> getLikeList() {
		return likeDAO.selectLikeList();
	}
	
	// 좋아요 여부 확인
	public boolean likeByUserId(int postId, int userId) {
		int count = likeDAO.selectCountLikeByUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
		
		//return !(likeDAO.selectCountLikeByUserId(postId, userId) ==0 );
	}
}
