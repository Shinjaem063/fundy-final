package com.kh.fundy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.CommentReply;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertComment(Comment c) {
		return session.insert("comment.insertComment", c);
	}
	
	@Override
	public int selectCommentCount(int projectNo) {
		return session.selectOne("comment.selectCommentCount", projectNo);
	}

	@Override
	public List<Comment> selectCommentList(int cPage, int numPerPage, int projectNo) {
		return session.selectList ("comment.selectCommentList", projectNo, new RowBounds((cPage-1)*numPerPage+1, numPerPage));
	}

	@Override
	public List<CommentReply> selectCommentReply(int commentNo) {
		return session.selectList("comment.selectCommentReply", commentNo);
	}

	@Override
	public int insertCommentReply(CommentReply cr) {
		return session.insert("comment.insertCommentReply", cr);
	}

	@Override
	public int updateComment(Comment c) {
		return session.update("comment.updateComment", c);
	}

	@Override
	public int updateCommentReply(CommentReply cr) {
		return session.update("comment.updateCommentReply", cr);
	}

	@Override
	public int deleteComment(Comment c) {
		return session.delete("comment.deleteComment", c);
	}

	@Override
	public int deleteCommentReply(CommentReply cr) {
		return session.delete("comment.deleteCommentReply", cr);
	}
	
}
