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

	// 좋아요 상태면 좋아요 취소 좋아요 아니면 좋아요
	// 리턴 - > 좋아요 = true 좋아요 취소 = false
	
	public boolean like(int postId, int userId){
		
		//좋아요 상태 - > 좋아요 취소
		if(this.likeByUserId(postId, userId)) {
			likeDAO.deleteLike(postId, userId);
			return false;
		}
		else {
			likeDAO.addLike(postId, userId);
			return true;
		}
		
		
		
		
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
